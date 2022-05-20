function [x1,xk,it]=corde(fname,m,x0,tolx,tolf,nmax)
fx0=fname(x0);
%calcola soluzione x1
d=fx0/m;
x1=x0-d;
fx1=fname(x1);
it=1;
xk(it)=x1;
%fprintf('it=%d  x=%8.15f \n',it,x1);
while it<nmax && abs(fx1)>=tolf && abs(d)>=tolx*abs(x1)
% Calcola soluzione x1
   x0=x1;
   fx0=fname(x0);
   d=fx0/m;
   x1=x0-d;
   fx1=fname(x1);
   it=it+1;
   xk(it,:)=x1; 
   %fprintf('it=%d  x=%8.15f \n',it,x1);
end
if it==nmax 
    fprintf('raggiunto massimo numero di iterazioni \n');
end
 
% fname=@(x) exp(-x)-(x+1);
% a=-1;
% b=2;
% m=(fname(b)-fname(a))/(b-a); % Bisogna calcolare m
% x0=-0.5;
% tol=1e-12;
% [x,xk,it]=corde_equazioni_(fname,m,x0,tol,tol, 1000);