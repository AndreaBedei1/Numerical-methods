syms x
fx=exp(-x)-(x+1);
f=matlabFunction(fx);
alpha=0; 
a=-1; 
b=2; 
x0=-0.5; 
xm1=-0.3;
tolx=1.e-12;
tolf=1.e-12;
nmax=1000;
[xsecanti,xk_secanti,it_secanti]=secanti_zeri_di_funzione(f,xm1,x0,tolx,tolf,nmax)

 