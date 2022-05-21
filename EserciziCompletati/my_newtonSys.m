function [x1,Xm,it]= my_newtonSys(fun,jac,x0,tolx,tolf,nmax)
    %
    % Funzione per la risoluzione del sistema f(x)=0
    % mediante il metodo di Newton Raphson.
    %
    % INPUT:
    %      fun, jac  nomi dei file contenenti rispettivamente
    %                il vettore di funzioni  non lineari e
    %                la matrice Jacobiano del vettore di funzioni non lineari
    %         x0     vettore colonna contenente l'approssimazione iniziale della soluzione
    %         tolx     parametro di tolleranza per l'errore tra due iterati
    %         successivi
    %           tolf: tolleranza sul valore della funzione
    % OUTPUT:
    %         x      vettore soluzione del sistema non lineare
    %         Xm   vettore contenente l'errore relativo tra due soluzioni
    %         successive
    %       it     numero di iterazioni fatte per ottenere l'approssimazione desiderata
    %
    
    matjac=jac(x0);
    if det(matjac)==0
        disp('Matrice jacobiano non rango a massimo');
        x1=[];
        Xm=[];
        it=[];
        return
    else
        s=-matjac\fun(x0);
        %aggiornamento della soluzione
        it=1;
        x1=x0+s;
        fx1=fun(x1);
    end
    Xm=[norm(s,1)/norm(x1,1)];
    while  it<=nmax && norm(fx1,1)>=tolf && norm(s,1)>=tolx*norm(x1,1)
        x0=x1;
        it=it+1;
        matjac=jac(x0);
        if det(matjac)==0
            disp('Matrice jacobiano non rango a massimo');
            x1=[];
            Xm=[];
            it=[];
            return
        else
            %Risolvo il sistema lineare aventa come matrice dei coefficienti la
            %matrice Jacobiana e come termine noto la Funzione vettoriale F valutata
            %in x0
            s=matjac\fun(x0);
            %aggiornamento della soluzione
            x1=x0-s;
            fx1=fun(x1);
            Xm=[Xm;norm(s,1)/norm(x1,1)];
        end
    end
    if it==nmax
        disp('Il procedimento non converge con la ');
        disp('precisione desiderata.');
        disp('Dopo 100 passi');
        fprintf('\t\t norma = %f .',norm(x-x0,'inf'));
    end
end
% f=@(x)[2*x(1)-cos(x(2)); sin(x(1))+2*x(2)]; % funzione.
% jac=@(x)[2  sin(x(2)); cos(x(1)) 2]; % Jacobiano calcolo delle derivate parziali.
% xm=[-4:0.5:4];
% ym=[-4:0.5:4];
% [X,Y]=meshgrid(xm,ym);
% Z=2*X-cos(Y);
% Z1=sin(X)+2*Y;
% figure
% mesh(X,Y,Z);
% hold on
% contour(X,Y,Z,[0 0],'r-');
% figure
% mesh(X,Y,Z1);
% hold on
% contour(X,Y,Z1,[0 0],'b-');
% figure
% contour(X,Y,Z,[0 0],'y-');
% hold on
% contour(X,Y,Z1,[0 0],'g-'); % Dal grafico si vede che le 2 funzioni si incontrano in
% x0=[-2;2]; %Intervallo scelto dal grafico vicino al punto di incontro.
% tolx=1e-10;
% tolf=tolx;
% nmax=200;
% % Ricavo la soluzione e la grafico.
% [x1,Xm,it]= my_newtonSys(f,jac,x0,tolx,tolf,nmax);
% plot3(x1(1), x1(2), f([x1(1),x1(2)]), 'ro');
% % Grafico l'errore.
% figure
% semilogy(1:it,Xm,'r-');


