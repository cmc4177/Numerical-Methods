%Clair Cunningham     Numerical Methods     3/7/2013    Final Exam

%% The driven van der Pol Oscillator Problem 1
% Evaluates the van der Pol Oscillator equation using the Forward Euler Approach

% Reset variables, close windows, and clear command window.
clear all; close all; clc;

% Initialize Constants and Variables
i = 1;
t = (0:.03:30);
dt = t(2)-t(1);
x(i) = -3; %Starting Position
v(i) = 0; %Starting Velocity
a(i) = 0; %Initliaze Acceleration variable

%Set f(t) all equation values for the limited time.
f_t = -20.*exp(-t./5).*sin(5.*t);

%Run a "for loop" with 1000 intervals since last interval will be done afterwards
for i = 1:1000
 a(i) = -(x(i)^2-1)*v(i)-x(i)+f_t(i);
 v(i+1) = v(i)+a(i)*dt;
 x(i+1) = x(i)+v(i+1)*dt;
end  

%Add the last value of the acceleration to the array
a(i+1) = -(x(i)^2-1)*v(i)-x(i)+f_t(i);
%Graph the representation of the data.
figure(1);
plot(t,x,t,v)
grid on;
title('Driven van der Pol Oscillator Velocity and Displacement');
xlabel('time (sec)');
ylabel('displacement (ft)');
legend('Displacement','Velocity');

% jerk calculation analytically Problem 1 Part B Bullet 1
 % reset the counter
f1a_t = 4.*exp(-t./5).*sin(5)-100.*exp(-t./5).*cos(5.*t);
for i = 1:1001
    ja(i) = -(x(i)^2-1)*a(i)-v(i)+f1a_t(i);
end
    
% jerk calculation using centered differencing numerical approximations Problem 1 Part B Bullet 2
i = 1;
jb(i) = a(i+1) - a(i);
for i = 2:1000
    jb(i) = (a(i+1) - a(i-1))/(2*dt);
end
i = i+1;
jb(i) = (a(i)-a(i-1))/(2*dt);

% Problem 1 Part B Bullet 3
figure(2);
plot(t,a,t,ja,t,jb);
grid on;
title('Driven van der Pol Oscillator Acceleration and Jerk');
xlabel('time (sec)');
ylabel('Acceleration (ft/sec^2) ; Jerk (ft/sec^3)');
legend('Acceleration','Analytical Jerk','Numerical Jerk');

%% Diamond Rings Ring Problem 2
% Reset variables, close windows, and clear command window.
clear all; close all; clc;
