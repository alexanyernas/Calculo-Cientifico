% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 2: Factorizacion Cholesky y Sistemas Especiales
% Pregunta 4.a

format short
clear all
clc

function R = cholesky(A, n)
  % Create the empty R matrix
  R = zeros(n);
  % Fill the R matrix
  for i = 1:n
    for j = 1:n
      if(i == j)
        squares = 0;
        for k = 1:j-1
          squares = squares + (R(j,k))^2;
        endfor
        R(j,j) = sqrt(A(j,j) - squares);
      elseif(i > j)
        summation = 0;
        for k = 1:j-1
          summation = summation+ R(i,k)*R(j,k);
        endfor
        R(i,j) = ((A(i,j)-summation)/(R(j,j)));
      endif
    endfor
  endfor
endfunction

function main
  % EXAMPLE 1
  %A = [1 0 1; 0 2 0; 1 0 3];
  
  % EXAMPLE 2
  A = [6 15 55; 15 55 225; 55 225 979];
  
  % EXAMPLE 3
  %A = [25 15 -5; 15 18 0; -5 0 11];
  
  % EXAMPLE 4
  %format long
  %A = [5 1.2 0.3 -0.6; 1.2 6 -0.4 0.9; 0.3 -0.4 8 1.7; -0.6 0.9 1.7 10];
  
  disp("A = ");
  disp(A);
  
  R = cholesky(A, size(A,1));
  disp("R = ");
  disp(R);   

  disp("RR' = ");
  disp(R * R');
  
endfunction

main()