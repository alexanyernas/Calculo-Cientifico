% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 3: Factorizacion QR y Minimos Cuadrados Lineales
% Respuesta 3-1-7)

format short
clear all
clc

y = [1.1; 1.2; 1.3; 1.3; 1.4];
A = [1 1; 1 1.5; 1 2; 1 2.5; 1 3];
% Solution of the Ax = y
x = A\y
% The best fit straight line y = 0.9800+0.14t
B = [1 1 1; 1 1.5 2.25; 1 2 4; 1 2.5 6.25; 1 3 9];
% Solution of the Bx = y
xsol = B\y
% The best fit quadratic polynomial is y = 0.88+0.2542t-0.0285t^t
C = [1 1 1 1 1; 1 1.5 2.25 3.375 5.0625; 1 2 4 8 16; 1 2.5 6.25 15.625 39.0625; 1 3 9 27 81];
% Solution of the Cx = y
xsol2 = C\y
% The best fit polynomial of degree 4 is y = 2.8-4.5167t+4.15t^2-1.5333t^3+0.2t^4
Err = [C*xsol2-y]
% Norm of the above vector corresponds to Polynomial of degree 4 fit.
% Residual norm of the vector is given below.
resnorm = norm(Err)
% Residual norm of in the first case is given below
% The best fit straight line
resnorm1 = norm([A*x-y])
% Residual norm of in the second case is given below
% The best fit quadratic polynomial
resnorm2 = norm([B*xsol-y])
% OBSERVE THAT resnorm1 > resnorm2 > resnorm