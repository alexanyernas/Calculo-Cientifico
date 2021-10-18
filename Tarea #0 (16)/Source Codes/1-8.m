% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 0: Introduccion al Calculo Cientifico
% Ejercicio 1.8

% Se ha definido un valor limite N = 1000 para establecer
% hasta donde llegar con la ejecucion de la serie
% armonica indicada en el enunciado del ejercicio.

function single_precision()
  n = 10000
  result = 0.0
  printf("\t***SINGLE PRECISION***\n")
  for i = 1:n
    t = cputime()
    result = result + (1/i)
    printf("* Index: %d - Result: %f\n",i,single(result))
    printf("* CPU time: %f\n", t)
    disp("----------")
  endfor
endfunction

function double_precision()
  n = 10000
  result = 0.0
  printf("\t***DOUBLE PRECISION***\ns")
  % Octave works with double precision by default
  for i = 1:n
    t = cputime()
    result = result + (1/i)
    printf("* Index: %d - Result: %f\n",i,result)
    printf("* CPU time: %f\n",t)
    disp("----------")
  endfor
endfunction

% Difference between them
single_precision()
double_precision()