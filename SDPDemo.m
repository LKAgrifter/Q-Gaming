clc
clear all
close all


BombGameScreen = simpleGameEngine('retro_cards.png',16,16,10,[255,255,255]);
BombGamedisplay = [7,7,7,7,7,7,7,7,7,7;7,7,7,7,7,7,7,7,7,7];
drawScene(BombGameScreen,BombGamedisplay)
Game = 1;

%% Logic of game
while Game == 1
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level one')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    
    if x == r && y == 1 || y == 2
        fprintf('You made it to level 1\n')
        gameover = 1;
        break
    else
        Game = 2;
        break   
    end
end

while Game == 2
pause(2)
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level two')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    e = randi(10);
    
    if x == r || x == e && y == 1 || y == 2
        fprintf('You made it to level 2\n')
        gameover = 1;
        break
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
    r = randi(10);
    e = randi(10);
    w = randi(10);

    if x == r || x == e || x == w && y == 1 || y == 2
        fprintf('You made it to level 3\n')
        gameover = 1;
        break
    else
        Game = 4;
        break   
    end
end

while Game == 4
pause(2)
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level four')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    e = randi(10);
    w = randi(10);
    q = randi(10);
    
    if x == r || x == e || x == w || x == q && y == 1 || y == 2
        fprintf('You made it to level 4\n')
        gameover = 1;
        break
    else
        Game = 5;
        break   
    end
end

while Game == 5
pause(2)
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level five')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    e = randi(10);
    w = randi(10);
    q = randi(10);
    a = randi(10);
    
    if x == r || x == e || x == w || x == q || x == a&& y == 1 || y == 2
        fprintf('You made it to level 5\n')
        gameover = 1;
        break
    else
        Game = 6;
        break   
    end
end


