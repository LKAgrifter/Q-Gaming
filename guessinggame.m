function menurun = guessinggame(username)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Clear last figure
close all

%Explain the game

input(['This game will display 7 cards. Pick a number between 1 and 100. \n' ...
    'If your number is on the card shown, press y. \nIf your number is not on the card, press enter to continue \nIf you want to quit while the game is running, press q'])

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
for i = 1:1:length(cards);
    i = cards_rand(i);
    display = cardspostion(i);
    drawScene(screenguess,display);
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
                answering = false;
                pause(0.5);
                break
                
                %If q is pressed, return to the main menu
            elseif k == 'q';
                    running = false;
                    menurun = true;
                    close all
                    return
            end
        end
    if running == false;
        break
    end
    end
end

%Display Number at the end
    if yournumber <=100 && yournumber>=1
    fprintf("\nI bet your number was %.i!", yournumber)
    fprintf('Press Space to play again! Press q to return to menu')
    xlabel(['Number was ',num2str(yournumber),'! Press Space to play again! Press q to return to menu'])
    
    else
    fprinf('I bet you lied to me! Your number was Not on one of those cards!!! Press Space to play again! Press q to return to menu')
    xlabel('Lying is bad! Press Space to play again! Press q to return to menu.')
    end

%Prompt to play again

while true;
        k = getKeyboardInput(screenguess);
        if length(k) == 1;
            if k == 'q';
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

%End main While loop
end