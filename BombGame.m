function menurun = bombgame(username);
%good programming practices
clc
close all

%Introduce the user to the minesweeper game
fprintf('Hey %s, welcome to Minesweeper!\n',username)

%Define Screen and drawing the scene
BombGameScreen = simpleGameEngine('MinesweeperSprite.png',16,16,5,[255,255,255]);

%Are we still playing?
playing = true;
ingame = true;
wincounter = 0;

%import sounds
[explosion, explosion2] = audioread('mixkit-epic-impact-afar-explosion-2782.wav');
[click,click2] = audioread('Click - Sound Effect (HD).wav');

while playing == true

    %making sure the gridsize is bigger than 0
    gridsize = 0;%initializing gridsize for the loop
    while gridsize <= 1 | gridsize > 12 %setting the gridsize so it can't be more than 12
        %asking for input from the user
        gridsize= input("How big do you want the grid to be? It must be larger than 1 and no larger than 12. : ");
    end

    %making sure the numberbombs is greater than 0
    numberbombs = 0;
    while numberbombs <= 0 | numberbombs >= gridsize.^2%asking for an input of how many bombs they want
        %the number of bombs can't 
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
    drawScene(BombGameScreen,BombGamedisplay) %drawing the scene with the display of unopened
    %grid spaces
    title('')%titling the figure

    numflags = 0;%initializing the number of flags



    %Loop to make the game portion of the game work
    while ingame == true
        %Define variables

        [x,y,z] = getMouseInput(BombGameScreen);

        %Let's uncover the bombs
        if BombGamedisplay(x,y) == 2 && z == 1%this 
            BombGamedisplay(x,y) = 8;%displays a bomb then stops the game
            ingame = false;%starts out of game options
            win = false;%starts while loop for losing

        elseif  BombGamedisplay(x,y) == 2 && z == 3% Display a flag
            if numflags < numberbombs
                BombGamedisplay(x,y) = 7;%sprite for a flag
                numflags = numflags + 1;
                sound(click,click2,16);%sound for clicking
            end
        elseif BombGamedisplay(x,y) == 7 && z == 3%displays a flag and takes away from the total number
            BombGamedisplay(x,y) = 2;
            numflags = numflags - 1;
            sound(click,click2,16);


            %For the non-bomb spots
        elseif BombGamedisplay(x,y) == 1 && z == 1
            spotcounter = 0;

            %Checking around the clicked spot to find what the number will be
            %this generates the numbers by indexing where the bombs will
            %be in proximity to where the grid is hit.
            for a = -1:1:1
                a = x + a;
                for b = -1:1:1
                    b = y + b;
                    if a <= gridsize && b <= gridsize && a > 0 && b > 0
                        if BombGamedisplay(a,b) == 2 | BombGamedisplay(a,b) == 7 | BombGamedisplay(a,b) == 8
                            spotcounter = spotcounter + 1;%variable to add to get the numbers associated with the sprites
                        end
                    end
                end
            end

            % Draw the clicked spot
            if spotcounter > 0
                BombGamedisplay(x,y) = (8+spotcounter);%numbers start at sprite eight so
                %any spotcounter added adds a number corresponding to how
                %many bombs around
            else
                BombGamedisplay(x,y) = (5);%displays a sprite for the open box with no number
            end
            drawScene(BombGameScreen,BombGamedisplay)%drawing a scene
            sound(click,click2,16);%sound for clicking

            %If you right click, add a flag, as long as there are less flags
            %than the number of bombs
        elseif BombGamedisplay(x,y) == 1 && z == 3 
            if numflags < numberbombs
                BombGamedisplay(x,y) = 3;
                numflags = numflags + 1;
                sound(click,click2,16);%starts a sounf for clicking on the grid
            end
        elseif BombGamedisplay(x,y) == 3 && z == 3%deploys a flag
            BombGamedisplay(x,y) = 1;
            numflags = numflags - 1;
            sound(click,click2,16);%starts a sound for you clicking on the grid

        end
        drawScene(BombGameScreen,BombGamedisplay)%draws the scene depending on the mouse input

        if numberbombs == sum(BombGamedisplay(:) == 7)%this function shows that all the bombs
            %been covered so the user can win
            win = true;
            wincounter = wincounter + 1;%adds to win counter
            ingame = false;%out of game options now
        end
        drawScene(BombGameScreen,BombGamedisplay)%draws the scene
    end

    % Winning yes vs no, and then asking to play again or quit.
    if win == false%if a lose
        sound(explosion, explosion2, 16);%explosion sound signaling a lose
        title('You Lost, Press Space to Play Again, or q to Return To Menu')%displays a loss
        k = getKeyboardInput(BombGameScreen);
        if length(k) == 1%option to return to menu if false
            if k == 'q'
                close all
                clc
                menurun = true;
                return
            end
        elseif length(k) == 5% option to keep playing if loss
            if k == 'space'
                fprintf('Ok we''re playing again!')%prints playing again
                ingame = true;%restarts the while loop since specification is ingame=true
                close all

            end
        end
    elseif win == true%if you won
        title('You won! Press Space to Play Again, or q to Return To Menu');%printed if won
        [sound1,sound2]=audioread('Yayyy! Sound Effect.wav');%sound if won
        sound(sound1,sound2,16);
        
        k = getKeyboardInput(BombGameScreen);
        if length(k) == 1%since length of the array is 1 it is equal to one
            if k == 'q'% returns to menu if won
                close all
                clc
                menurun = true;
                return% returns to the orginal place which is the game menu if won
            end
        elseif length(k) == 5%since the length of the array is 5 letters it is 5
            if k == 'space'%key input
                fprintf('Ok we''re playing again!')
                ingame = true;%since we initially set playing game to true this resets the while loop
                close all

            end
        end

        % End of small while loop
    end
end