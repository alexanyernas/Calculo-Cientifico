"""
	Estudiante: Naranjo Sthory Alexanyer Naranjo
	Cédula de identidad: V - 26.498.600
	Asignatura: Cálculo Científico (6105)
	Tarea 0: Introducción al Cálculo Científico
	Ejercico 1.5
"""

from math import exp, log

# Consider the function
# f(x) = (e^x - 1)/x

# Method #1 
def methodOne():
	print('\t*** METHOD #1 ***\n')
	for k in range(1, 17):
		
		aux_value = (exp(10**-k)-1)/(10**-k)
		
		print(f'\tFor K = {k}')
		print(f'* Approximate value: {aux_value}')
		print('----------')

# Method #2 ( Question (c) )
def methodTwo():
	print('\n\t*** METHOD #2 ***\n')
	for k in range(1, 17):
		
		try:
			aux_value = (exp(10**-k)-1)/log(exp(10**-k))
			
			print(f'\tFor K = {k}')
			print(f'Approximate value: {aux_value}')
			print('----------')

		except ZeroDivisionError: 
			print(f'\tFor K = {k}')
			print(f'Approximate value: NaN')
			print('----------')
			
# Difference between them
methodOne()
methodTwo()