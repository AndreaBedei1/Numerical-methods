clc
clear all

p=10.^5;
syms q
x=-p+sqrt(p.^2+q);
xd=diff(x,q,1);
f=matlabFunction(x);
fd=matlabFunction(xd);

f2=@(x) x/(p+sqrt(p.^2+x));

for i=1:11
    q=10.^-(i-1);
    k(i)=abs(fd(q))*abs(q)/abs(f(q));
    x(i)=f(q);
    x2(i)=f2(q);
end
table(k', x', x2')

% Il problema risulta essere malcondizionato per gli ultimi 5 valori, come
% è visibile dalla tabella, questo perchè avviene la callenciazione
% numerica. Quando q è piccolo la somma p^2 + q è uguale a p^2 e quindi
% x=0.



