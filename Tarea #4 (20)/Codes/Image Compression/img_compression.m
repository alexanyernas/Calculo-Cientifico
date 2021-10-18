% Estudiante: Naranjo Sthory Alexanyer Antonio
% Cedula de identidad: V - 26.498.600
% Asignatura: Calculo Cientifico (6105)
% Tarea 4: Descomposicion en valores singulares (SVD)
% Compresion de imagenes

close all
clear all
clc

function img_compressor
  %reading and converting the image
  inImage = imread('me.jpg');
  inImage = rgb2gray(inImage);
  inImageD = double(inImage);
  % decomposing the image using singular value decomposition
  [U,S,V] = svd(inImageD);
  % Using different number of singular values (diagonal of S) to compress and
  % reconstruct the image
  dispEr = [];
  numSVals = [];
  for N = 5:25:200
      % store the singular values in a temporary var
      C = S;
      % discard the diagonal values not required for compression
      C(N+1:end,:) = 0;
      C(:,N+1:end) = 0;
      % Construct an Image using the selected singular values
      D = U*C*V';
      % display and compute error
      figure;
      buffer = sprintf('Image output using %d singular values', N)
      imshow(uint8(D));
      title(buffer);
      error = sum(sum((inImageD-D).^2));
      % store vals for display
      dispEr = [dispEr; error];
      numSVals = [numSVals; N];
  endfor
  error_graph(numSVals, dispEr)
endfunction

function error_graph(numSVals, dispEr)
  % dislay the error graph
  figure; 
  title('Error in compression');
  plot(numSVals, dispEr);
  grid on
  xlabel('Number of Singular Values used');
  ylabel('Error between compress and original image');
endfunction

function main
  img_compressor()
endfunction

main()