function iteration(x0,max,err,res)
%Question 1, Part (c)
%Takes an initial point in (0,2] in the sequence x(k) = g(x(k-1))
%and converges to a unique solution x* through iteration.

%Inputs:
%inital value(x0), max iterations(max),
%esttimated error(err), residual(res)
%Ouputs the Approximate solution, estimated error,
%and residual to the MATLAB command window.

%Jude Sheron Balasingam
%100504990

fprintf('Iterates:\n')
x(1)=x0;
for k = 1:max
    fprintf('x(%i) = %.15f\n', k, x(k));
    g = (sin(pi*x(k))-(x(k))^2)/(2*pi) + x(k);
    x(k+1) = g;

    f = sin(pi*x(k)) - (x(k))^2;
    
    %checks for convergence based on the estimated error and residual
    if abs(x(k)-x(k+1))<err && abs(f)<res
        break;
    end
end

fprintf('\nApproximate Solution = %.15f\n',x(k));
fprintf('Estimated Error = %.15f\n',abs(x(k)-x(k-1)));
fprintf('Residual = %.15f\n\n',abs(f));
end

