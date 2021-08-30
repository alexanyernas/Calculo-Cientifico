% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 3: Factorizacion QR y Minimos Cuadrados Lineales
% Respuesta 3-1-7)

% Initializes yi value from the given question
y = [1.1; 1.2; 1.3; 1.3; 1.4];
% Initializes ti value from the given question
t = 1:.5:3;
% Plot t and y values
plot(t, y, '*')
hold on
% Plot the t and least squares straight line equation
plot(t, (0.98+0.14*t), '-')
hold on
% Plot the t and quadratic polynomial
d = @(g)0.88+0.2542*g-0.0285*g.^2;
plot(t, d(t));
hold on
% Plot the 5 and polynomial of degree 4
e = @(h)2.8-4.5167*t+4.15*t.^2-1.533*t.^3+0.2*t.^4;
plot(t, e(t));