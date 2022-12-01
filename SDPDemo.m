clc
clear all
close all

%backround = simpleGameEngine('grid.png', 10, 10, 5, [161,130,45]);
%board = [1,2,3,4,5; 1,2,3,4,5; 1,2,3,4,5; 1,2,3,4,5];
%drawScene(backround,board)
BombGameScreen = simpleGameEngine('retro_cards.png',16,16,5,[255,255,255]);
BombGamedisplay = [7,7,7,7,7;7,7,7,7,7];
drawScene(BombGameScreen,BombGamedisplay)
Game = 1;
%% Logic of game
while Game == 1
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level one')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(5);
    disp(r)
    if x == r && y == 1 || y == 2
        fprintf('You made it to level 1\n')
        gameover = 1;
    else
        Game = 2;
        break   
    end
end
disp(x)
disp(y)
while Game == 2
pause(2)
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level two')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(5);
    e = randi(5);
    disp(r)
    if x == r || x == e && y == 1 || y == 2
        fprintf('You made it to level 2\n')
        gameover = 1;
    else
        Game = 3;
        break   
    end
end
while Game == 3
pause(2)
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level three')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(5);
    e = randi(5);
    disp(r)
    if x == r || x == e && y == 1 || y == 2
        fprintf('You made it to level 3\n')
        gameover = 1;
    else
        Game = 4;
        break   
    end
end


