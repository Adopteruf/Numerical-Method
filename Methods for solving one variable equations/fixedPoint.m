function fixedPoint
f = @(s)-1.1.*s.*log(s) - s;
%split up the function into g(s) - s
g = @(x) f(x) + x;
x0 = 0.1;
a = 0;
b = 1;
TOL = 10e-5;
maxIter = 10;
[x, iterSeq, iteration] = FP(x0, g, maxIter, TOL);
plot(a:0.001:b, g(a:0.001:b),'k-')
hold on;
plot(a:0.001:b, a:0.001:b, '-');
plot(iterSeq(1,:), iterSeq(2,:),'R-');
disp(['The zero of the function is approximated as ', num2str(x), ' by using fixed point iteration method.']);
disp([num2str(iteration), ' iterations is in need in fixed point iteration.']);
end

function [x, iterSeq, iteration] = FP(x0, g, maxIter, TOL)
x = x0;
iterSeq = [];
for k = 1:maxIter
    temp = g(x);
    iterSeq = [iterSeq, [x; temp]];
    if abs(temp - x) <= TOL
        break
    end
    iterSeq = [iterSeq, [temp; temp]];
    x = temp;
end
iteration = k;
end