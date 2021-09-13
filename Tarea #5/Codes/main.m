% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 5: Metodos Iterativos para Sistemas Lineales

close all
clear all
clc

function main
   A = diag(4(ones(100,1))',0) + diag(-1(ones(99,1))',1) + diag(-1(ones(97,1))',3) + diag(-1(ones(99,1))',-1) + diag(-1(ones(97,1))',-3);
   b = A * ones(100,1); 
   %x = jacobi(A, b, 1e-13, 350);
   %x = gauss_seidel(A, b, 1e-13, 350);
   %x = steepest_descent(A, b, 1e-13, 350);
   %x = conjugate_gradients(A, b, 1e-13, 350);
   %disp(x)
endfunction

main()