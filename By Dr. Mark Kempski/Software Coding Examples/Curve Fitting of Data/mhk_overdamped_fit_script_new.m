%-- 11/29/12  4:14 PM --%
y_bkup=load('overdamped_data.dat');
plot(y_bkup(:,1),y_bkup(:,2:3))
ysub=0;
ysub=y_bkup(409:579,:,:);
y=[ysub(:,1),-ysub(:,3)];
figure(2)
plot(y(:,1),y(:,2))
global y
% WAG initial guesses & poor resulting fit
x0=[0 0 0 0 1];
[xfinal,fval,y_est]=mhk_overdamped_curve_fit_n_matlab3a(x0,y);
figure(3)
plot(y(:,1),y(:,2),'o',y(:,1),y_est,'--','LineWidth',2)
% SWAG initial guesses & better resulting curve fit
x0adjusted=[1,-1000,1,-6667,0];
[xfinal,fval,y_est]=mhk_overdamped_curve_fit_n_matlab3a(x0adjusted,y);
figure(4)
plot(y(:,1),y(:,2),'o',y(:,1),y_est,'--m','LineWidth',4)
% save('ysubset3col_new.dat','ysub','-ascii','-tabs');
% save('ysubset2fit_new.dat','y','-ascii','-tabs');