%Controlla stima ordine se <2 usare newton modificato.
function [x1,xk,it]=newton(fname,fpname,x0,tolx,tolf,nmax)
fx0=fname(x0);
dfx0=fpname(x0);
if abs(dfx0)>eps
    d=fx0/dfx0;
    x1=x0-d;
    fx1=fname(x1);
    it=1;
    xk(it)=x1;
else
    fprintf('Derivata nulla in x0 - EXIT \n')
    disp(dfx0)
    x1=[];
    xk=[];
    it=[];
    return
end

while it<nmax && abs(fx1)>=tolf && abs(d)>=tolx*abs(x1)
    x0=x1;
    fx0=fname(x0);
    dfx0=fpname(x0);
    if abs(dfx0)>eps
        d=fx0/dfx0;
        x1=x0-d;
        fx1=feval(fname,x1);
        it=it+1;
        xk(it,:)=x1;
    else
        fprintf('Derivata nulla in xi - EXIT \n')
        disp(dfx0)
        break
    end
end
if it==nmax
    fprintf('raggiunto massimo numero di iterazioni \n');
end

% syms x
% fx=x^3+x^2-33*x+63;
% derivata=diff(fx,x,1);
% f=matlabFunction(fx);
% df=matlabFunction(derivata);
% figure
% fplot(f)
% % Ci sono più soluzioni quella che trova dipende da x0.
% x0=1;
% tolx=1e-12;
% tolf=tolx;
% nmax=500;
% [x,xk,it]=newton_zeri_funzioni(f,df,x0,tolx,tolf, nmax)
