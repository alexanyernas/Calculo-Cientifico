% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 1: Factorizacion LU y Resolucion de SEL
% Pregunta b) 3.8

format short
clear all
clc

function [L, U, P] = LU(A)
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

function x = iter_ref(A,b)
  [~,n] = size(A); 
  x = inv(A)*b+1e-3*randn(n,1);
  [L,U] = LU(A);
  for k = 1:4
    r = A*x-b;
    z = -U\(L\r);
    x = x + z;
  endfor
endfunction

function main
  % Exercise (i)
  A = [0 1 0 0; 0 0 1 0; 0 0 0 1; 2 3 4 5];
  b = [1; 1; 1; 1];
  
  % Exercise (ii)
  % Matrix singular
  %A = [2 3 4 5; 0 1 0 0; 0 0 0 0; 0 0 1 0];
  %b = [1; 1; 1; 1];

  % Exercise (iii)
  %A = hilb(5);
  %b = [1; 1; 1; 1; 1];
  
  % Exercise (iv)
  %A = [10**(-4) 1; 1 2];
  %b = [1; 1];
  
  disp("LU decomposition")
  [L, U, P] = LU(A);
  disp("L = ")
  disp(L);
  disp("U = ")
  disp(U);
  disp("P = ")
  disp(P);
  disp("PA = ")
  disp(P * A)
  disp("LU = ")
  disp(L * U)
  disp("--------------------")
  
  disp("Solve system of linear equations Ax = b with LU decomposition")
  %First solve Ly = b with forward substitution, then solve Ux = y with backward substitution  
  y = fsub(L, b);
  x = bsub(U, y);
  disp("Solution:")
  disp("x = ")
  disp(x)
  disp("--------------------")

  disp("Iterative Refinement - Solution ")
  if det(A) ~= 0
    x1 = iter_ref(A,b,x)
  else
    disp('A is singular')
  endif
  
endfunction

main()
