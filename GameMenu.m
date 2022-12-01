clc
clear
close all

%% Lets introduce the user to the "Q" gaming platform.

%Introduction and username prompt
fprintf('Welcome to the Q gaming platform! Let''s get started!\n\n')
username = input('Please type a username: ','s');

%% Outlining the intitial menu.
%The menu is a 4x4 grid of buttons, with an exit, game 1, game 2, and game
%3 button, game two and game three are both variation of the guessing game

screen = simpleGameEngine('retro_cards.png',16,16,5,[255,255,255]);
display = [7,5;4,3];
drawScene(screen,display);
title('Q Games Launcher')


% Make it search for mouse input and execute the games
menurunning = true;

while menurunning == true;
drawScene(screen,display);
[x,y] = getMouseInput(screen);

if x == 2 && y == 1;
close all
fprintf('\nHave a good day!\n')
menurunning = false;
close all
end
if x == 2 && y == 2;
    fprintf('Initiating Guessing Game!\n\n')
    menurunning = false;
    menurunning = guessinggame(username);
end

end


%% Handling Buttons
