"""
	Estudiante: Naranjo Sthory Alexanyer Naranjo
	Cédula de identidad: V - 26.498.600
	Asignatura: Cálculo Científico (6105)
	Tarea 0: Introducción al Cálculo Científico
	Ejercico 1.6
"""
def methodOne():
	print('\t*** METHOD #1 ***\n')
	a = 0
	b = 1
	n = 100000
	h = b/n
	x = a
	for i in range(1,n+1):
		x = x+h
	print(f'* Value of x using the method one: {x}')

def methodTwo():
	print('\n\t*** METHOD #2 ***\n')
	a = 0
	b = 1
	n = 100000
	h = b/n
	for i in range(n+1):
		x = a + i*h
	print(f'* Value of x using the method two: {x}')

# Difference between them
methodOne()
methodTwo()

"""
Observaciones:

(a) Se considera como mejor el segundo método dado a que hay muy poco margen de error, 
    ya que solo tenemos que hacer el cálculo dos (2) veces, primero el calculo 
	de la multiplicación y luego el correspondiente de la suma. Considerando que la suma
	se realiza en cada iteracción por N veces.
"""