"""
	Estudiante: Naranjo Sthory Alexanyer Naranjo
	Cédula de identidad: V - 26.498.600
	Asignatura: Cálculo Científico (6105)
	Tarea 0: Introducción al Cálculo Científico
	Ejercico 1.4
"""

from math import exp

# e = 2.718281828459045 (approximately)
real_value = exp(1)

for k in range(1, 21):

	# Considering n = 10**k
	aux_value = (1 + 1/(10**k))**(10**k)

	absolute_error = abs(aux_value - real_value)
	relative_error = absolute_error/abs(real_value)
	
	print(f'\tFor K = {k}')
	print(f'* Real value: {real_value}')
	print(f'* Approximate value: {aux_value}')
	print(f'* Absolute error: {absolute_error}')
	print(f'* Relative error: {relative_error}')
	print('----------')

"""
	Observaciones:

		Con cada iteracción, se aprecia en los resultados que mientras el valor de N
		va incrementando, el valor del error disminuye considerablemente, esto lo 
		podemos apreciar dado a que se imprime por pantalla tanto el resultado del calculo
		para el error relativo como absoluto. Detalladamente, el error relativo disminuye con 
		cada nuevo valor para N, recordando que N = 10^k, con k = 1,2,...,20. 

		También sucede un acontencimiento interesante y es que a partir de k = 16 en adelante, se 
		genera lo que sería un Underflow y se imprime como resultado 1.0 para los próximo valores de k y 
		recordando que el Underflow no genera una interrupción en la ejecución del programa como lo haría
		un error por Overflow y por ello, se imprime como resultado del calculo 1.0 dado a que el sistema 
		indica como resultado al generarse el Underflow, este valor.
"""