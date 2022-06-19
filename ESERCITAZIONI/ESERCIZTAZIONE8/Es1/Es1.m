clc
clear all

% Più precisa e corretta con x molto vicine tra loro.
x=[1900:10:2010]';
y=[76 92 106 123 132 151 179 203 226 249 281 305]';
xv=linspace(min(x), max(x), 100);
figure 
hold on
plot(x,y,'ro');
for grado=1:3;
    A=costruisci_vander(x, grado+1);
    a1 = metodoQR(A,y);
    polinomioQR=pvalHorner(a1,xv);
    plot(xv, polinomioQR);
    residuo(grado)=norm(y-pvalHorner(a1, x))^2;
end
[min,i]=min(residuo);
fprintf('Il grado migliore è: %d', i);