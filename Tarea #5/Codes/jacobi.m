% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 5: Metodos Iterativos para Sistemas Lineales
% Metodo de Jacobi

function [ X ] = jacobi( A, b, tolerence, MaxNumOfIter )
  [n,n] = size(A);
  Results = [];
  finished = 0;
  x0 = zeros(length(b),1);
  X = x0;
  xs = A \ b;
  k = 1;
  while k <= MaxNumOfIter
      R = A * X - b;
      maxR = 0;
      for i = 1 : 1 : n
          if abs(R(i,1)) > maxR
              maxR = abs(R(i,1));
          endif
      endfor
      error = X - xs;
      maxE = 0;
      for i = 1 : 1 : n
          if abs(error(i,1)) > maxE
              maxE = abs(error(i,1));
          endif
      endfor
      Results = [Results; k, maxR, maxE];
      for i = 1 : 1 : n
          temp = b(i,1);
          for j = 1 : 1 : n
              if j ~= i
                  temp = temp - A(i,j) * x0(j,1);
              endif
          endfor
          X(i,1) = temp / A(i,i);
      endfor
      diff = X - x0;
      maxD = 0;
      for i = 1 : 1 : n
          if abs(diff(i,1)) > maxD
              maxD = abs(diff(i,1));
          endif
      endfor
      maxX = 0;
      for i = 1 : 1 : n
          if abs(X(i,1)) > maxX
              maxX = abs(X(i,1));
          endif
      endfor
      if (maxD / maxX) < tolerence
          finished = 1;
          break;
      endif
      k = k + 1;
      x0 = X;
  endwhile
endfunction