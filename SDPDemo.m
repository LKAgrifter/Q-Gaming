clc
clear all
close all

%backround = simpleGameEngine('grid.png', 10, 10, 5, [161,130,45]);
%board = [1,2,3,4,5; 1,2,3,4,5; 1,2,3,4,5; 1,2,3,4,5];
%drawScene(backround,board)
BombGameScreen = simpleGameEngine('retro_cards.png',16,16,5,[255,255,255])
BombGamedisplay = [7,7,7,7;7,7,7,7]
drawScene(BombGameScreen,BombGamedisplay)

Game = Running;

while Game == Running
    drawScene(BombGameScreen,BombGamedisplay)
    [x,y] = getMouseInput(BombGameScreen);
    if x == 2 && y == 1
        close all
        fprintf('Have a good day!\n')
        menurunning = false;
    end
end