clc
clear all
a=0;
b=1;
tol=1.e-6;
Iy=[log(11)-log(10)];
Iz(31)=0;
for n=1:30
    syms x
    fun=x.^n/(x+10);
    f=matlabFunction(fun);
    [IN,N]=traptoll(f,a,b,tol);
    I(n)=IN;
    S(n)=N;
    if n>1
        Iy=[Iy (1/n-10*Iy(n-1))];
    end
end

for n=30:-1:1
    Iz(n)=1/10*(1/n-Iz(n+1));
end

errYI=abs(I-Iy)./abs(I);
errZI=abs(I-Iz(1:30))./abs(I);

figure 
semilogy(1:30, errYI,1:30, errZI, 'g');

% Il più preciso è Zi
