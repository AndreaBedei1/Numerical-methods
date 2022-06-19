clc
clear all

syms a
A=[8 4 0 0; 4 4 a -1;0 a 1/2*(a + 2).^2 a+1; 0 -1 a+1 a+1];
B=[8 4 0 0; 4 4 0.5 -1; 0 0.5 1/2*(0.50 + 2).^2 0.5+1; 0 -1 0.5+1 2];

% Sì entrmabe le matrici ammettono fattorizzazione di choleski questo
% perchè ad esempio con 1, in tutte e 2 le matrici gli elementi sulla
% diagonale sono >= degli altri eleementi e la trsposta è ugauele alla
% matrice normale.

det(A(1:1, 1:1));
det(A(1:2, 1:2));
det(A(1:3, 1:3));
det(A(1:4, 1:4));

det(B(1:1, 1:1));
det(B(1:2, 1:2));
det(B(1:3, 1:3));
det(B(1:4, 1:4));
% Da come si può vedere dai determinanti dei minori principali la matrice A
% non è fattorizzabile con cholesky per nessun alfa. Invece per b si è
% scelto: 0.5 il quale soddisfa che tutti i determianti siano maggiori di 0
b=[4,-1,-2,-3]';
[x, flag] = cholesky(B,b);
[x, flag] = cholesky(inv(B),b);

% Sì è possibile farlo perchè i determiantni dei minori principali sono
% tutti maggiori strettamente di 0 come abbiamo controllato prima.

% Il lavoro dul determinente è stato svolto direttamente nella funzione
% choleski ed è stampato. E consiste in entrambi i casi di moltiplicare gli
% elementi di una duna diagonale della matricew L e poi elevare al quadrato
% il valore essendo essi gli stessi. Sia per L che per L'