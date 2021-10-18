% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 5: Metodos Iterativos para Sistemas Lineales

close all
clear all
clc

function graph(times)
  figure; 
  title('Time Execution');
  plot(times, '*');
  grid on
  xlabel('Methods');
  ylabel('CPU Time (Seconds)');
endfunction

function main
   % PROBLEM DEFINITION
   A = diag(4(ones(100,1))',0) + diag(-1(ones(99,1))',1) + diag(-1(ones(97,1))',3) + diag(-1(ones(99,1))',-1) + diag(-1(ones(97,1))',-3);
   b = A * ones(100,1);
   times = [];
   
   % JACOBI METHOD
   t = cputime;
   x = jacobi(A, b, 1e-13, 150);
   times = [times; cputime-t];
   
   % GAUSS-SEIDEL METHOD
   t = cputime;
   x = gauss_seidel(A, b, 1e-13, 150);
   times = [times; cputime-t];
    
   % STEEPEST DESCENT METHOD   
   t = cputime;
   x = steepest_descent(A, b, 1e-13, 150);
   times = [times; cputime-t];
   
   % CONJUGATE GRADIENTS METHOD
   t = cputime;
   x = conjugate_gradients(A, b, 1e-13, 150);    
   times = [times; cputime-t];
   
   graph(times);
endfunction

main()