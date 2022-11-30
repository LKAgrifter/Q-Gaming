clc
clear all
close all

%backround = simpleGameEngine('grid.png', 10, 10, 5, [161,130,45]);
%board = [1,2,3,4,5; 1,2,3,4,5; 1,2,3,4,5; 1,2,3,4,5];
%drawScene(backround,board)
BombGameScreen = simpleGameEngine('retro_cards.png',16,16,5,[255,255,255])
BombGamedisplay = [7,7,7,7;7,7,7,7]
drawScene(BombGameScreen,BombGamedisplay)

Game = LevelOne;
%%Logic of game
while Game == LevelOne
    drawScene(BombGameScreen,BombGamedisplay)
    title('level one')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    if x == 2 && y == 1
        close all
        fprintf('Have a good day!\n')
        menurunning = false;
    else
        Game = LevelTwo;
    end
end
while Game == LevelTwo
end
