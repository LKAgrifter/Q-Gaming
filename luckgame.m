function menurunning = luckgame()

clc
clear all
close all

menurunning = true;

%%Game Setup
%set the display up
BombGameScreen = simpleGameEngine('retro_cards.png',16,16,10,[255,255,255]);
BombGamedisplay = [7,7,7,7,7,7,7,7,7,7;7,7,7,7,7,7,7,7,7,7];
drawScene(BombGameScreen,BombGamedisplay)
Game = 1;
%use to set up first level

%% Logic of game
while Game == 1
    %set scene for level
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level one')
    xlabel('Pick one card')
    %set maouse input to select a card from scene
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    %set up the bombs
    if x == r && y == 1 || y == 2
        fprintf('You made it to level 1\n')
        gameover = 1;
        %send to the game over loop if pressed bomb
        break
    else
        Game = 2;
        %send to next level
        break   
    end
end

while Game == 2
pause(2)
%set scene for level
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level two')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    e = randi(10);
    %set up the bombs
    if x == r || x == e && y == 1 || y == 2
        fprintf('You made it to level 2\n')
        gameover = 1;
        %send to the game over loop if pressed bomb
        break
    else
        Game = 3;
        %send to next level
        break   
    end
end
while Game == 3
pause(2)
%set scene for level
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level three')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    e = randi(10);
    w = randi(10);
%set up the bombs
    if x == r || x == e || x == w && y == 1 || y == 2
        fprintf('You made it to level 3\n')
        gameover = 1;
        %send to the game over loop if pressed bomb
        break
    else
        Game = 4;
        %send to next level
        break   
    end
end

while Game == 4
pause(2)
%set scene for level
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level four')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    e = randi(10);
    w = randi(10);
    q = randi(10);
    %set up the bombs
    if x == r || x == e || x == w || x == q && y == 1 || y == 2
        fprintf('You made it to level 4\n')
        gameover = 1;
        %send to the game over loop if pressed bomb
        break
    else
        Game = 5;
        %send to next level
        break   
    end
end

while Game == 5
pause(2)
%set scene for level
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
    %set up the bombs
    if x == r || x == e || x == w || x == q || x == a&& y == 1 || y == 2
        fprintf('You made it to level 5\n')
        gameover = 1;
        %send to the game over loop if pressed bomb
        break
    else
        Game = 6;
        %send to next level
        break   
    end
end


while Game == 6
pause(2)
%set scene for level
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level six')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    e = randi(10);
    w = randi(10);
    q = randi(10);
    a = randi(10);
    s = randi(10);
    %set up the bombs
    if x == r || x == e || x == w || x == q || x == a || x == s && y == 1 || y == 2
        fprintf('You made it to level 6\n')
        gameover = 1;
        %send to the game over loop if pressed bomb
        break
    else
        Game = 7;
        %send to next level
        break   
    end
end


while Game == 7
pause(2)
%set scene for level
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level seven')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    e = randi(10);
    w = randi(10);
    q = randi(10);
    a = randi(10);
    s = randi(10);
    d = randi(10);
    %set up the bombs
    if x == r || x == e || x == w || x == q || x == a || x == s || x == d && y == 1 || y == 2
        fprintf('You made it to level 7\n')
        gameover = 1;
        %send to the game over loop if pressed bomb
        break
    else
        Game = 8;
        %send to next level
        break   
    end
end


while Game == 8
pause(2)
%set scene for level
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level eight')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    e = randi(10);
    w = randi(10);
    q = randi(10);
    a = randi(10);
    s = randi(10);
    d = randi(10);
    h = randi(10);
    %set up the bombs
    if x == r || x == e || x == w || x == q || x == a || x == s || x == d || x == h && y == 1 || y == 2
        fprintf('You made it to level 8\n')
        gameover = 1;
        %send to the game over loop if pressed bomb
        break
    else
        Game = 9;
        %send to next level
        break   
    end
end

while Game == 9
pause(2)
%set scene for level
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level nine')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    e = randi(10);
    w = randi(10);
    q = randi(10);
    a = randi(10);
    s = randi(10);
    d = randi(10);
    h = randi(10);
    k = randi(10);
    %set up the bombs
    if x == r || x == e || x == w || x == q || x == a || x == s || x == d || x == h || x == k && y == 1 || y == 2
        fprintf('You made it to level 9\n')
        gameover = 1;
        %send to the game over loop if pressed bomb
        break
    else
        Game = 10;
        %send to next level
        break   
    end
end

while Game == 10
pause(2)
%set scene for level
    figure (1)
    drawScene(BombGameScreen,BombGamedisplay)
    title('level ten')
    xlabel('Pick one card')
    [x,y] = getMouseInput(BombGameScreen);
    r = randi(10);
    e = randi(10);
    w = randi(10);
    q = randi(10);
    a = randi(10);
    s = randi(10);
    d = randi(10);
    h = randi(10);
    k = randi(10);
    l = randi(10);
    %set up the bombs
    if x == r || x == e || x == w || x == q || x == a || x == s || x == d || x == h || x == k || x == l && y == 1 || y == 2
        fprintf('You made it to level 10\n')
        gameover = 1;
        %send to the game over loop if pressed bomb
        break
    else
        Game = 10;
        gameover = 1;
        break   
    end
end

while gameover == 1
    %gameover loop
    if Game < 5
        %set up loss screen
        %print the stats
    fprintf ('nice job playing\n')
    fprintf('You made it to level %i\n', Game)
    fprintf('Game Over\n')
    %disply the game over image
    img = imread('GameOver34.png');
    image(img)
    %play the audio
    [sound1,sound2] = audioread('Willy Wonka??? ???YOU LOSE! GOOD DAY SIR!???.wav');
    sound(sound1,sound2,16)
    pause(3)
    if Game >= 5
    fprintf ('WOW NICE JOB you made it far, nice guessing\n')
    fprintf('Game Over\n')
    img2 = imread('YouWin.jpg');
    [sound1,sound2] = audioread('Mario_Kart_DS_Music_-_Win_Race_1st_Place_HD.wav');
    sound(sound1,sound2,16)
    %play the audio
    image(img2)
    %disply the you win image
    pause(3)
    break
    else
        break
    end
    close all
end
