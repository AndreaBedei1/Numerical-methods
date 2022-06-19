clc
clear all


Z=@(a)[11+a 10+a 14+a; 12+a 11+a -13+a; 14+a 13+a -66+a];
ZI=@(a)[-55*a-557 83*a+842 -28*a-284; 55*a+610 -83*a-922 28*a+311; 2 -3 1];


%La norma infinito di una matrice è il massimo della somma dei valori
%assoluti delle righe.
k=1;
for a=linspace(30,1000, 100000);
    nZ(k)=max(sum(abs(Z(a)),2));
    nZI(k)=max(sum(abs(ZI(a)),2));
    k=k+1;
end

K=nZ.*nZI;

A=Z(30);
b=[3*30+35 3*30+10 3*30-39]';
xe=[1 1 1]';

k=0;
for d=[10.^-3 10.^-4 10.^-5 10.^-6]
    k=k+1;
    dA=[d 0 0; 0 0 0; 0 0 0];
    A=dA+A;
    n=length(b);
    [L,U,P,flag]=LU_parziale(A);
    if flag==0
        [x,flag]=LUsolve(L,U,P,b);
        if flag~=0
            error('Errore');
        end
    end
    err(k)=norm(x-xe,"inf")/norm(xe,"inf");
end
figure
plot([10.^-3 10.^-4 10.^-5 10.^-6], err)
%Più l'errore cresce più l'errore sui dati è alto più sul risultato aumenta
%l'errre.

