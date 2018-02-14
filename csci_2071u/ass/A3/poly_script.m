%script to test an increasing numnber of interpolation nodes.
%the order of complexity is O(n)
m = linspace(2,1000);
for n = 1:m
    for k=1:n
        x(k) = -1 + k*2/n;
    end
    y = exp(x);
    
    tic;
    poly_int(x, y);
    t(n) = toc;
end

loglog(m,t);
hold on;
ylabel('Time Taken(seconds)');
xlabel('n');
hold off;