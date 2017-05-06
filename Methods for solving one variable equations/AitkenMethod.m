function AitkenMethod
syms x;
f = x.^3 - x.^2 - x - 1;
x0 = 1.3;
a = 1;
b = 2;
maxIter = 20;
TOL = 10e-7;
[y, iter_y_Seq, iteration] = AM(x0, f, maxIter, TOL);
if max(iter_y_Seq) > b
    b = max(iter_y_Seq) + 0.5;
end
plot(a:0.001:b, subs(f, 'x', a:0.001:b), 'k-');
hold on;
plot(iter_y_Seq, subs(f, 'x', iter_y_Seq), 'ro');
plot(iter_y_Seq(end), subs(f, 'x',iter_y_Seq(end)), 'ko');
title(['Aitken Method: ', num2str(iteration), ' iterations']);
disp(['The zero of the function is approximated as ', num2str(y), ' by applying Aitken method on fixed point iteration method.']);
disp([num2str(iteration), ' iterations is in need in Aitken Method.']);
end

function [y, iter_y_Seq, iteration] = AM(x0, f, maxIter, TOL)
%use the Newton method as the basic algorithm
fp = diff(f);
t = matlabFunction(f./fp);
g = @(x) x - t(x);
deta2 = @(z) z(1) - ((z(2) - z(1))^2)/(z(1) - 2*z(2) + z(3));
%initial values
x = x0;
x1 = g(x);
x2 = g(x1);
%create the max space before iteration
iter_y_Seq = [deta2([x, x1, x2]), nan*ones([1, maxIter])];
for k = 1:maxIter
    x = x1;
    x1 = x2;
    x2 = g(x2);
    temp = deta2([x, x1, x2]);
    iter_y_Seq(k + 1) = temp;
    if abs(iter_y_Seq(k) - iter_y_Seq(k + 1)) <= TOL
        break
    end
end
iter_y_Seq(isnan(iter_y_Seq)) = [];
y = iter_y_Seq(end);
iteration = length(iter_y_Seq) - 1;
end