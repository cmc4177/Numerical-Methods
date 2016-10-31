function Problem_2(x,a,ed,maxit)
iter = 1;
xold = -1;
ea = 100;
while  xold ~= x        
    xold = x;
    x = (x+a/x)/2;
    if x ~= 0
        ea = abs((x-xold)/x)*100;        
        if ea <= ed || iter >= maxit
           fprintf('X = %f EA =%f Iterations =%f \n',x,ea,iter);    
           break;
        end       
    end
    iter = iter+1;   
end
end

