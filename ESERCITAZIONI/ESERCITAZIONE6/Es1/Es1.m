clc
clear all

fname=@(x) exp(x+1)+(3*x);
a=-1;
b=2;
tol=1e-12;
nmax=500;
figure
fplot(fname, [-1 2]);
x=0;
m=[2.5 3 3.5 4];
for i=1:length(m)
    [x1,xk,it]=corde(fname,m(i),x,tol,tol,nmax);
    figure
    semilogy(1:it, abs(xk) );
    ordine(i)= stima_ordine(xk, it);
end
ordine;
x=[0 0.5 1];
m=5;
for i=1:length(x)
    [x1,xk,it]=corde(fname,m,x(i),tol,tol,nmax);
    figure
    semilogy(1:it, abs(xk) );
    ordine(i)= stima_ordine(xk, it);
end
ordine;
syms x
f=exp(x+1)+(3*x);
fd=diff(f,x,1);
fdx=matlabFunction(fd);
x=[-1 -.5 0 0.5 1];
for i=1:length(x)
    m=fdx(x(i));
    [x1,xk,it]=corde(fname,m,x(i),tol,tol,nmax);
    figure
    semilogy(1:it, abs(xk));
    ordine(i)= stima_ordine(xk, it);
end
ordine;