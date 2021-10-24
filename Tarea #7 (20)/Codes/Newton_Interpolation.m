% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 7: Interpolacion polinomial y Splines
% Polinomio Interpolante de grado menor o igual a n

close all
clear all
clc
format long

function newton_interpolation
  %  newton_interpolation computes a interpolating
  %  polynomial of the function
  %    
  %     f(x) = log(x^1)
  %
  %  based on n linearly spaced 
  %  points in the interval [2, 10] 

  n = 10;
  X = linspace(2, 10, n);
  Y = log(X.^1);
  
  DD(1:n,1) = X;
  DD(1:n,2) = Y;
  
  P = interpolating_polynomial(n,X,Y,DD)
  plot_newton_interpolation(X,Y,P)
endfunction

function P = interpolating_polynomial(n,X,Y,DD)
  for j = 1:n-1
     for k = 1:n-j  
        DD(k,j+2) = (DD(k+1,j+1)-DD(k,j+1))/(DD(k+j,1)-DD(k,1));
     endfor
  endfor

  Prod = zeros(n-1,n); 
  p    = conv(1,[1,-X(1)]); %  poly (x-x(1))
   
  for i = 1:n-1
    Prod(i,(n-(length(p)-1)):n) = DD(1,i+2)*p;
    p = conv(p,[1,-X(i+1)]); % poly (x-x(1)*(x-x(2))....
  endfor
   
  P      = sum(Prod,1);
  P(1,n) = P(1,n)+Y(1);
endfunction

function plot_newton_interpolation(X,Y,P)
  % plot a interpolating polynomial
  
  x_eval = min(X):0.1:max(X);
  y_eval = polyval(P,x_eval);
  plot(x_eval,y_eval); 
  hold on;
  plot(X,Y,"xr");
  hold on;
  plot(X,log(X),"or")
endfunction

newton_interpolation();