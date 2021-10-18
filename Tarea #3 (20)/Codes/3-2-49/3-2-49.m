% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 3: Factorizacion QR y Minimos Cuadrados Lineales
% Respuesta 3-2-49)

format short
clear all
clc

n = 7
A = randn(n)
[Q, R] = qr(A)
Q'*Q
norm(eye(n)-Q'*Q)
norm(A-Q*R)