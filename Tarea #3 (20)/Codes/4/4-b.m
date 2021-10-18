% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 3: Factorizacion QR y Minimos Cuadrados Lineales
% Respuesta 4.b)

format short
clear all
clc

function [Q, R] = myQr(A)
  [m,n] = size(A);
  if (m > n)
    % Initialization
    R = zeros(m,n);
    Q = eye(m,m);
    z = zeros(m);
    for j = 1:n
      % Reflection of column vector of A
      y = A(j:end,j);
      w = y +sign(A(j,j))*norm(y)*eye(size(y,1),1);
      v = w/norm(w);
      d = 2*(v*v');
      z(j:end,j:end) = d;
      % Generating Househoulder Matrix
      H = eye(m) - z;
      % Calculating new matrix A using H*A
      A = H*A;
      % Calculating orthogonal matrix, Q using Q=H1*H2*....*Hn
      Q = Q*H;
      z = zeros(m);
    endfor
  else
    % Initialization
    R = zeros(m,n);
    Q = eye(m,m);
    z = zeros(m);
    for j = 1:m-1
      % Reflection of column vector of A
      y = A(j:end,j);
      w = y +sign(A(j,j))*norm(y)*eye(size(y,1),1);
      v = w/norm(w);
      d = 2*(v*v');
      z(j:end,j:end) = d;
      % Generating Househoulder Matrix
      H = eye(m) - z;
      % Calculating new matrix A using H*A
      A = H*A;
      % Calculating orthogonal matrix, Q using Q=H1*H2*....*Hn
      Q = Q*H;
      z = zeros(m);
    endfor
  endif
  % Forming the R matrix, R = A
  for i = 1:m
    for j = i:n
      R(i,j) = A(i,j);
    endfor
  endfor
endfunction

function main

  % EXAMPLE 1
  % A = [12 -51 4; 6 167 -68; -4 24 -41];
  
  % EXAMPLE 2
  % A = [3 2 4; 2 0 2; 4 2 3];
  
  % EXAMPLE 3
  % A = [1 -1 4; 1 4 -2; 1 4 2; 1 -1 0];
  
  disp("A = ");
  disp(A);

  [Q, R] = myQr(A);
  disp("Q = ");
  disp(Q);

  disp("R = ");
  disp(R)

endfunction

main()