function SteffensenMethod
syms x;
f = x.^3 - x.^2 - x - 1;
x0 = 1.3;
a = 1;
b = 2;
maxIter = 20;
TOL = 10e-7;
[x, iter_x_Seq, iteration] = SM(x0, f, maxIter, TOL);
if max(iter_x_Seq) > b
    b = max(iter_x_Seq) + 0.5;
end
plot(a:0.001:b, subs(f, 'x', a:0.001:b), 'k-');
hold on;
plot(iter_x_Seq, subs(f, 'x', iter_x_Seq), 'ro');
plot(iter_x_Seq(end), subs(f, 'x', iter_x_Seq(end)),'ko')
title(['Steffensen Method: ', num2str(iteration), ' iterations']);
disp(['The zero of the function is approximated as ', num2str(x), ' by applying Aitken method on fixed point iteration method.']);
disp([num2str(iteration), ' iterations is in need in Stenffensen Mehthod.']);
end

function [x, iter_x_Seq, iteration] = SM(x0, f, maxIter, TOL)
%use the Newton method as the basic algorithm
fp = diff(f);
g = matlabFunction(f./fp);
g = @(x) x - g(x);
deta2 = @(z) z(1) - ((z(2) - z(1))^2)/(z(1) - 2*z(2) + z(3));
%initial values
x = x0;
%create the max space before iteration
iter_x_Seq = [x0, nan.*ones([1, maxIter])];
for k = 1:maxIter
    x1 = g(x);
    x2 = g(x1);
    if abs(x2 - x1) <=TOL
        iter_x_Seq(k + 1) = x2; 
        break
    end
    temp = deta2([x,x1,x2]);
    iter_x_Seq(k + 1) = temp;
    if abs(temp - x) <= TOL
        break
    end
    x = temp;
end
iter_x_Seq(isnan(iter_x_Seq)) = [];
x = iter_x_Seq(end);
iteration = length(iter_x_Seq) - 1;
end