% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 6: El autovector de 458 billones de dolares (hasta ahora)
% Conventional Power Method

function x = power_method(p, c, n, G, D, e)
	z = ((1-p)*(c ~= 0) + (c == 0))/n;
	A = p*G*D + e*z;
	x = e/n;
	oldx = zeros(n,1);
	while norm(x - oldx) > .01
	  oldx = x;
	  x = A*x;
	endwhile
	x = x/sum(x)
endfunction
