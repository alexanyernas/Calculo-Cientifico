% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 2: Factorizacion Cholesky y Sistemas Especiales
% Pregunta 4.b

format short
clear all
clc

function x = lu_solve(A,b)
  % Obtain number of rows (should equal number of columns)
  n = size(A, 1); 
  % Start L off as identity and populate the lower triangular half slowly
  L = eye(n); 
  for k = 1 : n
    % For each row k, access columns from k+1 to the end and divide by
    % the diagonal coefficient at A(k ,k)
    L(k + 1 : n, k) = A(k + 1 : n, k) / A(k, k);
    % For each row k+1 to the end, perform Gaussian elimination
    % In the end, A will contain U
    for l = k + 1 : n
        A(l, :) = A(l, :) - L(l, k) * A(k, :);
    endfor
  endfor
  U = A;
  y = L\b;
  x = U\y;
endfunction

function main
  % EXAMPLE 1
  A = [5 2 1; 0 -3 2; -4 1 6];
  b = [1; 0; -1];
  
  % EXAMPLE 2
  %A = [10 2 3 0 0; 2 20 4 5 0; 3 4 30 6 7; 0 5 6 40 8; 0 0 7 8 50];
  %b = [2; 4 ; 5; -2; 1];
  
  % EXAMPLE 3
  %A = [7 2 0; 3 5 -1; 0 5 -6];
  %b = [1; 1; 1];

  disp("A = ");
  disp(A);
  disp("b = ");
  disp(b);
  
  x = lu_solve(A, b);
  disp("Solution");
  disp("x = ");
  disp(x);

endfunction

main();