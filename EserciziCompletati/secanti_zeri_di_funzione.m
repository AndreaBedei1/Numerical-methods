function [x1,xk,it]=secanti(fname,xm1,x0,tolx,tolf,nmax)
    fxm1=fname(xm1);
    fx0=fname(x0); 
    d=fx0*(x0-xm1)/(fx0-fxm1);
    x1=x0-d;
    fx1=feval(fname,x1);
    it=1;
    xk(it)=x1;
    %fprintf('it=%d  x=%8.15f \n',it,x1);
    while  it<nmax && abs(fx1)>=tolf && abs(d)>=tolx*abs(x1)
        xm1=x0;
        x0=x1;
        fxm1=fname(xm1);
        fx0=fname(x0); 
        %Calcola la soluzione x1 con il metodo delle secanti
        d=fx0*(x0-xm1)/(fx0-fxm1);
        x1=x0-d;
        fx1=fname(x1);
        it=it+1;
        xk(it)=x1;
        %fprintf('it=%d  x=%8.15f \n',it,x1);
    end
    if it==nmax
       fprintf('raggiunto massimo numero di iterazioni \n');
    end
end

% syms x
% fx=exp(-x)-(x+1);
% f=matlabFunction(fx);
% alpha=0; 
% a=-1; 
% b=2; 
% x0=-0.5; 
% xm1=-0.3;
% tolx=1.e-12;
% tolf=1.e-12;
% nmax=1000;
% [xsecanti,xk_secanti,it_secanti]=secanti_zeri_di_funzione(f,xm1,x0,tolx,tolf,nmax)