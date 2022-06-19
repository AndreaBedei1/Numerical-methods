function f = DaPolinomioAFunzione(xEqui, a)
    syms z
    n=length(xEqui);
    ps=a(n);
    for k=n-1:-1:1
     ps= (z-xEqui(k))*ps + a(k);
    end
    ps
    f=matlabFunction(ps);
end