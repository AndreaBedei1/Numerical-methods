clc
clear all

A=[10 -4 4 0;-4 10 0 2;4 0 10 2;0 2 2 0];
B=[5 -2 2 0;-2 5 0 1;2 0 5 1;0 1 1 5];

% La fattorizzazione di choleseky è applicavile solo nella seconda matrice,
% perchè essa è simmetrica e definita positiviva come si può
% vedere.

% Per vedere se 2 matrici ammettono fattorizzazione LU senza pivoting,
% bisong vedere se i determinanti dei minori principali sono diversi da
% zero.

for i=1:size(A)
    if det(A(1:i,1:i))==0
        disp('Un determinante = 0 matrice A')
        break;
    end
end

for i=1:size(B)
    if det(B(1:i,1:i))==0
        disp('Determinante = 0 matrice B')
        break;
    end
end
% Restituisce anche il flag per un ulteriore controllo che il metodo sia
% applicabile
[L,U,flag]=LU_nopivot(A);
if flag ~=0
    error('Errore mattrice');
end

detA=prod(diag(L))*prod(diag(U))

[L,U,flag]=LU_nopivot(inv(A));
if flag ~=0
    error('Errore mattrice');
end
detA=prod(diag(L))*prod(diag(U))

[L,U,flag]=LU_nopivot(B);
if flag ~=0
    error('Errore mattrice');
end

detB=prod(diag(L))*prod(diag(U))

[L,U,flag]=LU_nopivot(inv(B));
if flag ~=0
    error('Errore mattrice');
end
detB=prod(diag(L))*prod(diag(U))