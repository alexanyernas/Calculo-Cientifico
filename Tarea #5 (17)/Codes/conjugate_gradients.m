% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 5: Metodos Iterativos para Sistemas Lineales
% Metodo de los Gradientes Conjugados (Con Precondicionamiento)

function x = conjugate_gradients(A, b, res_tol, max_iter, M)
  % (Left) Preconditioned Conjugate Gradient method
	n = size(A, 1);
	if (nargin < 5) M = eye(n); endif
	x = zeros(n, 1);
	r = b - A * x;
	z = M \ r;        % Left preconditioning; MATLAB does not suggest saving inv(M)
	p = z;
	rho = r' * z;
	rn_stop = norm(r, 2) * res_tol;
	iter_cnt = 1;
	res_norm(iter_cnt) = norm(r);
	converged = 0;
	while ((iter_cnt < max_iter) && (res_norm(iter_cnt) > rn_stop))
		s = A * p;
		alpha = rho / (p' * s);
		x = x + alpha * p;
		r = r - alpha * s;
		rho_0 = rho;
		z = M \ r;
		rho = r' * z;
		beta = rho / rho_0;
		p = z + beta * p;
		iter_cnt = iter_cnt + 1;
		res_norm(iter_cnt) = norm(r, 2);
	endwhile
	if (res_norm(iter_cnt) <= rn_stop) converged = 1; endif
end