% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 1: Factorizacion LU y Resolucion de SEL
% Pregunta c) 5.9

format short
clear all
clc

function [L, U, P] = lu_pp(A)
%A is the coefficient matrix
%L and U are lu factorized value of A
%P is parmutation matrix
%below is the algorithm for Gaussian elimination
    [m, n] = size(A); 
    L = eye(n); 
    P = eye(n); 
    U = A;
    %initialization of L U and P
    %Loop for LU matrix formation for A matrix
    for k = 1:m-1
        pivot = max(abs(U(k:m,k)));
        for j = k:m
            if(abs(U(j,k)) == pivot)
                ind = j;
                break;
            endif
        endfor
        %updated L U and P values
        U([k,ind],k:m) = U([ind,k],k:m);
        L([k,ind],1:k-1) = L([ind,k],1:k-1);
        P([k,ind],:) = P([ind,k],:);
        %Loop for L and U matrix formation
        for j = k+1:m
            L(j,k) = U(j,k)/U(k,k);
            U(j,k:m) = U(j,k:m)-L(j,k)*U(k,k:m);
        endfor
    endfor
endfunction

function x = bsub(U,y)
        %Code for Backward subtitution
        x = zeros(length(y),1);
        for i = length(y):-1:1
        s = 0;
        for j = length(y):-1:1
            if i ~= j
                s = s+U(i,j)*x(j);
            endif
        endfor
        x(i) = (y(i)-s)/U(i,i);
        endfor
endfunction

function y = fsub(L,b)
        %Code for forward subtitution
        y = zeros(length(b),1);
        for i = 1:length(b)
        s = 0;
        for j = 1:length(b)
            if i ~= j
                s = s+L(i,j)*y(j);
            endif  
        endfor
        y(i) = (b(i)-s)/L(i,i);
        endfor
endfunction

function main
  A = [15 6 8 11;6 6 5 3;8 5 7 6;13 3 6 9];
  X2 = [1;1;1;1];
  b = A*X2;

  %Displaying all matrix
  fprintf('The A1 matrix is \n')
  disp(A)

  fprintf('The b matrix is \n')
  disp(b)

  %Calling function lup
  [L,U,P] = lu_pp(A);

  %loop fo finding all x
  X = bsub(U,fsub(L,P*b(:,1)));

  %Displaying solution matrix
  fprintf('The solution matrix X is \n')
  disp(X)

  fprintf('Error in solution of x is %e \n',norm(X-X2))
  disp("--------------------")

  A = A^2;
  b = A*X2;

  %Displaying all matrix
  fprintf('The A2 matrix is \n')
  disp(A)

  fprintf('The b matrix is \n')
  disp(b)

  %Calling function lup
  [L,U,P] = lu_pp(A);
  %loop fo finding all x
  X = bsub(U,fsub(L,P*b(:,1)));

  %Displaying solution matrix
  fprintf('The solution matrix X is \n')
  disp(X)

  fprintf('Error in solution of x is %e \n',norm(X-X2))
  disp("--------------------")

  A = A^3;
  b = A*X2;

  %Displaying all matrix
  fprintf('The A3 matrix is \n')
  disp(A)

  fprintf('The b matrix is \n')
  disp(b)

  %Calling function lup
  [L,U,P] = lu_pp(A);

  %loop fo finding all x
  X = bsub(U,fsub(L,P*b(:,1)));

  %Displaying solution matrix
  fprintf('The solution matrix X is \n')
  disp(X)

  fprintf('Error in solution of x is %e \n',norm(X-X2))
endfunction

main();
