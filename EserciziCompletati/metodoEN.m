function [a,condG,flag]=metodoEN(A,b)
% input A = matrice m × n, m > n
% input b = vettore termine noto di m
% output a = vettore soluzione nel senso dei minimi quadrati del sistema lineare
% sovraderterminato Ax=b, ottenuto mediante  il metodo delle Equazioni
% Normali

% Risolvi il sistema delle equazioni normali A'*A a = A'b
 
%Costruzione matrice e termine noto
G=A'*A;
condG=cond(G);
z=A'*b;
%fattorizzazione di Choleski
[L,flag]=chol(G,"lower");

%Soluzione del sistema triangolare inferiore
if flag>0
   disp('G non definita positiva')
   a=G\z;
   return
else
   b1=Lsolve(L,z);
   %Soluzione del sistema triangolare inferiore
   a=Usolve(L',b1);
end

%%Metodo instabile con x molto vicine tra loro.
% x=[-3.5 -3 -2 -1.5 -0.5 0.5 1.7 2.5 3]';
% y=[-3.9 -4.8 -3.3 -2.5 0.3 1.8 4 6.9 7.1]';
% xv=linspace(min(x), max(x), 100);
% figure 
% hold on
% plot(x,y,'ro');
% gradoPolinomio=input('Inserire grado: ');
% A=costruisci_vander(x, gradoPolinomio+1);
% [a,condG,flag]=metodoEN(A,y);
% if flag ~= 0
%     disp('Matrice non definita positiva')
% end
% polinomioEN=pvalHorner(a,xv);
% plot(xv, polinomioEN, 'g-');
% residuo=norm(y-pvalHorner(a, x))^2