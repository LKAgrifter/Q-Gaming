%% Loop

play_again = 'y';
bank = 5000
wins = 0;
losses = 0;
push = 0;
while play_again == 'y' && bank>0
wins = wins;
losses = losses; 
push = push;
hit = 0;
DHit = 0;
%% Game Building
shuffled_deck = randperm(52);
card_scene = simpleGameEngine('retro_cards.png',16,16,8,[0,100,0]);
skip_sprites = 20;
blank_card_sprite = 2;
white_card = blank_card_sprite*[1 1];
play_again = 'y';
cardValues = [11 2:10 10 10 10, 11 2:10 10 10 10, 11 2:10 10 10 10, 11 2:10 10 10 10];
%% Betting
Bet_Decision = input('\nHow much would you like to bet?\n')
while Bet_Decision <=0 || Bet_Decision > bank
if Bet_Decision > bank
    fprintf('Silly, you can not bet more then what you have in the bank!\n')    
end
if Bet_Decision <= 0
    fprintf('You have to bet more then 0 to play the game!')
end 
Bet_Decision = input('How much would you like to bet?\n')
end 

if Bet_Decision <= bank
    bank = (bank - Bet_Decision) 
end

fprintf('Game is beginning, and cards are being shuffled!\nThere is currently %d$ on the line!', Bet_Decision)
pause(5)
clc
%% Dealing Player Hand
player_hand = skip_sprites + shuffled_deck(1:2:3);
drawScene(card_scene, white_card, player_hand)
title('BlackJack Table')
fprintf('\nThis is your hand! Next, you will see one of the dealers cards, you can then choose to pass or hit. \nPress Space when you are ready to see the dealers cards');
total_player = sum(cardValues(player_hand - 20));
    if total_player == 21
        fprintf('You have drawn a BlackJack! \nIf the dealer does not have one you get payed 1.5x your bet!\nClick Space when your ready to see the dealers cards')
        key = getKeyboardInput(card_scene)
        pause(2)
if strcmp(key, 'space');
        drawScene(card_scene, white_card, dealer_unrevealed_hand);
        fprintf('\nThis is the dealers unflipped hand, when you are ready to see all the cards click space.')
end
    key = getKeyboardInput(card_scene)
    pause(2)
    clc
    if strcmp(key, 'space')
        drawScene(card_scene, white_card, dealer_hand);
    end
    end
    if total_player == 21 && total_dealer >21
        fprintf('\nYou did it! The dealer only had %d', total_dealer)
        bank = bank + 1.5*Bet_Decision
        wins = wins + 1
        if bank > 0 
fprintf('You now have %d in the bank! Would you like to play again? Click Y for Yes, N for No', bank)
key = getKeyboardInput(card_scene)
pause(5)
clc 
if strcmp(key, 'y')
    fprintf('\nI am glad your ready to play again! Currently you have %d win, %d losses, %d pushes, and %d in the bank', wins, losses, push, bank)
end 
key = getKeyboardInput(card_scene)
pause(5)
clc
if strcmp(key, 'n')
    fprintf('\nThank you for playing, I hope you enjoyed!')
    break
end 
        end
        if bank <= 0 
        fprintf('You have no money in the bank, venmo me for more!, until then good playing!')
        break
        end  
    end 
    
    if total_player == 21 && total_dealer == 21
        fprintf('\nWow! You both had %d, this means you gain and lose nothing!',total_dealer)
        bank = bank + Bet_Decision
        push = push + 1
        if bank > 0
        fprintf('\nYou now have %d in the bank! Would you like to play again? Click Y for Yes, N for No', bank)
key = getKeyboardInput(card_scene)
pause(5)
clc 
if strcmp(key, 'y')
    fprintf('\nI am glad your ready to play again! Currently you have %d win, %d losses, %d pushes, and %d in the bank', wins, losses, push, bank)
    continue
end 
key = getKeyboardInput(card_scene)
pause(5)
clc
if strcmp(key, 'n')
    fprintf('\nThank you for playing, I hope you enjoyed!')
    break
end 
        end
        if bank <= 0 
        fprintf('You have no money in the bank, venmo me for more!, until then good playing!')
        break
        end 
    end
%% Dealing Dealer Hand
dealer_hand = skip_sprites + [shuffled_deck(2) shuffled_deck(4)];
dealer_one_card = skip_sprites + [shuffled_deck(2)];
Unrevealed_Sprite = 3;
dealer_unrevealed_hand = [Unrevealed_Sprite dealer_one_card];
initial_total_dealer = sum(cardValues(dealer_one_card - 20));
key = getKeyboardInput(card_scene);
pause(1)
clc
if strcmp(key, 'space')
    drawScene(card_scene, white_card, dealer_unrevealed_hand);
end
fprintf('\nThe dealer has one card with a value of %d think about whether you want to pass or hit. \nPress Space when you are ready', initial_total_dealer)
key = getKeyboardInput(card_scene);
pause(1)
clc
if strcmp(key, 'space')
    drawScene(card_scene, white_card, player_hand);
end
total_dealer = sum(cardValues(dealer_hand - 20));
%% Player Hand
cardhit = (skip_sprites) + shuffled_deck(4 + hit);
total_player = sum(cardValues(player_hand - 20));
fprintf('\nYour cards have a value of %d. Do you want to hit? (Press 1 to Hit, Press 0 to Stay)\n', total_player);
key = getKeyboardInput(card_scene);
pause(2)
clc
if strcmp(key, '1')
    C = 4;
end
if strcmp(key, '0')
    C = 5;
end

while (C == 4) && (total_player <= 21)
    hit = hit + 1;
    cardhit = (skip_sprites) + shuffled_deck(4 + hit);
    player_hand = [player_hand, cardhit];
    white_card(end + 1) = 2;
    drawScene(card_scene, white_card, player_hand)
    total_player = total_player + sum(cardValues(cardhit - 20));
if total_player > 21
    cardValues = [1:10 10 10 10, 1:10 10 10 10, 1:10 10 10 10, 1:10 10 10 10];
    total_player = sum(cardValues(player_hand - 20));
end
if total_player >= 21
    C=5;
     break
end
if strcmp(key, '0')
    C=5;
    pause(2)
    clc
    break
end 
fprintf('\nYour cards have a value of %d. Do you want to hit? (Press 1 to Hit, Press 0 to Stay)\n', total_player)
key = getKeyboardInput(card_scene);
if strcmp(key, '1')
pause(1)
clc
hit = hit + 1;
white_card(end+1) = 2;
newcardhit = (skip_sprites + hit) + shuffled_deck(4 + hit);
player_hand = [player_hand, newcardhit];
drawScene(card_scene, white_card, player_hand)
total_player = total_player + sum(cardValues(newcardhit - 20))
end 
if strcmp(key, '0')
    C=5;
    pause(2)
    clc
    break
end 
if total_player >= 21
    C = 5;
     break
end
fprintf('\nYour cards have a value of %d. Do you want to hit? (Press 1 to Hit, Press 0 to Stay)\n', total_player)
key = getKeyboardInput(card_scene);
strcmp(key, '1')
pause(1)
clc
end 

if total_player > 21 && bank >= 0
      fprintf('\nYou Busted! You lose!\n')
                bank = bank;
                losses = losses + 1;
fprintf('You now have %d in the bank! Would you like to play again? Click Y for Yes, N for No', bank)
key = getKeyboardInput(card_scene)
pause(5)
clc 
if strcmp(key, 'y')
    fprintf('\nI am glad your ready to play again! Currently you have %d win, %d losses, %d pushes, and %d in the bank', wins, losses, push, bank)
    continue
end 
key = getKeyboardInput(card_scene)
pause(5)
clc
if strcmp(key, 'n')
    fprintf('\nThank you for playing, I hope you enjoyed!')
    break
end  
                if bank <= 0 
        fprintf('You have no money in the bank, venmo me for more!, until then good playing!')
        break
                end 
end
   



%% Dealer Hand
if (C == 5) && (total_player <= 21)
    drawScene(card_scene, white_card, player_hand);
    fprintf('\nYou ended with a %d, when you are ready to see the dealers cards click space.', total_player)
    key = getKeyboardInput(card_scene);
    pause(2)
    clc
    white_card = [2 2];
    if strcmp(key, 'space');
        drawScene(card_scene, white_card, dealer_unrevealed_hand);
        fprintf('\nThis is the dealers unflipped hand, when you are ready to see all the cards click space.')
    end

    key = getKeyboardInput(card_scene);
    pause(2)
    clc
    if strcmp(key, 'space')
        drawScene(card_scene, white_card, dealer_hand);
    end

    fprintf('\nThe dealer has a %d, while you have a %d, it is now the dealers turn to play', total_dealer, total_player)
end
pause(3)
clc
    if total_dealer >= 17
        drawScene(card_scene, white_card, dealer_hand);
        fprintf('\nBecause the value is above 17, the dealer must stand.', total_dealer)
        pause(2)
        clc
if total_dealer>total_player
    fprintf('\nUnfortunately, the dealer had %d, while you had %d. You lose.', total_dealer, total_player)
    bank = bank;
    losses = losses + 1;
    if bank > 0 
fprintf('You now have %d in the bank! Would you like to play again? Click Y for Yes, N for No', bank)
key = getKeyboardInput(card_scene)
pause(5)
clc 
if strcmp(key, 'y')
    fprintf('\nI am glad your ready to play again! Currently you have %d win, %d losses, %d pushes, , and %d in the bank', wins, losses, push, bank)
    continue
end 
key = getKeyboardInput(card_scene)
pause(5)
clc
if strcmp(key, 'n')
    fprintf('\nThank you for playing, I hope you enjoyed!')
    break
end 
    end 
    if bank <= 0 
        fprintf('You have no money in the bank, venmo me for more!, until then good playing!')
        break
    end
end 
if total_dealer<total_player
    fprintf('\nGreat job winning! You had %d, while the dealer ended with %d. \nTake your new money, and gamble more!', total_player, total_dealer)
    bank = bank + Bet_Decision*2
    wins = wins + 1
    if bank > 0 
fprintf('You now have %d in the bank! Would you like to play again? Click Y for Yes, N for No', bank)
key = getKeyboardInput(card_scene)
pause(5)
clc 
if strcmp(key, 'y')
    fprintf('\nI am glad your ready to play again! Currently you have %d win, %d losses, %d pushes, and %d in the bank', wins, losses, push, bank)
    continue
end 
key = getKeyboardInput(card_scene)
pause(5)
clc
    end 
if strcmp(key, 'n')
    fprintf('\nThank you for playing, I hope you enjoyed!')
    break
end 
    if bank <= 0 
        fprintf('You have no money in the bank, venmo me for more!, until then good playing!')
        break
    end
end 
    end
    while total_dealer < 17
        DHit = DHit + 1;
        dealerHit = (skip_sprites) + (shuffled_deck(5 + DHit));
        dealer_hand = [dealer_hand, dealerHit];
        pause(1)
        white_card(end+1)=2;
        drawScene(card_scene, white_card, dealer_hand)
        total_dealer = total_dealer + sum(cardValues(dealerHit - 20));
        if total_dealer > 21
            cardValues = [1:10 10 10 10, 1:10 10 10 10, 1:10 10 10 10, 1:10 10 10 10];
            total_player = sum(cardValues(dealer_hand - 20));
        end
if total_dealer > 21 
                fprintf('\nThe Dealer Busted, you win!\n')
                bank = bank + Bet_Decision*2
                wins = wins + 1
                if bank > 0 
fprintf('You now have %d in the bank! Would you like to play again? Click Y for Yes, N for No', bank)
key = getKeyboardInput(card_scene)
pause(5)
clc 
if strcmp(key, 'y')
    fprintf('\nI am glad your ready to play again! Currently you have %d win, %d losses, %d pushes, and %d in the bank', wins, losses, push, bank)
    continue
end 
key = getKeyboardInput(card_scene)
pause(5)
clc
if strcmp(key, 'n')
    fprintf('\nThank you for playing, I hope you enjoyed!')
    break
end 
                end 
                if bank <= 0 
        fprintf('You have no money in the bank, venmo me for more!, until then good playing!')
        break
                end 
end
    end 
    
if total_dealer>total_player
    fprintf('\nUnfortunately, the dealer had %d, while you had %d. You lose.', total_dealer, total_player)
    bank = bank
    losses = losses + 1
    if bank > 0 
fprintf('You now have %d in the bank! Would you like to play again? Click Y for Yes, N for No', bank)
key = getKeyboardInput(card_scene)
pause(5)
clc 
if strcmp(key, 'y')
    fprintf('\nI am glad your ready to play again! Currently you have %d win, %d losses, %d pushes, and %d in the bank', wins, losses, push, bank)
    continue
end 

if bank <= 0 
        fprintf('You have no money in the bank, venmo me for more!, until then good playing!')
        break
end 
    end
    
end

if total_dealer<total_player
    fprintf('\nGreat job winning! You had %d, while the dealer ended with %d. \nTake your new money, and gamble more!', total_player, total_dealer)
    bank = bank + Bet_Decision*2
    wins = wins + 1
    if bank > 0 
fprintf('You now have %d in the bank! Would you like to play again? Click Y for Yes, N for No', bank)
key = getKeyboardInput(card_scene)
pause(5)
clc 
if strcmp(key, 'y')
    fprintf('\nI am glad your ready to play again! Currently you have %d win, %d losses, %d pushes, and %d in the bank', wins, losses, push, bank)
    continue
end 

if bank <= 0 
        fprintf('You have no money in the bank, venmo me for more!, until then good playing!')
        break
end 
    end
end

if total_dealer == total_player
    fprintf('\nYou guys pushed with a %d! You gain and lose nothing.', total_dealer)
    bank = bank + Bet_Decision
    push = push + 1
    if bank > 0 
fprintf('You now have %d in the bank! Would you like to play again? Click Y for Yes, N for No', bank)
key = getKeyboardInput(card_scene)
pause(5)
clc 
if strcmp(key, 'y')
    fprintf('\nI am glad your ready to play again! Currently you have %d win, %d losses, %d pushes, and %d in the bank', wins, losses, push, bank)
    continue
end 
    end 
    if bank <= 0 
        fprintf('You have no money in the bank, venmo me for more!, until then good playing!')
        break
    end
end 
end