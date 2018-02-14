function [xp] = steffensen(f,fp,x,epse,N)
%Question 2, Part (a) and (b)
%function that takes two Newton steps and sets x based on the y values
%attained from those 2 steps.
%In order to compare quadratic convergence, the Newton method is also
%initiated within this function. The plots of both the Steffensen and 
%Newton methods are also output to check for quadratic convergence.

%Inputs:
%function(f), function prime(fp), initial guess(x), 
%error(epse), Number of repetition(N)
%Ouputs the Approximate solution, estimated error,
%and residual to the MATLAB command window.
%Outputs the absolute value of f(x) until the solution x* is reached.
%Then x* is also ouput.

%Jude Sheron Balasingam
%100504990

for k=1:N
    y(k) = x(k);
    
    % 2 Newton Steps
    for i=k:k+1
        r(i) = f(y(i));
        del(i) = -r(i)/fp(y(i));
        y(i+1) = y(i) + del(i);
    end
    
    %setting x
    x(k+1) = y(k) - ((y(k+1)-y(k))^2) / (y(k+2)-2*y(k+1)+y(k));
    
    %displaying the residual
    res(k) = abs(f(x(k+1)));
    fprintf('|f(%.16f)| = %.16f\n', x(k+1), res(k));
    
    %checking for convergence
    if res(k) < epse
        fprintf('\nconverged! ');
        break;
    end
end

xp = x(k+1);
fprintf('x* = %.16f\n\n',xp);

%Question 2, Part(b) shows quadratic convergence in the Steffensen method
%while the convergence in the Newton method is not quadratic.

%plotting Steffensen method
res = [abs(f(x(1))),res];
semilogy(x,res, 'Marker', 'o');
hold on

%Newton Method and plotting
x=1;
r=0;
for k=1:N
    r(k) = f(x(k));
    del(k) = -r(k)/fp(x(k));
    x(k+1) = x(k) + del(k);
    
    %checking for convergence
    if abs(r(k)) < epse
        break;
    end
end

r(k+1) = f(x(k+1));
semilogy(x,abs(r), 'Color', 'red', 'Marker', '*');
hold off
end

