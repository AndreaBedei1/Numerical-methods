clc
clear all
a=0;
b=pi;
tol=1.e-3;
for v=[1 3 5]
    bess=besselj(v, [1 13/6 10/3 9/2 17/3 41/6 8]);
    k=1;
    for x=[1 13/6 10/3 9/2 17/3 41/6 8]
        syms t
        f=cos(x*sin(t)-v*t);
        funzione= matlabFunction(f);
        [IN,N]=traptoll(funzione,a,b,tol);
        fv(k)=1/pi*IN;
        err(k)=abs(fv(k)-bess(k))/abs(bess(k));
        k=k+1;
    end
    x1=[1 13/6 10/3 9/2 17/3 41/6 8];
    y=fv;
    xv=linspace(x1(1), x1(end));
    yy = InterpL(x1, y, xv);
    figure
    plot(xv, yy, x1, bess, 'g');
end