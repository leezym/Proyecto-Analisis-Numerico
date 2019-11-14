function prueba()
    clear all
    close all
    
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
    [x,y] = ginput();
    xI = x(1);
    yI = y(1);
    
    % Recorte curvo
    [X1,Y1] = curva(x,y);
    
    % Guardar datos de la curva
    [vectorX,vectorY] = forma(xI,yI,X1',Y1');
    
    % Obtener puntos en el plano (linea)
    [x,y] = ginput();
    
    % Guardar datos de la linea
    [vectorX,vectorY] = forma(vectorX,vectorY,x,y);
    
    recorte(vectorX,vectorY,xI,yI);   
end

function [X1,Y1] = curva(x,y)
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
end

function [vectorX,vectorY] = forma(vectorX,vectorY,x,y)
    vectorX = [vectorX ; x];
    vectorY = [vectorY ; y];
end

function recorte(vectorX,vectorY,x,y)
    vectorX = [vectorX ; x];
    vectorY = [vectorY ; y];
    % Forma completa
    plot(vectorX,vectorY,'-b','LineWidth',1.5)
end