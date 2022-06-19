clc
clear all

A=[0 0 1; 4 0 1; 0 4 1; 5 6 1];
b=[0;-16;-16;-61];
a = metodoQR(A,b)
% Le matrici Q ed R ed a vengono stampate dalla funzione sopra.
valore = norm(A*a-b)^2;
centro =[-a(1)/2 -a(2)/2];
raggio=sqrt(a(1)^2/4+a(2)^2/4-a(3));
figure
x=[0 4 0 5];
y=[0 0 4 6];
f=@(x1, y1)x1.^2+y1.^2+a(1)*x1+a(2)*y1+a(3);
intervallo=linspace(0, 5);
intervallo2=linspace(0, 6)
plot(x, y, 'go', intervallo, f(intervallo, intervallo2), 'b');