function [ea] = falseposition(xl, dx, ed)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
xu = xl+dx;
ea = abs((xu-xl)/2);
f = @(x) (x/2)^2-sin(x);
while ea>ed
    if f(xu)*f(xl)<0
        dx = dx/10;             
        xu = xl+dx;
    else
        xl = xu;
        xu = xl+dx;
    end
    
    ea = abs((xu-xl)/2);
end
xr = (xu+xl)/2;
end

