"""
	Estudiante: Naranjo Sthory Alexanyer Naranjo
	Cédula de identidad: V - 26.498.600
	Asignatura: Cálculo Científico (6105)
	Tarea 0: Introducción al Cálculo Científico
	Ejercico 1.2
"""

"""
	My system use:
		1 bit for the sign,
		11 bits for the exponent,
		and 52 bits for the mantissa.
"""

try:
	# ofl = (2**(1023+1)) * (1-(2**-53)) -> OverflowError 
	ufl = (2**-1022)
	e_mach_chopping = 2**(1-53)
	e_mach_rounding_to_nearest = 0.5*(2**(1-53))
	print(f'* Underflor level (UFL) = {ufl}')
	print('* Overflow level (OFL) = Miscalculation')
	print(f'* Unit Roundoff (E mach) with chopping = {e_mach_chopping}')
	print(f'* Unit Roundoff (E mach) with rounding to nearest = {e_mach_rounding_to_nearest}')
except OverflowError:
	print('Fatal error in calculations')
