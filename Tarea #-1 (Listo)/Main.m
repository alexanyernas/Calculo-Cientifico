% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea -1: Repaso de Algebra Lineal

format short
clear all
clc

function result = hasSolution(A, Ag, n)
  if rank(A) == rank(Ag)
    if rank(A) == n
      % One (1) for Unique Solution
      result = 1;
    else
      % Two (2) for Infinite Solutions
      result = 2;
    endif
  endif
  if rank(Ag) > rank(A)
    % Zero (0) for No Solution
    result = 0;
  endif
endfunction

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

function solution = getUniqueSolution(A, b, Ag)
  % It's squared
  if size(A,1) == size(A,2)
    for i=1:size(Ag,1)
      Ag(i,:) = Ag(i,:)./Ag(i,i);
      for j = 1:size(Ag,1)
        if j~=i
          pivot = Ag(j,i)./Ag(i,i);
          Ag(j,:) = Ag(j,:)-pivot.*Ag(i,:);
        endif
      endfor
    endfor 
    solution = Ag(:,end);
  else
  % It is not square
    [Q,R] = myQr(A);
    solution = R \ (Q' * b);
  endif
endfunction

function getInfiniteSolutions(A, b) 
  [m,n] = size(A);
  n = min(m,n);

  Au = [A,b];
  Au = sym(Au);
  kA = rank(A);
  kAu = rank(Au);
  
  % The matrix A is irregular, SLE has infinitely many solution
  % in this case we need compute the base of solution and a general solution as a linear
  % combination of the base vectors.
  
  % create augumented matrix
  R=rref(Au) 
          
  % create n variables, number of columns in matix A=number of variables
  x = sym('x',[1 n])
  a = sym('a', [1 n])
  r = rank(R); 
  %find out number of free variables
  p = n-r; 
  t = sym('t', [1 p])
          
  % create empty symbolic arrays to store equations and basic and free variables
  eqn = sym(zeros(r,n));
  eqns = sym(zeros(r,1));
  vrb = sym(zeros(1,r));
  bsc = sym(zeros(1,n));
                
  % create symbolic equations from matrix so it can be solved by the
  % 'solve' matlab function
  for i=1:r 
    for j=1:n
      %create symbollic equations from reducer row echelon matrix
      eqn(i,j) = R(i,j)*a(j); 
      eqns(i) = eqns(i)+eqn(i,j);          
      %find out basic variables
      if R(i,j) ~= 0 && vrb(i) ==0
        vrb(i)= x(j); 
        bsc(j)= a(j);                  
      endif                                                     
    endfor
    %add right side to the equations
    eqns(i)=eqns(i)==R(i,end);
  endfor
  %find out free variables by substracting basic from all variables
  frees = a-bsc; 
  %store free variables
  free = nonzeros(frees).'; 
  %store basic variables 
  bsc = nonzeros(bsc).'; 
    
  t = flip(t);              
  %replace basic variables with x
  eqnss = subs(eqns,bsc,vrb); 
  %replace free variables with parameter t      
  eqnss = subs(eqnss,free,t); 
    
  %solve the equations 
  S = solve(eqnss,vrb); 
   
  %create vector with solution
  tt = subs(frees,free,t);
  idx = find(tt == 0);
          
  fprintf('%s',"Parametric solution of a SLE:");
  disp(tt.');
  fprintf('%s',"Where ");
  disp(t);
          
  if length(t) == 1
    fprintf('%s'," is arbitrary real number");
  else
    fprintf('%s'," are arbitrary real numbers");
  endif     
endfunction

% MAIN FUNCTION
function main  
  % UNIQUE SOLUTION - CASE #1
  A = [-41 15 0; 109 -40 0; -3 1 0;2 0 1];
  b = [168; -447; 12; -1];
  
  % UNIQUE SOLUTION - CASE #2
  %A = [1 0; 0 1];
  %b = [1; 1];
  
  % NO SOLUTION - CASE #3
  %A = [1 0; 0 1; 0 0];
  %b = [1; 1; 1];
  
  % Note: run "pkg load symbolic" from the Octave prompt
  % INFINITE SOLUTIONS - CASE #4
  %A = [1 0; 0 0];
  %b = [1; 0];
  
  Ag = [A b]; 
  result = hasSolution(A, Ag, size(A,2));
  
  disp('A =')
  disp(A)
  disp('b =')
  disp(b)
  
  if result == 0
    disp('System of Linear Equations Ax = b has no solution.')
  elseif result == 1
    disp('System of Linear Equations Ax = b has unique solution.')
    disp('Solution = ')
    disp(getUniqueSolution(A, b, Ag));
  else
    disp('System of Linear Equations Ax = b has infinites solutions.')
    getInfiniteSolutions(A,b);
  endif
endfunction

main();