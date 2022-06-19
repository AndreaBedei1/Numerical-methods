function [x, flag] = cholesky(A,b)
    [L, flag]=chol(A,'lower');
    if flag>0
        error('Matrice non definita positiva');
    end
    [soluzione, flag]=Lsolve(L,b);
    if flag==0
        [x, flag]=Usolve(L', soluzione);
    end
    detM=prod(diag(L)).^2
end