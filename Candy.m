clc
clear
close all
x = [1,2,3,4,5];
for k = 1:1:5
    fprintf('x(%i) = %i\n', k, x(k))
end
for k = 1:1:5
    y(k)= k*2;
    fprintf('\ny(%i) = %i\n',k,y(k))
end
ytotal = 0;
for k = 1:1:5
        y(k) = k*2;
        ytotal = ytotal + y(k);
        fprintf('y(%i) = %i and ytotal = %i\n', k, y(k), ytotal)
end
% user = input('Vector of positive or negative int: ')
% userLength = length(user)
% for j = 1:1:userLength
%     if user(j) < 0
%         fprintf('%d is negative\n', user(j))
%     elseif user(j) > 0
%         fprintf('%d is positive\n',user(j))
%     end
% end

for r = 1:1:5
    for c = 1:1:4
        t(r,c) = r*c;
        fprintf('r = %i, c = %i\t',r,c)
    end
    fprintf('\n')
end
t
    