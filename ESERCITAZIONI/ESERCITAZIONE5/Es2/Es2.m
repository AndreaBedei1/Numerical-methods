clc
clear all

f=@(x)1/(1+900.*x.^2);

for n=5:5:30
    i=n+1:-1:1;
    xc=cos(((2*i-1)*pi)/(2*(n+1)));
    i=1:n+1;
    xe=-1+2*(i-1)/n;
    a=-1;
    b=1;
    xv=linspace(a,b,200); % Punti in cui valutare il polinomio.
    ye=f(xe);
    [yv,a]= InterpN(xe,ye,xv);
    figure
    plot(xe, ye, 'r*', xv, yv )
    errore=f(xv)-yv';
    figure
    plot(xv, errore)
    return
end