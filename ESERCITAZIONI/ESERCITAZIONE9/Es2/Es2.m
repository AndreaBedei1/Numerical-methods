clc
clear all

A=@(x)[1 -1 2; -1 6 1; 2 1 x];

% la norma infinito è il massimo della somma degli elementi in valori assoluto fra le rige
k=1;
for a=linspace(6,10,100)
    M=A(a);
    nor(k)=max(sum(abs(M),2)); % Sommo elementi nella riga
    k=k+1;
end
sez=linspace(6,10,100);
[mn, i]=min(nor);
disp('Risulta minimo per: ')
sez(i)

k=1;
for a=linspace(6,10,100)
    M=A(a);
    nor(k)=max(sum(abs(M))); % Sommo elementi nella riga
    k=k+1;
end
sez=linspace(6,10,100);
[mn, i]=min(nor);
disp('Risulta minimo per: ')
sez(i)

% Sì i 2 sono uguali perchè la matrice è simmetrica cioè se faccio la sua
% trasposta, inverto righe e colonne si ha la stessa matrice
M=A(sez(i));
det(M(1:1,1:1))
det(M(1:2,1:2))
det(M(1:3,1:3))

% Si lo ammette visto che tutti i determinanti sono maggiori di zero.

