function Bisection
f = @(s)s.^3 - s.^2 - s - 1;
x0 = 0.1;
a = 0;
b = 10;
TOL = 10e-7;
maxIter = 20;
[x, iteration] = Bisection_Method(x0, a, b, f, maxIter, TOL);
disp(['The zero of the function is approximated as ', num2str(x),'by using Bisection method.']);
disp([num2str(iteration), ' iterations is in need in Bisection method.']);
end

function [x, iteration] = Bisection_Method(x0, a, b, f, maxIter, TOL)
%plot function f
plot(a:0.01:b, f(a:0.01:b), 'k-');
hold on;
x = x0;
for k = 1:maxIter
    z = f(x);
    plot(x,z,'o');
    if z*f(a) < 0
        b = x;
    else
        a = x;
    end
    temp = (b + a)/2;
    if abs(temp - x) <= TOL
        x = temp;
        return
    end
    x = temp;
end
iteration = k;
end