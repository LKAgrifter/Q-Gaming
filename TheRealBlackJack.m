%% Initial Game Variables
%In order for the game to run some of these initial variables must be met,
%it also initializes some later variables that will be changed. It also
%introduces the game engine. 
%Game engine
card_scene = simpleGameEngine('retro_cards.png',16,16,8,[31,108,4]);
%Set variables
skip_sprites = 20;
blank_card_sprite = 2;
white_card = blank_card_sprite*[1 1];
%Variable to start game
play_again = 'y';
%Initialized Variables changing
bank = 5000;
wins = 0;
losses = 0;
push = 0;
%% Loop
while play_again =='y'
    clc
    %% Loop Variables
    %This creates the shuffled deck, changes it every time it loops so each game has a new deck, so no card counting.  
    shuffled_deck = randperm(52);
    %Initial card values aces = 11
    cardValues = [11 2:10 10 10 10, 11 2:10 10 10 10, 11 2:10 10 10 10, 11 2:10 10 10 10];
    %Creates the hands of both the dealer and the player 
    player_hand = skip_sprites + shuffled_deck(1:2:3);
    dealer_hand = skip_sprites + [shuffled_deck(4) shuffled_deck(2)];
    %Creates only one card that would be flipped
    dealer_one_card = skip_sprites + [shuffled_deck(2)];
    %Displays the number of changed variables 
    fprintf('You have %d wins, %d losses, %d pushes, %d dollars', wins, losses, push, bank)
    %% Betting
    Bet_Decision = input('\nHow much would you like to bet?\n');
    %Bet function uses the 1st function at the bottom of the script
    betting(bank, Bet_Decision);
    %% Background
    %Creates vector of twenty ones
    displaygreen = linspace(1, 1, 20);
    TopG = displaygreen;
    %Creates a deck card in top right
    TopG(:,17) = 4;
    DisplayT = [TopG;displaygreen;displaygreen;displaygreen;displaygreen];
    BottomG = displaygreen;
    %Creates a deck card in bottom right
    BottomG(:, 4) = 4;
    DisplayB = [displaygreen;displaygreen;BottomG];
    Origin = [DisplayT;DisplayB];
    %All together creates a background scene 
    drawScene(card_scene, Origin)
    title('High Stakes Black Jack Game')
    %% Drawing Cards Animation
    text(42.0064440538968, 814.516695957822, 0, 'Click on this deck, when your ready to begin!', 'FontSize',18)
    x = 0;
    y = 0;
    while x == 0 && y == 0
        %Gathers mouse input
        [x,y] = getMouseInput(card_scene);
        if x == 8 && y == 4
            clf
            i = 4;
            %Creates animation loop from the deck to the place of 1st player card
            %posistion
            for i=4:10
                if BottomG(i) == 1
                    Animate1 = Origin;
                    Animate1(8, i) = 3;
                    drawScene(card_scene, Origin, Animate1)
                    title('Dealing Player Cards')
                    pause(.2)
                end
                i=i+1;
            end
            %Creates animation loop from the deck to the place of 2nd player card
            %posistion
            for i=4:9
                if BottomG(i) == 1
                    Animate2=Animate1;
                    Animate2(8, i) = 3;
                    drawScene(card_scene, Origin, Animate2)
                    title('Dealing Player Cards')
                    pause(.2)
                end
                i=i+1;
            end
            i = 17;
            %Creates animation loop from the deck to the place of 1st dealer card
            %posistion
            for i=17:-1:9
                if TopG(i) == 1
                    Animate3 = Animate2;
                    Animate3(1, i) = 3;
                    drawScene(card_scene, Origin, Animate3)
                    title('Dealing Dealer Cards')
                    pause(.2)
                end
                i=i-1;
            end
            %Creates animation loop from the deck to the place of 2nd dealer card
            %posistion
            for i = 17:-1:10
                if TopG(i) == 1
                    Animate4 = Animate3;
                    Animate4(1, i) = 3;
                    drawScene(card_scene, Origin, Animate4)
                    title('Dealing Dealer Cards')
                    pause(.2)
                end
                i=i-1;
            end
            %if the player does not click x = 8 y = 4, then nothing occurs
            %and loops again
        else
            x = 0;
            y = 0;
        end
    end
    %% Background + White + Cards
    %Reset background
    BottomG = displaygreen;
    BottomG(:,4) = 4;
    BottomG(:,9:10)= white_card; %Display white background card for player cards
    displaywhite = [displaygreen;displaygreen;BottomG];
    TopG = displaygreen;
    TopG(:,17)= 4;
    TopG(:,9)= 3;
    TopG(:,10)= 2; %Display white background card for dealer card
    displaydealer = [TopG;displaygreen;displaygreen;displaygreen;displaygreen];
    background = [displaydealer;displaywhite];
    disp_cards = background;
    %Use player hand to display player hand with white cards
    disp_cards(8,9:10) = player_hand;
    %Use on dealer card to display over white background
    disp_cards(1, 10) = dealer_one_card;
    drawScene(card_scene, background, disp_cards)
    title('High Stakes Black Jack Game')
    %Checks total player and total dealer for 21
    total_player = sum(cardValues(player_hand - 20))
    total_dealer = sum(cardValues(dealer_hand - 20))
    %% BlackJack Tie
    if total_dealer == 21 && total_player == 21
        background(1,9) = 2;
        disp_cards(1, 10:-1:9) = dealer_hand;
        %Draws both of the dealers cards
        drawScene(card_scene, background, disp_cards)
        title('BlackJack Tie')
        %Creates tie prompt
        text(889.923842999415, 462.507322788518, 0, 'You both got BlackJack! You tie!', 'FontSize',18)
        text(230.052724077329, 840.433509080258, 0, 'Click this to exit the program','FontSize',14)
        text(1740.25776215583, 171.564147627417, 0, 'Click this to restart the program and see your stats!','FontSize',14)
        push= push + 1;
        bank = bank;
        x=0;
        y=0;
        %Changes the player and dealer totals so it loops
        total_player = 100;
        total_dealer = 100;
   %% BlackJack Tie Reset
    if total_player == 100 && total_dealer == 100
        x = 0;
        y = 0;
        %Infinite while loop unless mouse input met
        while x == 0 && y == 0
            [x,y] = getMouseInput(card_scene);
            if x == 8 && y == 4 %Bottom  right deck
                play_again ='N';
                close all
            elseif x == 1 && y == 17 % Top right deck
                play_again = 'y';
                close all
            else
                x = 0;
                y =0;
            end
        end
    end 
    end 
    %% BlackJack Player Win
    if total_player == 21 
        background(1,9) = 2;
        disp_cards(1, 10:-1:9) = dealer_hand;
        %Draws dealer hand
        drawScene(card_scene, background, disp_cards)
        title('Player BlackJack Instant Victory')
        %Creates player blackjack win prompt
        text(889.923842999415, 462.507322788518, 0, 'Good job! You got BlackJack!', 'FontSize',18)
        text(230.052724077329, 840.433509080258, 0, 'Click this to exit the program','FontSize',14)
        text(1740.25776215583, 171.564147627417, 0, 'Click this to restart the program and see your stats!','FontSize',14)
        wins = wins + 1;
        bank = bank + 1.5*Bet_Decision;
        x=0;
        y=0;
        %Changes players total so it continues to loop
        total_player = 100
    %% BlackJack Player Reset
    if total_player == 100
        x = 0;
        y = 0;
        %infinite mouse input while loop
        while x == 0 && y == 0
            [x,y] = getMouseInput(card_scene);
            if x == 8 && y == 4 %bottom left deck 
                play_again ='N';
                close all
            elseif x == 1 && y == 17 %top right deck
                play_again = 'y';
                close all
            else
                x = 0;
                y =0;
            end
        end
    end
    end 
    %% BlackJack Dealer Win
    if total_dealer == 21 && total_player < 21
        background(1,9) = 2;
        disp_cards(1, 10:-1:9) = dealer_hand;
        drawScene(card_scene, background, disp_cards)
        %Draws the dealers hand with white spots
        title('Dealer BlackJack Instant Loss')
        %Prompts player loss 
        text(889.923842999415, 462.507322788518, 0, 'The dealer got BlackJack! You lose!', 'FontSize',18)
        text(230.052724077329, 840.433509080258, 0, 'Click this to exit the program','FontSize',14)
        text(1740.25776215583, 171.564147627417, 0, 'Click this to restart the program and see your stats!','FontSize',14)
        losses = losses + 1;
        bank = bank - Bet_Decision;
        x=0;
        y=0;
        %Changes dealer total so it continues to loop
        total_dealer = 100
        %% BlackJack Dealer Reset
        while x == 0 && y == 0
            [x,y] = getMouseInput(card_scene);
            if x == 8 && y == 4 %Bottom left deck
                play_again ='N';
                close all
            elseif x == 1 && y == 17 %Top right deck
                play_again = 'y';
                close all
            else
                x = 0;
                y =0;
            end
        end
    end
    %% Hit/Stay for Player
    %Initial variables for while loop
    P=1;
    H=1;
    x=0;
    y=0;
    %for players total and for hitting
    cardhit = (skip_sprites) + shuffled_deck(4 + H);
    while x==0 && y==0 && total_player <= 21 && total_dealer < 21
        title('High Stakes Black Jack Game')
        %Prompts player with hit or stay
        text(843.432923257176, 443.011130638547, 0, 'It is now your turn to hit or stay!', FontSize=18)
        text(36.5905096660808, 958.910369068542, 0, 'Click this deck to hit!', 'FontSize',14)
        text(2185.67076742824, 62.0855301698886, 0, 'Click this deck to stay!', 'FontSize',14)
        [x,y] = getMouseInput(card_scene);
        %infinite mouse loop
        if x==8 && y==4
            clf
            i=4;
            for i = 4:10+H
                %animate card if hit
                if BottomG(i) == 1
                    Animate5 = background;
                    Animate5(8, i) = 3;
                    drawScene(card_scene, Animate5, disp_cards)
                    title('Dealing Player Card')
                    pause(.2)
                    D=5;
                end
                i=i+1;
            end
            %draw the actual card and white background
            if D == 5
                H=H+1;
                background(8, i-1) = 2;
                cardhit = (skip_sprites) + shuffled_deck(4 + H);
                disp_cards(8,i-1) = cardhit;
                drawScene(card_scene, background, disp_cards)
                title('High Stakes Black Jack Game')
                player_hand(:, end+1) = cardhit;
                total_player = total_player + sum(cardValues(cardhit - 20))
            end
        elseif x == 1 && y == 17
            clf
            break
        else
            x=0;
            y=0;
        end
        % gives option to reset loop and hit or stay
        if total_player < 21
            x=0;
            y=0;
        end
        % removes option because player has 21
        if total_player == 21
            break
        end
        % if player goes above 21 changes ace value to 1 rather then 11
        if total_player > 21
            cardValues = [1:10 10 10 10, 1:10 10 10 10, 1:10 10 10 10, 1:10 10 10 10];
            total_player = sum(cardValues(player_hand - 20))
            x = 0;
            y = 0;
        end
    end
    %% Bust Function
    % If total player is still above 21 runs to check for aces again 
    if total_player > 21 && total_player < 100
        cardValues = [1:10 10 10 10, 1:10 10 10 10, 1:10 10 10 10, 1:10 10 10 10];
        total_player = sum(cardValues(player_hand - 20))
        x = 0
        y = 0;
    end
    % if total player is still above 21 then runs this code
    if total_player > 21 && total_player < 100
        background(1,9) = 2;
        disp_cards(1, 10:-1:9) = dealer_hand;
        %Draws dealer hand
        x = 0;
        y =0;
        drawScene(card_scene, background, disp_cards)
        title('You busted.')
        %Prompts player bust loss prompt
        text(735.454012888108, 479.00410076157, 0, 'You went over 21! You busted! You automatically lose.', FontSize=18)
        text(230.052724077329, 840.433509080258, 0, 'Click this to exit the program','FontSize',14)
        text(1740.25776215583, 171.564147627417, 0, 'Click this to restart the program and see your stats!','FontSize',14)
        losses = losses + 1;
        bank = bank - Bet_Decision;
        %infinite mouse loop
        while x == 0 && y == 0
            [x,y] = getMouseInput(card_scene);
            if x == 8 && y == 4 % deck bottom left
                play_again = 'N';
                close all
            elseif x == 1 && y == 17 % deck top right
                play_again = 'y';
                close all
            else
                y =0;
                x =0;
            end
        end
    end
    %% Dealers Turn
    %Initial variables for dealer hand
    disp_cards(1, 10:-1:9) = dealer_hand;
    background(1,9) = 2;
    cardValues = [11 2:10 10 10 10, 11 2:10 10 10 10, 11 2:10 10 10 10, 11 2:10 10 10 10];
    cardhit = (skip_sprites) + shuffled_deck(4 + H);
    H = 0;
    x=0;
    y=0;
    % Initial variable requirements
    while x == 0 && y == 0 && total_dealer < 17 && total_player <= 21 && total_dealer < 100 
    drawScene(card_scene, background, disp_cards)
    title('High Stakes Black Jack Game')
        pause(1)
        text(712.958406561219, 477.504393673111, 0, 'The dealers cards are under 17, this means they have to draw.', FontSize=18)
        text(1582.78851786761, 180.562390158172, 9, 'Click this deck when your ready for the dealer to draw cards.', FontSize=14)
        [x,y] = getMouseInput(card_scene);
        clf
        if x == 1 && y == 17
            i=17;
            for i = 17:-1:8-H
                %animate for dealers cards
                if TopG(i) == 1
                    Animate6 = background;
                    Animate6(1, i) = 3;
                    drawScene(card_scene, Animate6, disp_cards)
                    title('Dealing Dealer Card')
                    pause(.2)
                    D = 4;
                end
                i=i-1;
            end
            if D == 4
                %draw dealer hand with white background
                H=H+1;
                cardhit = (skip_sprites) + shuffled_deck(4 + H)
                background(1, i+1) = 2;
                disp_cards(1,i+1) = cardhit;
                dealer_hand(:,end+1) = cardhit;
                drawScene(card_scene, background, disp_cards)
                title('High Stakes Black Jack Game')
                total_dealer = total_dealer + sum(cardValues(cardhit - 20));
                x=0;
                y=0;
            end
        else
            x=0;
            y=0;
        end
        %Check for aces if dealer is above 21
        if total_dealer > 21
            cardValues = [1:10 10 10 10, 1:10 10 10 10, 1:10 10 10 10, 1:10 10 10 10];
            total_dealer = sum(cardValues(dealer_hand - 20));
            x = 0;
            y = 0;
        end
    end
    %% Dealer Bust
    %If total dealer is still above 21 after aces then the dealer busts
    if total_dealer > 21 && total_dealer < 100
        drawScene(card_scene, background, disp_cards)
        title('Dealer Busted')
        %Prompt dealer bust, player win
        text(800.958406561219, 477.504393673111, 0, 'The dealer busted! You win!', 'FontSize',18)
        text(230.052724077329, 840.433509080258, 0, 'Click this to exit the program','FontSize',14)
        text(1740.25776215583, 171.564147627417, 0, 'Click this to restart the program and see your stats!','FontSize',14)
        wins = wins + 1;
        bank = bank + 2*Bet_Decision;
        x=0;
        y=0;
        %infinite mouse
        while x == 0 && y == 0
            [x,y] = getMouseInput(card_scene);
            if x == 8 && y == 4 % bottom left
                play_again = 'N';
                close all
            elseif x == 1 && y == 17 % top right
                play_again = 'y';
                close all
            else
                x = 0;
                y =0;
            end
        end
    end
    %% Dealer Equals Player
    %after entire script is run, begin running these if statements
    if total_dealer == total_player && total_dealer < 100 && total_player < 100
        drawScene(card_scene, background, disp_cards)
        title('Dealer Player Tie')
        %Prompt player tie
        text(889.923842999415, 462.507322788518, 0, 'The dealer and the player tied!', 'FontSize',18)
        text(230.052724077329, 840.433509080258, 0, 'Click this to exit the program','FontSize',14)
        text(1740.25776215583, 171.564147627417, 0, 'Click this to restart the program and see your stats!','FontSize',14)
        push = push + 1;
        bank = bank;
        x=0;
        y=0;
        %infinite mouse
        while x == 0 && y == 0
            [x,y] = getMouseInput(card_scene); 
            if x == 8 && y == 4 %bottom left deck
                play_again = 'N';
                close all
            elseif x == 1 && y == 17 % top right deck
                play_again = 'y';
                close all
            else
                x=0;
                y =0;
            end
        end
    end
 
    %% Dealer Wins
    if total_dealer > total_player && total_dealer <= 21
        drawScene(card_scene, background, disp_cards)
        title('Dealer Win')
        %Prompt dealer win and player loss
        text(712.958406561219, 477.504393673111, 0, 'The dealer was closer to 21! They beat you!', 'FontSize',18)
        text(230.052724077329, 840.433509080258, 0, 'Click this to exit the program','FontSize',14)
        text(1740.25776215583, 171.564147627417, 0, 'Click this to restart the program and see your stats!','FontSize',14)
        losses = losses + 1;
        bank = bank - Bet_Decision;
        x=0;
        y=0;
        %infinite mouse 
        while x == 0 && y == 0
            [x,y] = getMouseInput(card_scene);
            if x == 8 && y == 4 %bottom left deck
                play_again ='N';
                close all
            elseif x == 1 && y == 17 %top right deck
                play_again = 'y'; 
                close all
            else
                x = 0;
                y =0;
            end
        end
    end
    %% Dealer Loses
    if total_dealer < total_player && total_player <=21 && total_player < 100 && total_dealer < 100
        drawScene(card_scene, background, disp_cards)
        title('Player Win')
        %prompt player win dealer loss
        text(889.923842999415, 462.507322788518, 0, 'Good job! You beat the dealer!', 'FontSize',18)
        text(230.052724077329, 840.433509080258, 0, 'Click this to exit the program','FontSize',14)
        text(1740.25776215583, 171.564147627417, 0, 'Click this to restart the program and see your stats!','FontSize',14)
        wins = wins + 1;
        bank = bank + 2*Bet_Decision;
        x=0;
        y=0;
        %infinte mouse
        while x == 0 && y == 0
            [x,y] = getMouseInput(card_scene);
            if x == 8 && y == 4 % bottom left
                play_again ='N';
                close all
            elseif x == 1 && y == 17 % top right
                play_again = 'y';
                close all
            else
                x = 0;
                y =0;
            end
        end
    end
end
%The betting function called upon in the betting part of the code
function [bank] = betting(bank, Bet_Decision)
    while Bet_Decision <=0 || Bet_Decision > bank
        if Bet_Decision > bank
            fprintf('Silly, you can not bet more then what you have in the bank!\n')
        end
        if Bet_Decision <= 0
            fprintf('You have to bet more then 0 to play the game!')
        end
        Bet_Decision = input('How much would you like to bet?\n');
    end
    if Bet_Decision <= bank
        bank = (bank - Bet_Decision);
    end
    
    fprintf('Game is beginning! There is currently %d$ on the line!', Bet_Decision)
end

