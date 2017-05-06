function Newton_method
syms s
f = s.^3 - s.^2 - s - 1;
fp = diff(f);
x0 = 1.5;
a = 1;
b = 2;
maxIter = 10;
TOL = 10e-7;
[x, iter_x_Seq, iteration] = Newton(x0, f, fp, maxIter, TOL);
plot(a:0.001:b, subs(f, 's', a:0.001:b), 'k-');
hold on;
plot(iter_x_Seq, subs(f, 's', iter_x_Seq), 'ro');
plot(iter_x_Seq(end), subs(f, 's', iter_x_Seq(end)), 'ko');
title(['Newton Method: ', num2str(iteration), ' iterations']);
disp(['The zero of the function is approximated as ', num2str(x), ' by using Newton method.']);
disp([num2str(iteration), ' iterations is in need in Newton Method.']);
end

function [x, iterSeq, iteration] = Newton(x0, f, fp, maxIter, TOL)
syms s
g = matlabFunction(s - f./fp);
%Newton method is a special fixed point iteration method
[x, iterSeq, iteration] = FP(x0, g, maxIter, TOL);
end

%fixed point iteration method
function [x, iter_x_Seq, iteration] = FP(x0, g, maxIter, TOL)
iter_x_Seq = [x0, nan*ones([1, maxIter])];
x = x0;
for k = 1:maxIter
    temp = g(x);
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