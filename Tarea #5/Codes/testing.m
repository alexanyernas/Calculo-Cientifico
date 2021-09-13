close all
clear all
clc

function graph(values_x, values_y)
  figure; 
  title('Testing for graph');
  plot(values_x, values_y);
  grid on
  xlabel('X');
  ylabel('Y');
endfunction

value_x = [];
value_y = [];

for i = 1:10
  value_x = [value_x; i];
  value_y = [value_y; i];
endfor

graph(value_x, value_y);