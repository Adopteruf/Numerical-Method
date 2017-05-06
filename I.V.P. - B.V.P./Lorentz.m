function Lorentz
%input function
f1 = @(x)(10*(-x(1) + x(2)));
f2 = @(x)(28*x(1) - x(2) -x(1)*x(3));
f3 = @(x)(-x(3)*(8/3) + x(1)*x(2));
%initial values
x0 = [1,1,0];
a = 0;
b = 100;
h = 0.0025;
N = floor((b - a)/h);
rx = euler(f1, f2, f3, a, x0, h, N);
x1 = rx(:,1);
x2 = rx(:,2);
x3 = rx(:,3);
figure;plot3(x1,x2,x3);
title('Lorentz Curve');
figure; plot(x1,x3);
title('Projection of the Lorentz Curve');
end

%use the euler method to solve the I.V.P.
function x = euler(f1, f2, f3, a, x0, h, N) %f is a cell
num = length(x0);
x = zeros([N, num]); %space for storing final result
for m = 1:N
    x(m,:) = x0;
    t = a + m * h;
    x0(1) = x0(1) + h * f1([x0,t]);
    x0(2) = x0(2) + h * f2([x0,t]);
    x0(3) = x0(3) + h * f3([x0,t]);
end
x = [x;x0];
end