function menurun = bombgame(username);

clc
close all

%Introduce the user
fprintf('Hey %s, welcome to Minesweeper!\n',username)

%Define Screen
BombGameScreen = simpleGameEngine('MinesweeperSprite.png',16,16,5,[255,255,255]);

%Are we still playing?
playing = true;
ingame = true;
wincounter = 0;

%import sounds
[explosion, explosion2] = audioread('mixkit-epic-impact-afar-explosion-2782.wav');
[click,click2] = audioread('Click - Sound Effect (HD).wav')

while playing == true

    %making sure the gridsize is bigger than 0
    gridsize = 0;
    while gridsize <= 1 | gridsize > 12
        gridsize= input("How big do you want the grid to be? It must be larger than 1 and no larger than 12. : ");
    end

    %making sure the numberbombs is greater than 0
    numberbombs = 0;
    while numberbombs <= 0 | numberbombs >= gridsize.^2
        numberbombs = input("How many bombs would you like to have? It must be smaller than the grid size squared. : ");
    end

    numberbombs;
    %Intitializing the early game
    BombGamedisplay = ones(gridsize);

    %Lets place some bombs
    for i = 1:1:numberbombs
        x = randi(gridsize);
        y = randi(gridsize);
        while BombGamedisplay(x,y) ==2
            x = randi(gridsize);
            y = randi(gridsize);
        end
        BombGamedisplay(y,x) = 2;
    end
    drawScene(BombGameScreen,BombGamedisplay)
    title('')

    numflags = 0;



    %Loop to make the game portion of the game work
    while ingame == true
        %Define variables

        [x,y,z] = getMouseInput(BombGameScreen);

        %Let's uncover the bombs
        if BombGamedisplay(x,y) == 2 && z == 1
            BombGamedisplay(x,y) = 8;
            ingame = false;
            win = false;

        elseif  BombGamedisplay(x,y) == 2 && z == 3
            if numflags < numberbombs
                BombGamedisplay(x,y) = 7;
                numflags = numflags + 1;
                sound(click,click2,16);
            end
        elseif BombGamedisplay(x,y) == 7 && z == 3
            BombGamedisplay(x,y) = 2;
            numflags = numflags - 1;
            sound(click,click2,16);


            %For the non-bomb spots
        elseif BombGamedisplay(x,y) == 1 && z == 1
            spotcounter = 0;

            %Checking around the spot to find what the number will be
            for a = -1:1:1
                a = x + a;
                for b = -1:1:1
                    b = y + b;
                    if a <= gridsize && b <= gridsize && a > 0 && b > 0
                        if BombGamedisplay(a,b) == 2 | BombGamedisplay(a,b) == 7 | BombGamedisplay(a,b) == 8
                            spotcounter = spotcounter + 1;
                        end
                    end
                end
            end

            % Draw the clicked spot
            if spotcounter > 0
                BombGamedisplay(x,y) = (8+spotcounter);
            else
                BombGamedisplay(x,y) = (5);
            end
            drawScene(BombGameScreen,BombGamedisplay)
            sound(click,click2,16);

            %If you right click, add a flag, as long as there are less flags
            %than the number of bombs
        elseif BombGamedisplay(x,y) == 1 && z == 3
            if numflags < numberbombs
                BombGamedisplay(x,y) = 3;
                numflags = numflags + 1;
                sound(click,click2,16);
            end
        elseif BombGamedisplay(x,y) == 3 && z == 3
            BombGamedisplay(x,y) = 1;
            numflags = numflags - 1;
            sound(click,click2,16);

        end
        drawScene(BombGameScreen,BombGamedisplay)

        if numberbombs == sum(BombGamedisplay(:) == 7)
            win = true;
            wincounter = wincounter + 1;
            ingame = false;
        end
        drawScene(BombGameScreen,BombGamedisplay)
    end

    % Winning yes vs no, and then asking to play again or quit.
    if win == false
        sound(explosion, explosion2, 16);
        title('You Lost, Press Space to Play Again, or q to Return To Menu')
        k = getKeyboardInput(BombGameScreen);
        if length(k) == 1
            if k == 'q'
                close all
                clc
                menurun = true;
                return
            end
        elseif length(k) == 5
            if k == 'space'
                fprintf('Ok we''re playing again!')
                ingame = true;
                close all

            end
        end
    elseif win == true
        title('You won! Press Space to Play Again, or q to Return To Menu')
        [sound1,sound2]=audioread('Yayyy! Sound Effect.wav');
        sound(sound1,sound2,16);
        
        k = getKeyboardInput(BombGameScreen);
        if length(k) == 1
            if k == 'q'
                close all
                clc
                menurun = true;
                return
            end
        elseif length(k) == 5
            if k == 'space'
                fprintf('Ok we''re playing again!')
                ingame = true;
                close all

            end
        end

        % End of small while loop
    end
end