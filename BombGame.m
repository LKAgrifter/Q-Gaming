function menurun = bombgame(username);

clc
close all

%Define Screen
BombGameScreen = simpleGameEngine('MinesweeperSprite.png',16,16,5,[255,255,255]);

%Are we still playing?
playing = true;
ingame = true;
wincounter = 0;

while playing == true
    
    %making sure the gridsize is bigger than 0
    gridsize = 0;
    while gridsize <= 0
        gridsize= input("How big do you want the grid to be? ");
    end

    %making sure the numberbombs is greater than 0
    numberbombs = 0;
    while numberbombs <= 0
        numberbombs = input("How many bombs would you like to have? ");
    end
    
    %Intitializing the early game
    BombGamedisplay = ones(gridsize);

    %Lets place some bombs
    for i = 1:1:numberbombs
        x = randi(gridsize)
        y = randi(gridsize)
        BombGamedisplay(y,x) = 2
    end
drawScene(BombGameScreen,BombGamedisplay)
title('')

numflags = 0 
    
    
    
    %Loop to make the game portion of the game work
    while ingame == true
        %Define variables
        
        [x,y,z] = getMouseInput(BombGameScreen);
        
        %Let's uncover the bombs
        if BombGamedisplay(x,y) == 2 && z == 1
            BombGamedisplay(x,y) = 8
            ingame = false
            win = false

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
                a = x + a
                for b = -1:1:1
                    b = y + b
                    if a <= gridsize && b <= gridsize && a > 0 && b > 0
                        if BombGamedisplay(a,b) == 2 | BombGamedisplay(a,b) == 7 | BombGamedisplay(a,b) == 8
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
    if numberbombs == sum(BombGamedisplay(:) == 7)
        win = true
        wincounter = wincounter + 1
    end
    drawScene(BombGameScreen,BombGamedisplay)
    
    %If we 
    if win == false
        title('You Lost, Press Space to Play Again, or A to Return To Menu')
        k = getKeyboardInput(BombGameScreen)
        if length(k) == 1
            if k == 'q'
                close all
                clc
                return
            end
        elseif length(k) == 5
            if k == 'space'
                fprintf('Ok we''re playing again!')
                ingame = true
            end
        end
    
    % End of small while loop
    end

    drawScene(BombGameScreen,BombGamedisplay)
end