function poly_int(x, y)
%Part 2c implemntation of the function that takes an array of
%interpolation nodes, x, and an array of function values, y, as
%input and computes the interpolating polynomial
    
    n = size(x,2);
    A = ones(n);
    for i = 1:n
        for j = 2:n
            A(i,j) = A(i,j-1)*(x(i)-x(j-1));
        end
    end
    
    a(1) = y(1);
    for i = 2:n
        temp = 0;
        for j = 2:i
            temp = temp + a(j-1)*A(i,j-1);
        end
        a(i) = (y(i)-temp)/A(i,i);
    end
end

          