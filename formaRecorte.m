function prueba()
    clear all
    close all
    
    N = 5;
    
    % Configuracion de estilo de la interfaz
    hh=figure;
    h1=axes;
    set(hh,'color','w');
    set(h1,'Ydir','reverse');
    set(h1,'Xaxislocation','top')
    
    % Limites plano cartesiano
    xlim([0,300])
    ylim([0,300])
    
    % Leer imagen
    I = imread('cocina.gif');
    I = imresize(I,[300,300]);
    image(I)
    
    % Obtener puntos en el plano (curva)
    [x,y]=ginput();
    
    % Recorte curvo
    [xF,yF,X1,Y1] = curva(x,y);
    
    % Guardar datos de la curva
    [vectorX,vectorY] = forma(x(1),y(1),X1',Y1');
    
    % Obtener puntos en el plano (linea)
    [w,z]=ginput();
    
    % Recorte lineal   
    [wF,zF] = linea(w,z,xF,yF);
    
    % Guardar datos de la linea
    [vectorX,vectorY] = forma(vectorX,vectorY,w,z);
    
    recorte(vectorX,vectorY);   
end

function [xF,yF,X1,Y1] = curva(x,y)
    hold on
    % Rectas (m,n) y (t,h)
    m=length(x);
    n=m-1;
    J(1:m)=0;
    X(1:m)=0;
    Y(1:m)=0;
    t=0:.001:1;
    h=length(t);
    
    for i= 1:m
        for j = 1:h
            ni=factorial(n)/(factorial(i-1)*factorial(n-(i-1)));
            J(i,j)=ni*t(j)^(i-1)*(1-t(j))^(n-(i-1));
            X(i,j)=J(i,j)*x(i);
            Y(i,j)=J(i,j)*y(i);
        end
        X1=sum(X);
        Y1=sum(Y);
    end
    %plot(X1,Y1,'-b','LineWidth',1.5)
    xF = x(length(x));
    yF = y(length(y));
end

function [wF,zF] = linea(w,z,wI,zI)
    hold on
    % Obtener puntos en el plano (linea)
    [w,z]=ginput();
    w = [wI; w];
    z = [zI; z]; 
    %plot(w,z,'-b','LineWidth',1.5)
    wF = w(length(w));
    zF = z(length(z));
end

function [vectorX,vectorY] = forma(vectorX,vectorY,x,y)
    vectorX = [vectorX ; x];
    vectorY = [vectorY ; y];
end

function recorte(vectorX,vectorY)
    % Forma completa
    plot(vectorX,vectorY,'-b','LineWidth',1.5)
end