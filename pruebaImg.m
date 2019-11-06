function pruebaImg()
    grid on
    hold on
    I = imread('prueba.jpg');
    I = imresize(I,[200,200]);
    image(I)
    xx=linspace(0,200);
    [x,y] = ginput(6);
    yy = spline(x,y,xx);
    plot(x,y,'o')
    plot(xx,yy,'r')
end