% % Grafica Curva de Bezier Grado 2
% Para evaluar la curva, se genera un vector aleatorio para los respectivos
% puntos, sin embargo estos valores pueden ser cualquier numero real.
x = rand(1,3);
y = rand(1,3);
X = x(1).*((1 - t).^ 2) + 2.* x(2).* ((1 - t).* t) + x(3).* (t.^ 2);
Y = y (1).*((1 - t).^ 2) + 2.* y(2).* ((1 - t).* t) + y(3).* (t.^ 2);
figure
hold on
plot (X, Y, '-' , 'LineWidth', 2.3), axis off
plot (x, y, 'r-' , 'LineWidth', 2.3)
plot (x, y, 'bo' , 'MarkerSize',5, 'MarkerFaceColor', 'b')