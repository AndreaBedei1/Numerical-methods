function a = metodoQR(A,y)
% input A = matrice m × n, m > n
% input b = vettore termine noto di m
% output a = vettore soluzione nel senso dei minimi quadrati del sistema lineare
% sovraderterminato Ax=b, ottenuto mediante  il metodo QRLS
 
n=size(A,2);
%Calcola la fattorizzazione QR di A e risolvi il sistema lineare con
%matrice triangolare superiore R(1:n,1:n) e termine noto h=Q'*y;
[Q,R]=qr(A);
h=Q'*y;
a=Usolve(R(1:n,1:n),h(1:n));


% % Più precisa e corretta con x molto vicine tra loro.
% x=[-3.5 -3 -2 -1.5 -0.5 0.5 1.7 2.5 3]';
% y=[-3.9 -4.8 -3.3 -2.5 0.3 1.8 4 6.9 7.1]';
% xv=linspace(min(x), max(x), 100);
% figure 
% hold on
% plot(x,y,'ro');
% gradoPolinomio=input('Inserire grado: ');
% A=costruisci_vander(x, gradoPolinomio+1);
% a1 = metodoQR(A,y);
% if flag ~= 0
%     disp('Matrice non definita positiva')
% end
% polinomioQR=pvalHorner(a1,xv);
% plot(xv, polinomioQR, 'g-');
% residuo=norm(y-pvalHorner(a1, x))^2