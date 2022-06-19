function [IN,N]=simptoll(fun,a,b,tol)

Nmax=2048;
err=1;

N=1;
IN=SimpComp(fun,a,b,N);
while N<=Nmax && err>tol
    N=2*N;
    I2N=SimpComp(fun,a,b,N);
    if abs(IN-I2N)==0
        N=N/2;
        return
    end
    err=abs(IN-I2N)/15;
    IN=I2N;
end
if N>Nmax
    fprintf('Raggiunto nmax di intervalli con simptoll\n')
end
