%Clair Cunningham     Numerical Methods     Homework #2
%freemat

%% Problem 1(book 3.4)
% Create a program that determines the smallest number, xmin, that the computer can distinguish from zero
%Clear all previous programs, commands, and windows
    clear all; close all; clc;

    xtest = 1;
    xmin = 1;

    while xtest ~= 0
        xtest = xtest/10;
        if xtest == 0
            else
            xmin = xtest;
        end
   end

fprintf('The smallest number is: %e\n',xmin);


%Problem 2(book 3.13) is listed under a separate file as a function

%% Problem 3(book 4.1)
clear all; close all; clc;
trueval = cos(pi/3);
ed = .01;
ea = 100;
et = 1;
n = 2;
xold = 1;
x = 1;
xa(n/2)=x;
eaa(n/2) = ea;
eta(n/2) = et;
while ea>+ed
    x = x+(-1)^(n/2)*((pi/3)^n)/factorial(n);
    xa(n/2+1) = x;
    ea = abs((x-xold)/x)*100;
    eaa(n/2+1) = ea;
    et = abs((x-trueval)/(trueval))*100;
    eta(n/2+1) = et;
    n = n + 2;
    xold = x;
end
n = n/2;
fprintf('x=%u ea=%u et=%u n=%u\n',x, ea, et, n);

%% Problem 4(book4.4)
clear all; close all; clc;
x = 1;
f = log(x);
xt = 2.5;
ft = log(xt);
et =  abs((ft-f)/f)*100;
fa(1) = ft;
eta(1) = et;
for n = 1:4   
    f = f+(-1)^n*factorial(n-1)*(xt-x)^n/factorial(n);
    fa(n+1) = f;
    et = abs((ft-f)/f)*100;    
    eta(n+1) = et;    
end
fprintf('F(~x)=%f F(2.5)=%f Et=%f\n',f,ft,et);

%% Problem 5(book4.9)
clear all; close all; clc
%e = emissivity, t = absolute temp, sigma =  Boltzman constant, 
e = 0.90;
eerror = .05;
t = 550;
terror = 20;
r = 0.15;
rerror = .01;
a = 4*pi*r^2;
aerror = abs(8*pi*r)*rerror;
sigma = 5.67e-8;
H = a*e*sigma*t^4;
et = abs(e*sigma*t^4)*aerror + abs(a*sigma*t^4)*eerror + abs(a*e*sigma*4*t^3)*terror;
t2 = 650;
t2error = 40;
H2 = a*e*sigma*t2^4;
et2 = abs(e*sigma*t^4)*aerror + abs(a*sigma*t^4)*eerror + abs(a*e*sigma*4*t^3)*t2error;
fprintf('H at 550° = %0.0f+/-%0.0f, and H at 650°=%0.0f+/-%0.0f\n',H,et,H2,et2);