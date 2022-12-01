function menurun = bombgame(username)

clc
close all

%Define Screen
BombGameScreen = simpleGameEngine('MinesweeperSprite.png',16,16,5,[255,255,255]);
BombGamedisplay = ones(10)

numberbombs = input("How many bombs would you like to have? ")

%Lets place some bombs
for i = 1:1:numberbombs
    x = randi(10)
    y = randi(10)
    BombGamedisplay(y,x) = 2
end
drawScene(BombGameScreen,BombGamedisplay)

numflags = 0 

%Are we still playing?
playing = true;
while playing == true
    %Loop to make the game portion of the game work
    while true
        %Define variables
        spotcounter = 0
        
        [x,y,z] = getMouseInput(BombGameScreen);
        
        %Let's uncover the bombs
        if BombGamedisplay(x,y) == 2 && z == 1
            BombGamedisplay(x,y) = 8
            break

        elseif  BombGamedisplay(x,y) == 2 && z == 3
            if numflags < numberbombs
                BombGamedisplay(x,y) = 7
                numflags = numflags + 1
            end
        
        %For the non-bomb spots        
        elseif BombGamedisplay(x,y) == 1 && z == 1
            
            %Checking around the spot
            for a = -1:1:1
                a = x + a
                for b = -1:1:1
                    b = y + b
                    if a < 10 && b < 10 && a > 0 && b > 0
                        if BombGamedisplay(a,b) == 2 | BombGamedisplay(a,b) == 7
                            spotcounter = spotcounter + 1
                        end
                    end
                end
            end
            
            if spotcounter > 0
                BombGamedisplay(x,y) = (8+spotcounter)
            else
                BombGamedisplay(x,y) = (5)
            end
            drawScene(BombGameScreen,BombGamedisplay)


        elseif BombGamedisplay(x,y) == 1 && z == 3
            if numflags < numberbombs
                BombGamedisplay(x,y) = 3
                numflags = numflags + 1
            end

        end
        
%         if length(k) == 1
%             if k == 'q'
%                 menurun = true
%                 close all
%                 return
%             end
    end
    % if numbombs = %sum(BombGamedisplay(:) == 7)
    %They won!
    end
    drawScene(BombGameScreen,BombGamedisplay)
    input('Play Again?')
end