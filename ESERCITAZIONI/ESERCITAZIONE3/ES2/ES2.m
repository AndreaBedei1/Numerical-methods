clc
clear all

n=3; % Grado polinomio.
a=1;
b=3;
xv=linspace(a,b,200); % Punti in cui valutare il polinomio.
f=@(x)x-sqrt(x-1);
xEqui=linspace(a,b,n+1); %Così sono equispaziati.
yEqui=f(xEqui);
[yv,a]= InterpN(xEqui,yEqui,xv);
figure
hold on
plot(xEqui, yEqui, 'r*', xv, yv );
fplot(f, [1,3]);



p=DaPolinomioAFunzione(xEqui, a);

figure
fplot(p,[1,3]);
N=16; % Numero sottointervalli.
I1=SimpComp(f,1,3,N);
I2=SimpComp(p,1,3,N);

tol=10.^-5;
[IN1,N1]=simptoll(f,1,3,tol);
[IN2,N2]=simptoll(p,1,3,tol);

fprintf('Nel primo caso, con f: N=%d, nel secondo caso, con p: N=%d \n',N1, N2)
I1=abs(2.114381916835873-IN1);
I2=abs(2.168048769926493-IN2);
fprintf('Nel primo caso, con f: errore I1=%d, nel secondo caso, con p: errore I2=%d \n',I1, I2)

%Nell'integrale I2, la funzione integranda e' un polinomio cubico e sappiamo
%che la formula di Simpson e' esatta per funzioni integrande che sono
%polinomi fino a quelli di grado 3, che hanno derivata 4 nulla (riocordiamo
%che l'errore nella formula di Simpson dipende dalla derivata quarta della
%funzion eintegranda). Ecco percè N=1 per il calcolo di I2.