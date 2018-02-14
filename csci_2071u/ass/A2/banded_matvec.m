function banded_matvec()
%Computes the matrix-vector product of A with a vector x.
%With the given vectors a, b and c that define A where 'a' is the 
%main diagonal of the matrix which goes from 1 to n, 'b' is the
%diagonal above the main diagonal which goes from 1 to n-1, and 'c'
%is the diagonal two above the main diagonal which goes from 1 to n-2.
%all the other values of the Matrix are 0.

% Jude Sheron Balasingam
% 100504990

for k = 2:7
    n = 10^k;
    %test matrix and vector generation
    x = rand(n,1);
    a = rand(1,n);
    b = rand(1,n-1);
    c = rand(1,n-2);
    
    %the product y = Ax
    tic;
    for i=1:n-2
        y(i) = a(i)*x(i) + b(i)*x(i+1) + c(i)*x(i+2);
    end
    y(n-1) = a(n-1)*x(n-1) + b(n-1)*x(n);
    y(n) = a(n)*x(n);
    t(k-1)= toc;  
    
    %the product x = Ay
    tic;
    for k = 2:4
        (diag(a)+diag(b,1)+diag(c,2))*x;
    end
    m(k-1)= toc;  
end

n = 10.^(2:7);
shg
semilogx(t, n); %actual time
hold on;
semilogx(5*n-6, n, 'Color', 'red'); %prediction
semilogx(m, n, 'Color', 'green'); %Matlab built in Ax calculation time
legend('Matrix*Vector','prediction','Matrix-Product*y-Vector');
ylabel('Time Taken(seconds)');
xlabel('n');
title('Time Taken Vs. n = 10^k');
hold off;

