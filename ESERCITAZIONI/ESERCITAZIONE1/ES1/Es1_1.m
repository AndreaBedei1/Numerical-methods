clc
clear all

k=0:5;
x=0.5+2*k;
tol=1e-8;
syms t
fun=5.5*(1-exp(-0.05*t))*sin(t.^2);
f=matlabFunction(fun);
figure
fplot(f, [-5 5])

for i=1:6
    [IN,N]=simptoll(f,0,x(i),tol);
    y(i)=2/pi*IN;
    fprintf('Sono stati necessari al passo i=%d: %d\n', i, N);
end

xv=linspace(x(1),x(end));
yy = InterpL(x, y, xv);
figure
plot(x, y , 'b*', xv, yy);

% Si necessitano più sottointervalli, di quelli consentiti, questo perchè
% la funzione è sinusoidale e nelle ultime 2 iterazioni si vede che le
% oscillazioni aumentano notevolmente quindi non è possibile calcolare
% l'integrale in modo preciso.