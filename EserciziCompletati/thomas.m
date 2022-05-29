function x=thomas(a,b,c,d)
%Risolvere un sistema con matrice tridiagonale mediante il metodo di Thomas
%che lavora sui vettore a, b e c.
%Input: a vettore contenente i valori della diagonale princiaple lungo n
% b: vettore lungo n con b(1)=0
% c :vettore contenenete i valori della codiagonale superiore
%D: vettore contenenete il termine noto del sistema con matrice
%tridiagonale da risolvere
n=length(a);
beta=zeros(n,1);
alpha=zeros(n,1);
alpha(1)=a(1);
for i=2:n
    %Calcolare beta ed alfa
    beta(i)=b(i)/alpha(i-1);
    alpha(i)=a(i)-beta(i)*c(i-1);
end

%Soluzione sistema bidiagonale inferiore con termine noto d
y(1)=d(1);
for i=2:n
    y(i)=d(i)-beta(i)*y(i-1);
end

%soluzione del sistema bidiagonale superiore con termine noto uguale alla soluzione
%y %del sistema bidiagonale inferiore
x(n)=y(n)/alpha(n);
for i=n-1:-1:1
    x(i)=(y(i)-c(i)*x(i+1))/alpha(i);
end

% n=5;
% % a, b, c sono le 3 diagonali
% a=ones(1, n)*2;
% b=[0, -ones(1,n-1)];
% c=[-ones(1,n-1)];
% d=[1, zeros(1, n-2),1]; % termine noto
% x=thomas(a,b,c,d)