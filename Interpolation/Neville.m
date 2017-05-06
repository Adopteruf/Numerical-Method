function Neville
x = 1:10;
y = sin(x);
a = min(x):0.01:max(x);
z = zeros(size(a));
for k = 1:length(a)
    z(k) = NL(a(k), x, y);
end
plot(x, y, 'ro');
hold on;
plot(a, z, 'k-');
title('lagrange interpolation in Neville Method');
end

%approximate the values in x0
function value = NL(x0,nodes,fnodes)
N = length(nodes);
Q =[fnodes',zeros([N,N-1])];
for x = 1:N-1
   for y = 1:x
       Q(x+1,y+1) = ((x0 - nodes(x-y+1))* Q(x+1,y-1+1) - (x0-nodes(x+1)) * Q(x-1+1,y-1+1))/(nodes(x+1)-nodes(x-y+1));
   end
end
value = Q(N,N);
end