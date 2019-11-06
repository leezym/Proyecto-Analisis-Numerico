%matlab.engine.shareEngine 

clear all
close all

hh=figure;
h1=axes;
set(hh,'color','w');
set(h1,'Ydir','reverse');
set(h1,'Xaxislocation','top')
xlim([0,500])
ylim([0,500])

grid on
hold on
I = imread('prueba.png');
I = imresize(I,[500,500]);
image(I)
[x,y]=ginput(6);

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
x
y
hold on
P=plot(x,y,'--rs','LineWidth',2,...
                       'MarkerEdgeColor','r',...
                       'MarkerFaceColor','k',...
                       'MarkerSize',7);
plot(X1,Y1,'-b','LineWidth',1.5)