%-- 4/18/13 11:10 AM --%
t=noisyX(:,1);
nx=noisyX(:,3);
plot(t,nx)
help polyfit
p=polyfit(t,nx,1);
help polyval
negtrend=polyval(-p,nx);
x=nx+negtrend;
figure(2), plot(t,nx,t,x)
% fdatool
b3=ones(1,11)/11;
y3=filter(b3,1,x);
figure(5), plot(t,x,t,y3)
figure(6)
freqz(b3,1,[],2000)
b4=ones(1,21)/21;
freqz(b4,1,[],2000)
y4=filter(b4,1,x);
figure(7), plot(t,x,t,y4)
b5=ones(1,201)/201;
y5=filter(b5,1,x);
figure(8), plot(t,x,t,y5)
freqz(b5,1,[],2000)
den=[1/(20*pi) 1];
bode(1,den)
50*2*pi
help c2d
H=tf(1,[1/(20*pi) 1])
Hd=c2d(H,0.0005,'Tustin')
bd=[0.01547 0.01547];
ad=[1 -0.9691];
y6=filter(bd,ad,x);
figure(9), plot(t,x,t,y6)
