function [yv,a]= InterpN(x,y,xv)
a=coeff_InterpN(x,y);
yv=pvalHornerN(a,x,xv);


% n=5; % Grado polinomio.
% a=-5;
% b=5;
% xv=linspace(a,b,200); % Punti in cui valutare il polinomio.
% f=@(x)1./(1+x.^2);
% xEquispaziati=linspace(a,b,n+1); %Così sono equispaziati, con chebishev verrebbe più preciso ai bordi.
% yEquispaziati=f(xEquispaziati);
% [yv,a]= InterpN(xEquispaziati,yEquispaziati,xv);
% figure
% plot(xEquispaziati, yEquispaziati, 'r*', xv, yv )
% errore=f(xv)-yv';
% figure
% plot(xv, errore)

