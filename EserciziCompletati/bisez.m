function [x,xk,it]=bisez(fname,a,b,tol)
% x soluzione
% xk vettore di soluzioni, con avanzare di k avremo numeri più vicini alla
% soluzione

fa=fname(a);
fb=fname(b);
if  sign(fa)*sign(fb)>=0
   error('intervallo non corretto');
else
    maxit= ceil(log2((b-a)/tol)-1);
    fprintf('n. di passi necessari=%d \n',maxit);
    it=0;
    while it<=maxit && abs(b-a)>=tol
        it=it+1;
        %calcola xk(it) con la formula corrispondente
        xk(it)=a+(b-a)/2;
        fxk=fname(xk(it));
        if fxk==0
            break;
        elseif sign(fxk)*sign(fa)>0
            a=xk(it);
        elseif sign(fxk)*sign(fb)>0
            b=xk(it);
        end
    end
    x=xk(it);
end

% fname=@(x) exp(-x)-(x+1);
% a=-1;
% b=2;
% tol=1e-12;
% [x,xk,it]=bisez(fname,a,b,tol)