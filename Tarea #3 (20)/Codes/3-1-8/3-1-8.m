% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 3: Factorizacion QR y Minimos Cuadrados Lineales
% Respuesta 3-1-8)

% Initializes yi value from the given question
y = [1.1; 1.2; 1.3; 1.3; 1.4];
% First column is 1
% Second column is e^(t)
% Third column is e^(-t)
x = [
  1 exp(1) exp(-1);
  1 exp(1.5) exp(-1.5);
  1 exp(2) exp(-2);
  1 exp(2.5) exp(-2.5);
  1 exp(3) exp(-3);
];
% Solve a system of equations for the
% best least squares fit to the data
b = (inv(x'*x))*(x')*y
% So, the best least squares fit is,
% y = 1.3248 + 0.0048 * e^t -0.6411*e^(-t)