% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 3: Factorizacion QR y Minimos Cuadrados Lineales
% Respuesta 3-1-6)

format short
clear all
clc

% First case: the best fit straight line
A = [1 1; 1 1.5; 1 2; 1 2.5; 1 3];
y = [1.1; 1.2; 1.3; 1.3; 1.4];
% Solution of the Ax = y
x = A\y
% The best fit straight line is y=0.98+0.14*t

% Second case: the best fit quadratic polynomial
B = [1 1 1; 1 1.5 2.25; 1 2 4; 1 2.5 6.25; 1 3 9];
xsol = B\y
% The best fit quadratic polynomial is y=0.88+0.2543*t-0.0286*t^2

Err = [B*xsol-y]
% Norm of the above vector corresponds to Quadratic polynomial fit.
% Residual norm of the vector is given below
resnorm = norm(Err)

% Residual norm of in the first case is given below
resnorm1 = norm([A*x-y])
% OBSERVE THAT resnorm1 > resnorm