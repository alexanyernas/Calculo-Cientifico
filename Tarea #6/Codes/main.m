% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 6: El autovector de 458 billones de dolares (hasta ahora)

close all
clear all
clc

function main
  % Definition Case
  n       = 8;
  i       = [2 3 5 4 8 1 3 8 7 1 5 6 7 1 3 6 1];
  j       = [1 1 1 1 1 2 2 3 3 4 4 5 6 6 7 7 8];
	G       = sparse(i, j, 1, n, n);
	spy(G);
  
	% PageRank
	p     = 0.85;
	delta = (1-p)/n;
	c     = sum(G, 1);
	k     = find(c ~= 0);
	D     = sparse(k, k,1./c(k), n, n);
	e     = ones(n, 1);j
	I     = speye(n, n);
	x     = (I - p*G*D)\e;
	x     = x/sum(x)
	
  % Conventional power method
  %x     = power_method(p, c, n, G, D, e);
  
	% Sparse power method
  %x     = sparse_power_method(p, G, D, e, n, c);
  
	% Inverse iteration
  %x     = inverse_iteration(I, G, D, e, p, c, n);
  
	% Bar graph
	bar(x)
	title('Page Rank')
endfunction

main();

