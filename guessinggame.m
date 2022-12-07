function menurun = guessinggame(username)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Clear last figure
close all
clc

%Explain the game
fprintf('%s, welcome to the number guessing game!\n',username)
input(['This game will display 7 cards. Pick a number between 1 and 100. \n' ...
    'If your number is on the card shown, press y. \nIf your number is not on the card, press n \nIf you want to quit while the game is running, press q \npress enter to continue \n'])

%Define card indexes
cards = [1,2,3,4,5,6,7];
cardspostion = [1,2,3,4,5,7,8];
cardsvalue = [1,8,56,2,15,4,28];

screenguess = simpleGameEngine('guessinggamecards.png',637,874,3,[255,255,255]);
display = [9];
drawScene(screenguess,display);
title('Q Games Launcher');
running = true;


%% making the running loop
while running == true;

    %Reset xlabel if looped
    xlabel('')

    %Set the number guesser value
    yournumber = 0;

    %Randomize the cards initially
    cards_rand = cards(randperm(length(cards)));

    %show the cards
    for i = 1:1:length(cards)
        %Clearing command window because I like the way it looks :)
        clc
        
        %Display a random card
        i = cards_rand(i);
        display = cardspostion(i);
        drawScene(screenguess,display);
        fprintf('hmmm. I wonder if your number is %i?',randi(100))
        while true;

            %always need keyboard input
            k = getKeyboardInput(screenguess);

            %Check to see if the number is on the card
            if length(k) == 1;

                %Add new number to your number if it's on the card, Then break
                %the loop to load the next card
                if k == 'y';
                    yournumber = yournumber + cardsvalue(i);
                    pause(0.5);
                    break

                    %Break the loop and allow it to load the next card
                elseif k == 'n';
                    pause(0.5);
                    break

                    %If q is pressed, return to the main menu
                elseif k == 'q'
                    running = false;
                    menurun = true;
                    clc
                    close all
                    return
                
                    %For bad clicks, play windows error noise
                else
                    [sound1,sound2]= audioread('Windows Error (Sound effect).wav');
                    sound(sound1,sound2,16);
                
                end
            end
            if running == false
                break
            end
        end
    end

    %Display Number at the end
    clc
    if yournumber <=100 && yournumber>=1
        fprintf("\n%s, I bet your number was %.i!\n", username,yournumber)
        fprintf('Press Space to play again! Press q to return to menu\n')
        xlabel([username,', your number was ',num2str(yournumber),'! Press Space to play again! Press q to return to menu'])
    
        %For if the number is somehow above 100
    else
        fprintf('%s I bet you lied to me! Your number was NOT on one of those cards!!! OR maybe you didn''t say it was on any of the cards! \nPress Space to play again! Press q to return to menu\n',username)
        xlabel('Lying is bad! Press Space to play again! Press q to return to menu.')
    end

    %Prompt to play again

    while true
        k = getKeyboardInput(screenguess);
        if length(k) == 1
            if k == 'q'
                running = false;
                menurun = true;
                close all;
                return
            end
        elseif length(k) == 5;
            if k == 'space';
                break
            end
        end
    end
    clc

    %End main While loop
end