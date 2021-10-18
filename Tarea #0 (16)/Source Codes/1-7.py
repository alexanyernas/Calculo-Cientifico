"""
	Estudiante: Naranjo Sthory Alexanyer Naranjo
	Cédula de identidad: V - 26.498.600
	Asignatura: Cálculo Científico (6105)
	Tarea 0: Introducción al Cálculo Científico
	Ejercico 1.7
"""

# IMPORTANTE: Utilicé el módulo de MATPLOTLIB para generar la gráfica del error
# para cada fórmula utilizada en el calculo de las derivadas.
# En dado caso, tendrá que instalar dicho módulo con el comando: pip install matplotlib 
# Espero que no haya ningún inconveniente con este detalle.

import math # importing various math functions
import matplotlib.pyplot as plt

def methodOne():
   x = 1 # x value
   h = [] # variable to store various h value
   err = [] # variable to store error corresponding to h
   
   for k in range(0,49): # loop calculate error for each h
      h = h+[ 1/math.pow(2,k+1)] # calculating the value of h
      df = (math.sin(x+h[k])-math.sin(x))/h[k] # finding the derivative
      err = err + [math.fabs(df-math.cos(x))] # Calculating the error
   
   fig, ax = plt.subplots()
   ax.loglog(h,err) # ploting the result
   plt.xlabel('h')
   plt.ylabel('Err')
   plt.show()
   
   for k in range(0,49): # loop to findh corresponding to minimum err
      if err[k] == min(err):
         H = h[k]
   
   ApproxH = math.sqrt(math.fabs(3.0*(4.0/3.0-1.0)-1.0))*math.fabs(x) # rule of thumb expression

   print('\t***METHOD #1***')
   print (f'* H corresponding to minumum error = {H}') # printing the results
   print (f'* Rule of thumb H = {ApproxH}')
   print('---------')

def methodTwo():
   x = 1 # x value
   h = [] # variable to store various h value
   err = [] # variable to store error corresponding to h
   
   for k in range(0,49): # loop calculate error for each h
      h = h+[ 1/math.pow(2,k+1)] # calculating the value of h
      df = (math.sin(x+h[k])-math.sin(x-h[k]))/(2*h[k]) # finding the derivative
      err = err + [math.fabs(df-math.cos(x))] # Calculating the error
   
   fig, ax = plt.subplots()
   ax.loglog(h,err) # ploting the result
   plt.xlabel('h')
   plt.ylabel('Err')
   plt.show()

   for k in range(0,49): # loop to findh corresponding to minimum err
      if err[k] == min(err):
         H = h[k]
   
   ApproxH = math.sqrt(math.fabs(3.0*(4.0/3.0-1.0)-1.0))*math.fabs(x) # rule of thumb expression

   print('\t***METHOD #2***')
   print (f'* H corresponding to minumum error = {H}') # printing the results
   print (f'* Rule of thumb H = {ApproxH}')
   print('---------')

methodOne()
methodTwo()