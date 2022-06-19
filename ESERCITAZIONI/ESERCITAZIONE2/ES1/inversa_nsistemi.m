function X=inversa_nsistemi(A,B)
% Funzione per risolvere l'equazione matriciale AX=B
n=size(B,1);
X=zeros(size(A));
Y=zeros(size(A));
[L,U,flag]=LU_nopivot(A);
P=eye(size(A, 1));

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