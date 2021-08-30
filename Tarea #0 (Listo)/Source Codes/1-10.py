"""
	Estudiante: Naranjo Sthory Alexanyer Naranjo
	Cédula de identidad: V - 26.498.600
	Asignatura: Cálculo Científico (6105)
	Tarea 0: Introducción al Cálculo Científico
	Ejercico 1.10
"""
def roots(a, b, c)->tuple:

	determinant_value = b*b - 4*a*c

	if a == 0 or c == 0:
		return None
	else:
		if determinant_value == 0:
			root1 = -b / 2*a
			root2 = -b / 2*a
			return root1, root2

		if determinant_value > 0:
			root1 = (-b + ((b*b - 4*a*c)**0.5))/(2*a)
			root2 = (-b - ((b*b - 4*a*c)**0.5))/(2*a)
			return root1, root2

		if determinant_value < 0:
			root1 = -b/(2*a)
			root2 = (-determinant_value**0.5)/(2*a)	
			return root1, root2

def run(a, b, c):
	results = roots(a, b, c)

	if results:
		print(f'* Root 1: {results[0]}')
		print(f'* Root 2: {results[1]}')
	else:
		print('* Fail to calculate roots')

def testing():
	test1 = [6, 5, -4]
	test2 = [6*(10**30), 5*(10**30), -4*(10**30)]
	test3 = [0, 1, 1]
	test4 = [1, -10**5, 1]
	test5 = [1, -4, 3.999999]
	test6 = [10**-30, -10**30, 10**30]

	print('\tTest #1')
	print('* Coefficients: a = 6, b = 5, c = -4')
	run(test1[0], test1[1], test1[2])
	print('----------')
	
	print('\tTest #2')
	print('* Coefficients: a = 6*10^30, b = 5*10^30, c = -4*10^30')
	run(test2[0], test2[1], test2[2])
	print('----------')

	print('\tTest #3')
	print('* Coefficients: a = 0, b = 1, c = 1')
	run(test3[0], test3[1], test3[2])
	print('----------')

	print('\tTest #4')
	print('* Coefficients: a = 1, b = -10^5, c = 1')
	run(test4[0], test4[1], test4[2])
	print('----------')

	print('\tTest #5')
	print('* Coefficients: a = 1, b = -4, c = 3.999999')
	run(test5[0], test5[1], test5[2])
	print('----------')

	print('\tTest #6')
	print('* Coefficients: a = 10^-30, b = -10^30, c = 10^30')
	run(test6[0], test6[1], test6[2])
	print('----------')

testing()