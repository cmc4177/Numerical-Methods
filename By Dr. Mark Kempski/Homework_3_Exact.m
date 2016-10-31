%Clair Cunningham   Homework #3 Numerical Methods
%Uses the exact equation solution given
%Clear Command Window and variables
clear all; clc;
%create known constants
A = 20;
B = 3.4;
damp = 0.12;
freq = 38;
nfreq = 25;
%solve for constants assuming variables are constant;
delta = ((2*damp*freq/nfreq)^2+(1-(freq/nfreq)^2)^2)^(1/2);
freqnd = nfreq*sqrt(1-damp^2);
phi = atan2((2*damp*freq/nfreq),(1-(freq/nfreq)^2));
lambda = atan2((-freqnd*(A+delta*B*sin(-phi))),(-damp*nfreq*A-damp*nfreq*delta*B*sin(-phi)-delta*B*freq*cos(-phi)));
c = asin(-A-delta*B*sin(-phi))/lambda;
t = 0:.01:3;
%solve for positions
for i=1:301
    x(i) = c*exp(-damp*nfreq*t(i))*sin(freqnd*t(i)+lambda)+A+delta*B*sin(freq*t(i)-phi);
end
figure(1)
plot(t,x)
legend('Euler x','Exact x');
ylabel('Y'); xlabel('X');

