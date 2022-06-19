clc
clear all

f=@(x)sin(x)+sin(6*x);
x=[0:2/7*pi:2*pi]';
x2=[pi/7, pi/3, 2*pi/3 4*pi/3 5*pi/3 13*pi/7]';
y=f(x);
y2=f(x2);


xv=linspace(-pi/2, 5*pi/2, 100);
figure(1)
hold on
plot(x,y,'ro');
grado=3
A=costruisci_vander(x, grado+1);
a1 = metodoQR(A,y);
polinomioQR=pvalHorner(a1,xv);
plot(x,y,'*b');
plot(x2,y2,'*g');
plot(xv, polinomioQR, 'g-');
fplot(f,[-pi/2 5*pi/2]);
A=costruisci_vander(x2, grado+1);
a1 = metodoQR(A,y2);
polinomioQR=pvalHorner(a1,xv);
plot(xv, polinomioQR, 'b-');



n=3;
xv=linspace(-pi/2, 5*pi/2, 100);
yy = InterpL(x', y', xv);
figure(2)
hold on
fplot(f,[-pi/2 5*pi/2]);
plot(xv, yy, xv, f(xv), 'g');
yy = InterpL(x2', y2', xv);
plot(xv, yy, xv, f(xv), 'b');
plot(x2,y2,'*b');
plot(x,y,'*g');
