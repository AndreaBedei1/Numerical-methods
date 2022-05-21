clc
clear all

f=@(x)[2*x(1)-cos(x(2)); sin(x(1))+2*x(2)]; % funzione.
jac=@(x)[2  sin(x(2)); cos(x(1)) 2]; % Jacobiano calcolo delle derivate parziali.
xm=[-4:0.5:4];
ym=[-4:0.5:4];
[X,Y]=meshgrid(xm,ym);
Z=2*X-cos(Y);
Z1=sin(X)+2*Y;
figure
mesh(X,Y,Z);
hold on
contour(X,Y,Z,[0 0],'r-');
figure
mesh(X,Y,Z1);
hold on
contour(X,Y,Z1,[0 0],'b-');
figure
contour(X,Y,Z,[0 0],'y-');
hold on
contour(X,Y,Z1,[0 0],'g-'); % Dal grafico si vede che le 2 funzioni si incontrano in
x0=[-2;2]; %Intervallo scelto dal grafico vicino al punto di incontro.
tolx=1e-10;
tolf=tolx;
nmax=200;
% Ricavo la soluzione e la grafico.
[x1,Xm,it]= my_ShamanskiiSys(f,jac,x0,tolx,tolf,nmax);
plot3(x1(1), x1(2), f([x1(1),x1(2)]), 'ro');
% Grafico l'errore.
figure
semilogy(1:it,Xm,'r-');