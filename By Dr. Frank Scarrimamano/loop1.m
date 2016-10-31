%% Example 2
x =.5;
true = exp(.5);
est = 1;
Et = abs(est-true);
epst = (Et/true)*100;
estold = est;
n = 1;
fprintf('\n\t Est \t Et \t epst \t Ea \t epsa\n')
while Et>.001
    est = est + x^n/factorial(n);
    Et = abs(est-true);
    epst = (Et/true)*100;
    Ea = abs(est - estold);
    epsa = (Ea/est)*100;
    fprintf('\t%5.4f \t%5.4f \t%5.4f \t%5.4f \t%5.4f\n',est,Et,epst,Ea,epsa)
    estold = est;
    n= n+1;
end