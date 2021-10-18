% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 4: Descomposicion en valores singulares (SVD)
% Respuesta 4.3

function drawVectors(A)
  % Find SVD
  [U,S,V] = svd(A); 
  S = diag(S);
  th = 0:2*pi/256:2*pi;
  % Define points on unit circle and image
  dom = [cos(th); sin(th)]; 
  ran = A*dom; 

  subplot(1,2,1)
  plot(dom(1,:),dom(2,:),"."),axis("image"),grid,hold
  quiver(0,0,V(1,1), V(2,1))
  quiver(0,0,V(1,2), V(2,2))
  title("Right Singular Vectors")

  subplot(1,2,2)
  plot(ran(1,:),ran(2,:),"r."),axis("image"),grid,hold
  quiver(0,0,S(1)*U(1,1),S(1)*U(2,1))
  % Check that singular value is nonzero
  if (abs(S(2)) > 10e-10)
    quiver(0,0,S(2)*U(1,2),S(2)*U(2,2))
  endif
  title("Image & Left Singular Vector(s)")
endfunction

function main
  % Matrix 3.7
  A = [1 2; 0 2];
  % Matrices of exercise 4.1
  %A = [3 0; 0 -2];
  %A = [2 0; 0 3];
  %A = [1 1; 0 0];
  %A = [1 1; 1 1];
  drawVectors(A);
endfunction

main()