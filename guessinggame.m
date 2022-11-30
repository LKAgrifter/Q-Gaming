function menurun = guessinggame(inputArg1,inputArg2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Clear last figure
close all

%Explain the game

input(['This game will display 7 cards. Pick a number between 1 and 100. \n' ...
    'If your number is on the card shown, press y. \nIf your number is not on the card, press n \press enter to continue'])

cards = [1,2,4,8,15,28,56]

screenguess = simpleGameEngine('retro_cards.png',16,16,5,[255,255,255])
display = [1]
drawScene(screenguess,display)
title('Q Games Launcher')
running = true

%making the running loop
while running == true

%always need keyboard input
k = getKeyboardInput(screenguess);

%testing to see if the player wants to return to the main menu
if length(k) == 1
    if k == 'q'
        running = false
        menurun = true
        close all
        break
    end
end

end