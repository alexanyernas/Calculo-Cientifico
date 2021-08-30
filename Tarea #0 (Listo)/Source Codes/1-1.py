"""
	Estudiante: Naranjo Sthory Alexanyer Naranjo
	Cédula de identidad: V - 26.498.600
	Asignatura: Cálculo Científico (6105)
	Tarea 0: Introducción al Cálculo Científico
	Ejercico 1.1
"""

from math import pi, exp, factorial

for n in range(1, 11):
	
	real_value = factorial(n)
	aux_value = ((2*pi*n)**0.5)*((n/exp(1))**n)

	absolute_error = abs(aux_value - real_value)
	relative_error = absolute_error/abs(real_value)

	print(f'\tFor N = {n}:')
	print(f'* Real value: {real_value}')
	print(f'* Approximate value: {aux_value}')
	print(f'* Absolute error: {absolute_error}')
	print(f'* Relative error: {relative_error}')
	print('----------')

"""
Observaciones:

	Apreciamos que mientras el valor de N va aumentando, el error absoluto
	se encuentra en un constante crecimiento, mientras que el error relativo
	a diferencia va disminuyendo con cada nuevo valor para N.
"""