function yy = InterpL(x, f, xx)
%
%funzione che determina in un insieme di punti il valore del polinomio
%interpolante ottenuto dalla formula di Lagrange.
% DATI INPUT
%  x  vettore con i nodi dell'interpolazione
%  f  vettore con i valori dei nodi
%  xx vettore con i punti in cui si vuole calcolare il polinomio
% DATI OUTPUT
%  y vettore contenente i valori assunti dal polinomio interpolante
%

n=length(x);
m=length(xx);
yy=zeros(1,m);
for k=1:n
    %calcola i coefficienti del k-esimo polinomio di Lagrange e denota con
    %Lk la sua valutazione nei punti xx
    p=plagr(x,k);
    Lk=polyval(p,xx);
    yy=yy+f(k)*Lk;
end

% n=5;
% f=@(x)1./(1+x.^2);
% x=linspace(-5,5,n+1);
% y=f(x);
% xv=linspace(-5,5);
% yy = InterpL(x, y, xv);
% figure
% plot(xv, yy, xv, f(xv), 'g');
% % Se si aggiunge un nodo si ricalcola tutto