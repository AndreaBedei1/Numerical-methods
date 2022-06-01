%formula di Simpson composita su n sottointervalli
%definiti da nodi equispaziati.

function I=SimpComp(fname,a,b,n)
h=(b-a)/(2*n);
nodi=[a:h:b];
f=fname(nodi);
I=(f(1)+4*sum(f(2:2:2*n))+2*sum(f(3:2:2*n-1))+f(2*n+1))*h/3;

% syms x
% f=x.^10;
% funzione= matlabFunction(f);
% N=16; % Numero sottointervalli.
% I=SimpComp(funzione,0,1,N);
% Iesatto=double(int(f,x,0,1));
% errore=abs(Iesatto-I)/abs(Iesatto)