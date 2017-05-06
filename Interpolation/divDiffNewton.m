function divDiffNewton
x = 1:10;
y = exp(x) + 1;
a = min(x):0.001:max(x);
pol = ddn(x, y);
syms z
temp = 1;
f = pol(1);
for k = 2:length(pol)
    temp = temp.*(z - x(k-1));
    f = f + pol(k).*temp;
end
plot(x, y, 'ro');
hold on;
plot(a, subs(f, 'z', a), 'k-');
title('lagrange interpolation in Newton-divided-difference');
end

function pol = ddn(nodes, fnodes)
N = length(nodes);
pol = [fnodes(1), zeros([1,N-1])];
for k = 1:N-1
    diff = fnodes(2:end) - fnodes(1:end-1);
    num = nodes(1+k:end) - nodes(1:end-k);
    fnodes = diff./num;
    pol(k + 1) = fnodes(1);
end
end