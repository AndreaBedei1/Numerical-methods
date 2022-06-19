clc
clear all
B=[0.98 0.02 0 0.04 0; 0.08 0.93 0.08 -0.07 -0.03; 0.04 0.01 0.97 -0.07 -0.04; 0.02 -0.03 0 1.03 0; 0.07 0.04 0 -0.08 1.01];

A=eye(size(B, 1))-B;
M=max(max(A));
if M<(1/5)
    fprintf('M è minore!');
end
InversaB=A^0;
InversaB=InversaB+A^1;
InversaB=InversaB+A^2;
InversaB=InversaB+A^3;
for i=1:size(B, 1)
    if det(B(1:i, 1:i))==0
        disp('B non ammette fattorizzazione LU senza pivoting!')
    end
end
% Siccome il messaggio sopra non viene mostrato, B ammette fattorizzazione
% LU senza pivoting.
[L,U,flag]=LU_nopivot(B);
inversaConGauss=inversa_nsistemi(B,eye(size(B, 1)));
errore1=norm(InversaB-inv(B))/norm(inv(B))
errore2=norm(inversaConGauss-inv(B))/norm(inv(B))
% Siccome l'errore nel secondo metodo è minore, risulta più accurata
% l'inversa calcolata con fattoruzzazione LU senza pivoting.
