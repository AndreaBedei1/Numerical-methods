clc
clear all

a=-2;
b=2;
tol=10.^-6;
f0=@(x)x.^3+1;
f1=@(x)x.^3-2*x.^2+1;

[IN0,N0]=traptoll(f0,a,b,tol)
[IN1,N1]=traptoll(f1,a,b,tol)


[IN00,N00]=simptoll(f0,a,b,tol)
[IN01,N01]=simptoll(f1,a,b,tol)


fprintf('Prima funzione: Con trapezi valore : %d, Sottointervalli: %d \n',IN0,N0);
fprintf('Prima funzione: Con simpson valore : %d, Sottointervalli: %d \n',IN00,N00);
fprintf('Seconda funzione: Con trapezi valore : %d, Sottointervalli: %d \n',IN1,N1);
fprintf('Seconda funzione: Con simpson valore : %d, Sottointervalli: %d \n',IN01,N01);

figure 
hold on
fplot(f0,[-2 2]);
fplot(f1,[-2 2]);


% Con il metodo dei trapezi nella seconda funzione il numero di intervalli
% esplode perchè il metodo porta a un valore senza errore, se la funzione
% ha derivata 2 nulla, ed in questo caso non è così, invece simpson non ha
% problemi visto che l'errorre è 
