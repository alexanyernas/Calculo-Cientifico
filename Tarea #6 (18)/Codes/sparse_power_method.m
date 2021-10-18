% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 6: El autovector de 458 billones de dolares (hasta ahora)
% Sparse Power Method

function x = sparse_power_method(p, G, D, e, n, c)
  z = ((1-p)*(c ~= 0) + (c == 0))/n;
  G = p*G*D;
	x = e/n;
	oldx = zeros(n,1);
	while norm(x - oldx) > .01
	  oldx = x;
	  x = G*x + e*(z*x);
	endwhile
	x = x/sum(x)
endfunction