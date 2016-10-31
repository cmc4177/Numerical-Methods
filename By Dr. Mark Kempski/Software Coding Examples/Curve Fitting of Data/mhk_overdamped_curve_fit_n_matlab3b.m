% System Dynamics curve-fit algorithm using 'fminsearch' in MATLAB
% Mark H. Kempski, PhD.     Last modified: March 11, 2011 early PM
%
% THIS VERSION (3B) CAN BE RUN FROM MATLAB M-FILE EDITOR AS-IS
%
% Actual data must exist in the workspace as a 2-D array 'y' 
%   where the 2-D array is predisposed to 
%       y(:,1)= time vector and 
%       y(;,2)=data vector to be fit
% 
% The fit uses the initial guess vector 'x0', where 
%       x0(1)=A, x0(2)=B, etc.
%   represent parameters in the output_estimate_eqn: 
%       y_est=A*exp(B*(t-t0))+C*exp(D*(t-t0))+E
% 
%Copy & paste the following line to run in workspace:
%   [xfinal,fval,y_est]=mhk_overdamped_curve_fit_n_matlab3a(x0,y);
%
%For easy plotting cut & paste:
%   plot(y(:,1),y(:,2),'o',y(:,1),y_est,'--','LineWidth',2)
%
function [xfinal,fval,y_est_vector]=...
    mhk_overdamped_curve_fit_n_matlab3b(x0,y)
clc
global y  x0
t=y(:,1);
data=y(:,2);
options = optimset('Display','final','TolFun',1e-8);
[x,fval,exitflag,output]=fminsearch(@mhk_eqn_estimate,x0,options);
xfinal=x;
A=x(1);
B=x(2);
C=x(3);
D=x(4);
E=x(5);
y_est=A*exp(B.*(t-t(1)))+C*exp(D.*(t-t(1)))+E;
plot(y(:,1),y(:,2),'o',y(:,1),y_est,'--','LineWidth',2)
return

function f=mhk_eqn_estimate(x)
% NOTE: here the vector 'x' contains the parameters to be optimized
% where for example: x(1)=A, x(2)=B, in the eqn y=A*exp(B*t)+C*exp(D*t)+E
global y  x0
t=y(:,1);
data=y(:,2);
A=x(1);
B=x(2);
C=x(3);
D=x(4);
E=x(5);
y_est_vector=A*exp(B.*(t-t(1)))+C*exp(D.*(t-t(1)))+E;
sq_variance_vector=(data-y_est_vector).^2;
f=sum(sq_variance_vector);
return