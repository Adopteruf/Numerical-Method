function fibonaci
fibo17 = fibo(17);
disp(['The 17th term in fibonaci sequence is ', num2str(fibo17)]);
fiboseq17 = fiboseq(17);
disp('The first 17 terms in fibonaci sequence are');
disp(fiboseq17);
end

%nth fibonaci terms in the sequence
function num = fibo(n)
if n == 1||n == 2
    num = 1;
else
    num = fibo(n - 1) + fibo(n - 2);
end
end

%the first n terms in fibonaci sequence
function seq = fiboseq(n)
seq = ones([1, n]);
if n <= 2
    return
end
for k = 3:n
    seq(k) = seq(k - 1) + seq(k - 2);
end
end