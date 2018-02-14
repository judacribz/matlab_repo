% Jude Sheron Balasingam
% 100504990

close all;
f=@(x) tan(x);
fp=@(x) (sec(x))^2; %derivative of tanx
x = 1.0;
h = [1 1];
EP = h;
E = h;

fprintf('  h\t\t(Delta+f)(1.0;h)\tE+(1.0;h)\t(Deltaf)(1.0;h)\t\tE(1.0;h)\n');
for e = 1:16
    h(e) = 10^(-(e-1));
    ht = h(e); %temp h
    
    dPF = (f(x+ht)-f(x))/ht; %forward finite difference
    dF = (f(x+ht)-f(x-ht))/(2*ht); %centered finite difference
    EP(e) = abs(fp(x)-dPF); %forward error
    E(e) = abs(fp(x)-dF); %finiite error
    
    fprintf('10^%i\t\t%f\t\t%f\t\t%f\t\t%f\n',-e,dPF,EP(e),dF,E(e));    
end

loglog(h, EP, 'b.-');
hold on;
xlabel('h');
loglog(h, E, 'g.-');
loglog(h, h, 'k');
loglog(h, h.^2, 'r');
legend show;
legend('E+','E','O(h)','O(h^2)','Location',[.735, .15, .15, .15]);
hold off;
