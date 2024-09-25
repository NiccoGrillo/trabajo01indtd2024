# Cargamos las funciones necesarias
source("teoriadecision_funciones_incertidumbre.R")

# Creamos la matriz de decisión
# Las filas representan las alternativas de decisión (d1, d2, d3)
# Las columnas representan los posibles estados del mundo (e1, e2, e3)
X = matrix(c(10, 2, -5, 8, 4, -1, 6, 5, 3), nrow = 3, ncol = 3, byrow = TRUE)
colnames(X) = c('e1', 'e2', 'e3')
rownames(X) = c('d1', 'd2', 'd3')

# Aplicamos el criterio de Wald (Pesimista)
# Este criterio busca minimizar la peor pérdida posible
resultado_wald = criterio.Wald(X, favorable = TRUE)

# Aplicamos el criterio Optimista (Maximax)
# Este criterio selecciona la alternativa con el mejor resultado posible
resultado_optimista = criterio.Optimista(X, favorable = TRUE)

# Aplicamos el criterio de Hurwicz
# alfa es el parámetro de optimismo (0.3 en este caso)
resultado_hurwicz = criterio.Hurwicz(X, alfa = 0.3, favorable = TRUE)

# Aplicamos el criterio de Savage (minimización del arrepentimiento)
# Este criterio minimiza el arrepentimiento por no haber elegido la mejor opción
resultado_savage = criterio.Savage(X, favorable = TRUE)

# Aplicamos el criterio de Laplace (asume que todos los estados son igualmente probables)
resultado_laplace = criterio.Laplace(X, favorable = TRUE)

# Aplicamos el criterio del Punto Ideal (selecciona la alternativa más cercana al punto ideal)
resultado_puntoideal = criterio.PuntoIdeal(X, favorable = TRUE)

# Mostramos los resultados para cada criterio
print(resultado_wald)
print(resultado_optimista)
print(resultado_hurwicz)
print(resultado_savage)
print(resultado_laplace)
print(resultado_puntoideal)

# Resumimos todos los criterios en una única tabla
resultado_resumen = criterio.Todos(X, alfa = 0.3, favorable = TRUE)
print(resultado_resumen)
