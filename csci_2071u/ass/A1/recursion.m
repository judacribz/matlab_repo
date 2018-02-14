function recursion(x,max,err,res)
%Question 1, Part (d)
%Takes an initial point in (0,2] in the sequence x(k) = g(x(k-1))
%and converges to a unique solution x* through recursion

%Inputs:
%inital value(x), max iterations(max),
%esttimated error(err), residual(res)
%Ouputs the Approximate solution, estimated error,
%and residual to the MATLAB command window.

%Jude Sheron Balasingam
%100504990

k=size(x,2);
if k==1
    fprintf('Iterates:\n');
end

%Calculations
fprintf('x(%i) = %.15f\n', k, x(k));
g = (sin(pi*x(k))-x(k)^2)/(2*pi) + x(k);
x(k+1)=g;
f=sin(pi*x(k+1))-x(k+1)^2;

%Base Case
if (abs(x(k)-x(k+1))<err && abs(f)<res) || k==max
    fprintf('x(%i) = %.15f\n', k+1, x(k+1));
    fprintf('\nApproximate Solution = %.15f\n',x(k+1));
    fprintf('Estimated Error = %.15f\n',abs(x(k)-x(k+1)));
    fprintf('Residual = %.15f\n\n',abs(f));
%Recursive Step
else
    recursion(x,max,err,res);
end
end