clc
clear
close all

%% Lets introduce the user to the "Q" gaming platform.

%SOUND!
[intro, intro2] = audioread('THX Sound Effect.wav');
[shutdown,shutdown2] = audioread('shutdown.wav');
sound(intro, intro2, 16);

%Introduction and username prompt
fprintf('Welcome to the Q gaming platform! Let''s get started!\n\n')
username = input('Please type a username: ','s');

%% Outlining the intitial menu.
%The menu is a 4x4 grid of buttons, with an exit, game 1, game 2, and game
%3 button, game two and game three are both variation of the guessing game

screen = simpleGameEngine('menusprites.png',130,130,2,[255,255,255]);
display = [4,2;3,1];
drawScene(screen,display);
title('Q Games Launcher')



menurunning = true;

%Make it a continously running loop
while menurunning == true
    clc

    drawScene(screen,display);
    % Make it search for mouse input and execute the games
    [x,y] = getMouseInput(screen);
    
    %Click check for exit button
    if x == 2 && y == 1
        close all
        fprintf('Have a good day %s!\n',username)
        menurunning = false;
        sound(shutdown,shutdown2,16)
        pause(2)
        close all
    %Click check for number guesser
    elseif x == 2 && y == 2
        fprintf('Initiating Guessing Game!\n\n')
        pause(0.25)
        menurunning = false;
        menurunning = guessinggame(username);
    %Click check for minesweeper
    elseif x == 1 && y == 2
        fprintf('Inititializing Minesweeper!\n\n')
        pause(0.25)
        menurunning = false;
        menurunning = BombGame(username);
    
    %Click check for Roulette
    elseif x == 1 && y == 1
        fprintf('Initializing Roulette Luck Game')
        pause(.25)
        menurunning = false;
        menurunning = luckgame();
        close all
    end
    
    %Welcome back to menu after game is exited 
    if menurunning == true
        fprintf('Welcome Back\n')
    end

end

