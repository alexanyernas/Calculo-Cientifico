% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 5: Metodos Iterativos para Sistemas Lineales
% Metodo de Minimo Descenso del Gradiente (Steepest Descent)

function x = steepest_descent(A, b, tol, maxiter)
  iter = 1;
  x = zeros(size(A,1),1);
  r = b - A*x;
  delta = r'*r;
  conv = delta;
  delta0 = delta;
  while (delta > tol*delta0) && (iter < maxiter)
    q = A*r;
    alpha = delta/(q'*r);
    x = x +alpha*r;
    if mod(iter, 50) == 0
        r = b - A*x;
    else
        r = r - alpha*q;
    endif
    delta = r'*r;
    conv = [conv, delta];
    iter = iter + 1;
  endwhile
endfunction
