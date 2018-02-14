% Jude Sheron Balasingam
% 100504990
close all;
upperBErr = [1 1];
xx = linspace(0, 3, 1000);
yy = reallog((xx+2)./(xx+1));

%setup figure 1
figure(1);
hFig = figure(1);
set(gcf,'PaperPositionMode','auto');
set(hFig, 'Position', [0 0 2000 1000]);
axis equal;
print -depsc2 correlation.eps;
for k = 3:100
    x = linspace(0,3,k);
    y = reallog((x+2)./(x+1));
    V = vander(x);
    P = V\y';
    f = polyval(P, xx);
    err = abs(yy-f);
    upperBErr(k-2) = max(err);
    
    %compares polynomial and f from the 1st(3) to every 11th(13) plot
    %which is enough to show the error gets smaller with
    %more nodes
    if mod(k-2,10) == 1
        pos = floor((k-2)/10)+1;
        %blue line being the polynomial interpolant
        subplot(2, 5, pos), plot(x, y, xx, f);
        title(['k =  ',num2str(k)]);
        xlabel('x');
        ylabel('f(x)');
    end
end

%plotting the error as a function of k
figure(2);
k =3:100;
semilogy(k, upperBErr);
title('Error as a function of k=[3,100]');
xlabel('k');
ylabel('Max Function-Polynomial Error');
