% Jude Sheron Balasingam
% 100504990

x = 0:0.1:3;
f = reallog((x+2)./(x+1)); %original function

co = [1/3*reallog(2), -1/2*reallog(1.5), 1/6*reallog(1.25)];
%coefficients in front of each x^2, x and 1
x2 = [1, 1, 1]; 
x1 = [-4, -3, -1];
x0 = [3, 0, 0];

a2 = sum(x2.*co); %coefficent of x^2
a1 = sum(x1.*co); %coefficient of x
a0 = sum(x0.*co); %coefficient of 1
f2 = a2*x.^2+a1*x+a0; %second order Lagrange form equal to f(x)

%to circle the intersections on the plot
pts = [0 1 3];
cPts = reallog((pts+2)./(pts+1));

close all
%plot of interpolation error
err = abs(f2 - f);
scrsz = get(0,'ScreenSize');
figure('Position',[10 scrsz(4)/25 scrsz(3)/2.5 scrsz(4)/2.5]); 
plot(x, err, 'Color', 'black');
title('Interpolation Error: E(x) = |P(x) - f(x)|.');
xlabel('x');
ylabel('E(x)');
hold off;
fprintf('%f', max(err));
%Lagrange and original function plot
figure('Position',[10 scrsz(4)/1.97 scrsz(3)/2.5 scrsz(4)/2.5]);
plot(x, f, 'Color', 'red');
hold on;
shg;
axis([-0.1 3.1 0.2 0.8]);
plot(x, f2, 'Color', 'blue');
plot(pts, cPts, 'o', 'Color', 'black');
title('Function and Interpolant of f(x) = ln(x+2/x+1)');
xlabel('x');
ylabel('f(x)');
legend('function', 'interpolant', 'intersections');
