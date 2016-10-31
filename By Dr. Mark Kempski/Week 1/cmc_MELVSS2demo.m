function [t,y] = mhk_MELVSS2demo(t0,x0)
[t,y] = ode45('vdp1',[0 20],[1; 0]); 
% [t,y] = ode45('vdp1',t0,x0); 
figure(1), plot(t,y(:,1),'-',t,y(:,2),'-.')
figure(2), plot(y(:,1), y(:,2))
return;


function out1 = vdp1(t,y)
out1 = [y(2); 2*(1-y(1)^2)*y(2) - y(1)]; 
return;