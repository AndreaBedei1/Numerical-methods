clc
clear all


% La soluzione dell'equazione è proprio con  x=2, se sostituiamop troviamo
% lo zero della funzione.
syms x
fx=x-2*sqrt(x-1);
derivata=diff(fx,x,1); % Come si vede dalla derivata ha molteplicità 2
f=matlabFunction(fx);
df=matlabFunction(derivata);
figure
fplot(f,[1 3])
figure
fplot(df, [1 3])
x0=3;
tolx=1e-12;
tolf=tolx;
nmax=500;
[x1,xk,it]=newton_modificato(f,df,2,x0,tolx,tolf,nmax);
stima_ordine(xk, it)
figure
set(gca,'yscale','log');
err=abs([x0;xk;1]-1);
semilogy(1:it+2,err,'-')

% No se si parte parte da 1 il metodo non è convergente, questo perchè la
% derivata in 1 va -inf.
