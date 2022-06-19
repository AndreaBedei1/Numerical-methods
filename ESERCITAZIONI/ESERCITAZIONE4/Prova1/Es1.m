clc
clear all

f=@(x)sin(x)+sin(5*x);
x1=[0:pi/3:2*pi];
y1=f(x1);
x2=[pi/6 2*pi/5, 4*pi/5 8*pi/5 11*pi/6];
y2=f(x2);

xv1=linspace(0,2*pi);
yy1 = InterpL(x1, y1, xv1);

xv2=linspace(0,2*pi);
yy2 = InterpL(x2, y2, xv2);

figure 
hold on
fplot(f, [0, 2*pi]);
plot(x1,y1,'*');
plot(x2,y2,'r*');
plot(xv1, yy1);
plot(xv2, yy2);
legend('Funzione', 'punti1', 'punti2', 'Approssimazione1', 'Approssimazione2')
% COme si vede dal grafico quella che approssima meglio la funzione è
% quella del punto a.2.
a1=coeff_InterpN(x1,y1);
a2=coeff_InterpN(x2,y2);
p1=DaPolinomioAFunzione(x1,a1);
p2=DaPolinomioAFunzione(x2,a2);
N1=2;
N2=256;
I1=TrapComp(p1,0,2*pi,N1);
I2=TrapComp(p2,0,2*pi,N2);
tol=10^-4;
[IN1,N1]=traptoll(p1,0,2*pi,tol)
[IN2,N2]=traptoll(p2,0,2*pi,tol)
risVero=double(integral(f,0,2*pi));
err1=abs(IN1-risVero)/abs(risVero)
err2=abs(IN2-risVero)/abs(risVero)

%Da come si può vedere dagli errori, l'approssimazione n1 è la migliore,
%questo perchè laq seconda è una funzione pseudo sinosoidale, la quele
%non permette buoni approssimazioni con la tecnica dei trapezi, la prima,
%che assomiglia a una retta e la quale richiede anche un numero estremamate
%basso di iterazioni, questo perchè non è sinuisoidale ma tende ad essere
%una retta
