function X=inversa_nsistemi(A,B)
% Funzione per risolvere l'equazione matriciale AX=B
n=size(B,1);
X=zeros(size(A));
Y=zeros(size(A));
[L,U,P,flag]=LU_parziale(A);

% Metodo calcolo inversa di una matrice.
if flag==0
      for i=1:n
        Y(:,i)=Lsolve(L,P*B(:,i));  
        X(:,i)=Usolve(U,Y(:,i));     
      end
else
    disp('Errore');
    X=[];
    return
end

% A=[3 5 7;2 3 4; 5 9 11];
% B=eye(size(A,1)); % Solo se B è l'identità X è l'inversa.
% X=inversa_nsistemi(A,B)