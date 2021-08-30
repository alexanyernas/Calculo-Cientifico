% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 1: Factorizacion LU y Resolucion de SEL
% Pregunta c) 5.6

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

function main
  A = [1 1+0.5*(10**-15) 3; 2 2 20; 3 6 4];
  
  disp("A = ")
  disp(A)
  disp("--------------------")
  
  [L, U] = LU(A);
  disp("L = ")
  disp(L);
  disp("U = ")
  disp(U);
  disp("--------------------")
  
  %The accuracy of lu decomposition
  error = norm(L*U-A) / norm(A) 

endfunction

main()