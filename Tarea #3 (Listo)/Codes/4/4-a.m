% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 3: Factorizacion QR y Minimos Cuadrados Lineales
% Respuesta 4.a)

format short
clear all
clc

function [Q, R] = myQr(A, n)
    Q = zeros(n);
    for i = 1:n
        a = A(:, i);
        q = a; 
        if i ~= 1
            for j = 1:i
                q = q - (dot(a, Q(:, j)))*Q(:, j);
            endfor
        endif
        q = q / norm(q, 2); % Normalizing the vector
        Q(:, i) = q;
    endfor
    R = transpose(Q) * A;
endfunction

function main

  % EXAMPLE 1
  % A = [12 -51 4; 6 167 -68; -4 24 -41];
  
  % EXAMPLE 2
  % A = [0 1 1; 1 2 3; 1 2 2];
  
  % EXAMPLE 3
  % A = [3 2 4; 2 0 2; 4 2 3];
  
  disp("A = ");
  disp(A);

  [Q, R] = myQr(A, size(A,1));
  disp("Q = ");
  disp(Q);

  disp("R = ");
  disp(R)

endfunction

main()