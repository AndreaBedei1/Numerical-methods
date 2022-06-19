clc
clear all
N=6; % Numero sottointervalli.
i=1;
for a=-5/2:1/180:-3/2
    f=@(x)x.^5+2*a*x.^4+4*x.^3+4*a*x.^2+3;
    I=TrapComp(f,0,2,N)
    Iesatto=32/3*a^2+64/5*a+98/3;
    errore(i)=abs(Iesatto-I);
    i=i+1;
end
a=-5/2:1/180:-3/2;
figure 
plot(-5/2:1/180:-3/2, errore);
[val min]=min(errore);
errore(min);
hold on
plot(a(min), errore(min), '*')