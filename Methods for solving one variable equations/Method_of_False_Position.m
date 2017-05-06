function Method_of_False_Position
%it is based on SecantMethod except for one point which make and this method is more efficient
f = @(x)x.^3 - x.^2 - x - 1;
x0 = [1.2, 1.3];
a = 1;
b = 2;
maxIter = 20;
TOL = 10e-7;
[x, iter_x_Seq, iteration] = MFP(x0, f, maxIter, TOL);
if max(iter_x_Seq) > b
    b = max(iter_x_Seq) + 0.5;
end
plot(a:0.001:b, f(a:0.001:b), 'k-');
hold on;
plot(iter_x_Seq, f(iter_x_Seq), 'ro');
plot(iter_x_Seq(end), f(iter_x_Seq(end)), 'ko');
title(['Method of False Position: ', num2str(iteration), ' iterations']);
disp(['The zero of the function is approximated as ', num2str(x), ' by using Secant method.']);
disp([num2str(iteration), ' iterations is in need in Method of False Position.']);
end

function [x, iter_x_Seq, iteration] = MFP(x0, f, maxIter, TOL)
g = @(x) x(2) - (f(x(2)).*(x(2) - x(1))./(f(x(2)) - f(x(1)))); 
iter_x_Seq = [x0, nan.*ones([1, maxIter])];
x = x0;
for k = 1:maxIter
    temp = g(x);
    iter_x_Seq(k + 1) = temp;
    if abs(temp - x(end)) <= TOL
        break
    end
    %that is the place different from the Secant Method
    if f(temp)*f(x(end)) < 0
        x = [x(end), temp];
    else
        x = [x(1), temp];
    end
end
iter_x_Seq(isnan(iter_x_Seq)) = [];
x = iter_x_Seq(end);
iteration = length(iter_x_Seq) - 1;
end