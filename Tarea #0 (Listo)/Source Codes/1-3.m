%	Estudiante: Naranjo Sthory Alexanyer Naranjo
%	Cedula de identidad: V - 26.498.600
%	Asignatura: Calculo Cientifico (6105)
%	Tarea 0: Introduccion al Calculo Cientifico
%   Ejercico 1.3

% NOTA:

%	Python no admite nullmeros de coma flotante de precision simple; los ahorros en el uso del 
%	procesador y la memoria que suelen ser la razón para usarlos se ven 
%	eclipsados por la sobrecarga de usar objetos en Python, por lo que no 
%	hay razon para complicar el lenguaje con dos tipos de numeros de punto flotante.
%	Por ello, he indicado tambien una visualizacion del truco utilizando el lenguaje de programacion
%	Octave apoyado de las funciones que ofrece; single() y double(), los cuales se encargan de tomar
%	un valor X y representarlo en un sistema de simple y doble precision respectivamente.

single_result = abs(3 * (4/3 - 1) - 1)
disp(single(single_result))

double_result = abs(3 * (4/3 - 1) - 1)
disp(double(double_result))