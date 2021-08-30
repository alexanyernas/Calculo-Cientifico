% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 3: Factorizacion QR y Minimos Cuadrados Lineales
% Respuesta 3-1-5-d)

format short
clear all
clc

% Initializes yi value from the given question
y = [1.1;1.2;1.3;1.3;1.4];
% Initializes ti value from the given question
t = 1:0.5:3;
t = t';
% Find the norm of the residual
r=norm((y - (0.98 +0.14*t)))