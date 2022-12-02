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
            spotcounter = 0
            %Checking around the spot
            for a = -1:1:1
                d = x + a
                for b = -1:1:1
                    e = y + b
                    if d < 11 && e < 11 && d > 0 && e > 0
                        if BombGamedisplay(d,e) == 2 | BombGamedisplay(d,e) == 7
                            spotcounter = spotcounter + 1
                            BombGamedisplay
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
        drawScene(BombGameScreen,BombGamedisplay)

%         if length(k) == 1
%             if k == 'q'
%                 menurun = true
%                 close all
%                 return
%             end
    end
    % if numbombs = %sum(BombGamedisplay(:) == 7)
    %They won!
    drawScene(BombGameScreen,BombGamedisplay)
    end
    drawScene(BombGameScreen,BombGamedisplay)
    input('Play Again?')
end