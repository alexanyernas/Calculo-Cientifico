"""
	Estudiante: Naranjo Sthory Alexanyer Naranjo
	Cédula de identidad: V - 26.498.600
	Asignatura: Cálculo Científico (6105)
	Tarea 0: Introducción al Cálculo Científico
	Ejercico 1.9
"""

from math import factorial, exp

def myExp( x, n = 20 ):
    aux_value = 0.0
    flag = True
    
    if x < 0:
        flag = False
        x *= -1

    for i in range(n+1):
        aux_value += ((x**(i))/factorial(i))

    return aux_value if flag else (1/aux_value)

def testing():
    values = [1, -1, 5, -5, 10, -10, 15, -15, 20, -20]
    for value in values:
        print(f'\tTesting with x = {value}')
        print(f'* Real value: {exp(value)}')
        print(f'* Approximate value: {myExp(value)}')
        print('----------')

testing()