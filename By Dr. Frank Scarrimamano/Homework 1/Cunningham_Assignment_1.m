%Clair Cunningham     Numerical Methods     Assignment #1     12/04/2012

%% Problem #1
% References fuction to compute values of y based on x, and values of z based on y.
% Graphs functions y and z versus x on the same graph.
% Differentiates with legend and different line styles for y and z.
% Reset Matlab variables, command window, and figures.
clear all; close all; clc
%Constants
a = 2;
b = 5;
%Array of X values created
x = 0:pi/40:pi/2;
%Solve for an array of y values based on x
y = b.*exp(-a.*x).*sin(b.*x).*(0.012.*x.^4-0.15.*x.^3+0.075.*x.^2+2.5.*x);
%Solve for an array of z values based on y based on x
z = y.^2;
%Plot graph of z and y versus x
plot(x,y,x,z,'o'); grid on;set(gca,'GridLineStyle','-');xlabel('X'); ylabel('Y and Z'); title('Cunningham Problem #1');
legend('Y', 'X','Location', 'NorthEast');

%% Problem 2
% Using Manning equation  compute the velocity given a 4x4 matrix of values.
% The following symbols are noted with the terms they represent
% U = velocity(m/s), S = channel slope, n = roughness coefficient, B = width(m), and H = depth(m)
% n all rows, column 1; S all rows, column 2; B all rows, column 3; H all rows column 4
clear all; close all; clc;
 % Creates data matrix of all values
 param = [0.035 0.0001 10 2; 0.020 0.0002 8 1; 0.015 0.0010 20 1.5; 0.030 0.0007 24 3; 0.022 0.0003 15 2.5];
 % Assigns the corresponding column with its variable to streamline
 n = 1; s = 2; b = 3; h = 4;
 % Create row matrix of variables to allow for single line running.
 y = [1,2,3,4,5]; 
 % Single matlab line that creates a column vector of velocities.
 U = (sqrt(param(y,s))./param(y,n)).*(param(y,b).*param(y,h)./(param(y,b)+2.*param(y,h))).^0.667;
 
 fprintf('Velocities\n %f \n %f \n %f \n %f \n %f\n',U);

%% Problem 3
% Creates a plot displaying data and a function based on the data.
% Creates two arrays of already obtained data, one for the time(t) and one for the ppm(cdat)
clear all; close all; clc;
tdata = [10 20 30 40 50 60];
cdat = [3.4 2.6 1.6 1.3 1.0 0.5];
% Calculates the predicted ppm(ccalc)
tcalc = [0 10 20 30 40 50 60 70];
ccalc = 4.84 * exp(-0.034.*tcalc);
plot(tdata, cdat,'d', tcalc, ccalc,'--'); grid on; set(gca, 'GridLineStyle', '-');xlabel('Time(sec)'); ylabel('Parts Per Million(PPM)'); title('Chemical Reaction');
legend('PPM Recorded', 'PPM Calculated', 'Location', 'North');

%% Problem 4(Book 2.9)
% Computes the value of function 'A' based on 'i','n','P'
% Clears all windows, commands, and variables
clear all; close all; clc;
% Set the constants and given values
P = 55000; i = 0.066; narray = [1 2 3 4 5];
A(5) = 0;
fprintf('Year \t Annual Payment\n');
for n = 1:5
    A(n,1) = P*i*(1+i)^n/((1+i)^n-1);
    fprintf('%d \t\t %0.2f\n',n,A(n,1));
end

%% Problem 5(Book 2.18)
% Computes velocity of a rocket as a fuction of time using logical elimination of options in a piecewise function
% Clears all windows, commands, and variables
clear all; close all; clc;
% Creates the range of time(t)
tarray = -5:0.5:50;
t = -5;
n = 1;
v(111) = 0;
%Call up table header
fprintf('Time \t Rocket Velocity\n');
for i = 1:0.5:56
if t>30
    v(n) = 1520*exp(-0.2*(t-30));
    elseif t<=30 && t>=20
        v(n) = 50*t+2*(t-20)^2;
        elseif t<=20 && t>=10
            v(n) = 1100 - 5*t;
            elseif t<=10 && t>=0
                v(n) = 11*t^2 - 5*t;
                else
                    v(n) = 0;
end
fprintf('%0.1f \t %f\n',t, v(n));
t = t+0.5;
n = n+1;
end
%Create plot referenced from data and table.
plot(tarray, v); xlabel('Time(sec)'); ylabel('Rocket Velocity'); title('Rocket Velocity from Blast Off');

%% Problem 6(Book 2.22)
% Creates of a plot of displacement versus distance along a simply supported beam.
% Clears all windows, commands, and variables
clear all; close all; clc;
%Set starting variables and constants
x = 1;
y(11) = 0;

while x<=10
    if x<=0
        a0 = 0;
    else
        a0 = x^4;
    end
    if x<=5
        a5 =0;
    else
        a5 = (x-5)^4;
    end
    if x<=8
        a8 = 0;
    else
        a8 = (x-8)^3;
    end
    if x<=7
        a7 = 0;
    else
        a7 = (x-7)^2;
    end
    y(x+1) = -5/6*(a0-a5)+15/6*a8+75*a7+57/6*x^3-238.25*x;
    x= x+1;
end
xplot = 0:10;
plot(xplot,y); xlabel('Distance along beam (ft.)'); ylabel('Displacemnt (ft.)'); title('Displacement of Simply Supported Beam');