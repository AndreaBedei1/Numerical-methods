%formula dei trapezi composita su n sottointervalli 
%definiti da nodi equispaziati

function I=TrapComp(fname,a,b,n)
h=(b-a)/ n;
nodi=[a:h:b];
f=fname(nodi);
I=(f(1)+2*sum(f(2:n))+f(n+1))*h/2;

% syms x
% f=x.^10;
% funzione= matlabFunction(f);
% N=16; % Numero sottointervalli.
% I=TrapComp(funzione,0,1,N);
% Iesatto=double(int(f,x,0,1));
% errore=abs(Iesatto-I)/abs(Iesatto)