function [L,U,flag]=LU_nopivot(A)
    % Implementazione esplicitando solo il ciclo in k ( fa le operazioni su tutta la
    % sottomatrice da modificare al passo k)
    
    % Fattorizzazione  A=LU senza pivot
    % In output:
    %  L matrice triangolare inferiore
    %  U matrice triangolare superiore
    
    % Test dimensione
    [n,m]=size(A);
    flag=0;
    if n ~= m
        disp('errore: matrice non quadrata')
        L=[];
        U=[];
        flag=1;
        return
    end
    
    U=A;
    % Fattorizzazione
    for k=1:n-1
        %Test pivot
        if U(k,k) ==  0
            disp('elemento diagonale nullo')
            L=[]
            U=[]
            flag=1
            return
        end
        %Eliminazione gaussiana
        %Scrivi qui il codice che modifica le righe successive alla k-esima
        % calcola il moltiplicatore per la riga i
        %modifica la riga i negli elementi di posizione j da k+1 in avanti
        U(k+1:n,k)=U(k+1:n,k)/U(k,k);
        U(k+1:n,k+1:n)=U(k+1:n,k+1:n)-U(k+1:n,k)*U(k,k+1:n);
    end
    
    L=tril(U,-1)+eye(n);  % Estrae i moltiplicatori
    U=triu(U);            % Estrae la parte triangolare superiore + diagonale
end