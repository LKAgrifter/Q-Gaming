clc
clear all
close all

%backround = simpleGameEngine('grid.png', 10, 10, 5, [161,130,45]);
%board = [1,2,3,4,5; 1,2,3,4,5; 1,2,3,4,5; 1,2,3,4,5];
%drawScene(backround,board)
BombGameScreen = simpleGameEngine('retro_cards.png',16,16,5,[255,255,255]);
BombGamedisplay = [7,7,7,7,7;7,7,7,7,7];
drawScene(BombGameScreen,BombGamedisplay)
Game = LevelOne;
%%Logic of game
while Game == LevelOne
    r = randi(10);
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level one')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    t = rand(1,10);
    disp(t)
    if x == r && y == 1
        fprintf('You made it past level 1\n')
    else
        Game = LevelTwo;
    end
end
while Game == LevelTwo
end
