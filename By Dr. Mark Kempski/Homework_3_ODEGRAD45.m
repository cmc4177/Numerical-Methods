function [t,data] = Homework_3_ODEGRAD45()
%Clair Cunningham     Homework #3     Numerical Methods
%Uses built-in Matlab ODE45 function to solve
%Clear previous runs
clear all; clc;
%base equation: a = -2*damp*nfreq*v - nfreq^2*x + nfreq^2*f(t);
%where f(t) = A+B*sin(freq*t)
%set up initial conditions
	x0 = 0; 
	v0 = 0;
%Create Time and Data vectors for use in ode45
	wICvector = [x0,v0];
	tspan = [0 3];
%solve the ode problem fetching data from another equation
	[t,data] = ode45(@wdoteqns, tspan, wICvector);
%Define data vectors
	x = data(:,1);
%plot data
	figure(1)
	plot(t,x);
	legend ('Euler x', 'Exact x', 'ODE45 x');
end

function[wdotvector] = wdoteqns(t,w)
	%set up constants
	%seconds interval
	A = 20;
	B = 3.4;
	freq = 38;
	damp = 0.12;
	nfreq = 25;
	%define equations
	f = A+B*sin(freq*t);
    wdot1 = w(2);
	wdot2 = nfreq^2*f - 2*damp*nfreq*w(2) - nfreq^2*w(1) ; % acceleration
	wdotvector = [wdot1;wdot2];
end

