% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 5: Metodos Iterativos para Sistemas Lineales
% Metodo de Gauss-Seidel

function x = gauss_seidel( A, b, tolerence, MaxNumOfIter )
    [n,m] = size(A);
    [u,~] = size(b);
    counter = 1;
    x0 = zeros(n,1);
    x = zeros(n,1);
    for i = 1:n
      s = 0;
      for j = 1:n
          if i ~= j 
              s = s + abs(A(i,j));
          endif
      endfor
    endfor
    while (counter < MaxNumOfIter)
        for i = 1:n
            I = [1:i-1 i+1:n];
            x(i) = (b(i) - A(i,I) * x(I)) / A(i,i);
        endfor
        % Calculate error and compare with tolerence entered
        esp = (abs(x(i)-x0) / abs(x(i)));
        if max(esp) < tolerence
           break;
        endif
        x0 = x;
        counter = counter + 1;
    endwhile
endfunction