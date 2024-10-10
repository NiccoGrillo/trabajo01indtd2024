# Problema 1 --------------------
source("teoriadecision_funciones_incertidumbre.R")

# Creamos la matriz de decisión
# Las filas representan las alternativas de decisión (d1, d2, d3)
# Las columnas representan los posibles estados del mundo (e1, e2, e3)
X <- matrix(c(20, 10, -5, 15, 12, 0, 8, 5, 3), nrow = 3, ncol = 3, byrow = TRUE)
colnames(X) <- c('e1', 'e2', 'e3')
rownames(X) <- c('d1', 'd2', 'd3')

# Aplicamos el criterio de Wald (Pesimista)
# Este criterio busca minimizar la peor pérdida posible
resultado_wald = criterio.Wald(X, favorable = TRUE)
print(resultado_wald)

#Ahora escenario desfavorable
resultado_wald_desfavorable = criterio.Wald(X, favorable = FALSE)
print(resultado_wald_desfavorable)

# Aplicamos el criterio Optimista (Maximax)
# Este criterio selecciona la alternativa con el mejor resultado posible
resultado_optimista = criterio.Optimista(X, favorable = TRUE)
print(resultado_optimista)

#Ahora escenario desfavorable
resultado_optimista_desfavorable = criterio.Optimista(X, favorable = FALSE)
print(resultado_optimista_desfavorable)

# Aplicamos el criterio de Hurwicz
# alfa es el parámetro de optimismo (0.3 en este caso)
resultado_hurwicz = criterio.Hurwicz(X, alfa = 0.3, favorable = TRUE)
print(resultado_hurwicz)

#Ahora escenario desfavorable
resultado_hurwicz_desfavorable = criterio.Hurwicz(X, alfa = 0.3, favorable = FALSE)
print(resultado_hurwicz_desfavorable)

# Aplicamos el criterio de Savage (minimización del arrepentimiento)
# Este criterio minimiza el arrepentimiento por no haber elegido la mejor opción
resultado_savage = criterio.Savage(X, favorable = TRUE)
print(resultado_savage)

#Ahora escenario desfavorable
resultado_savage_desfavorable = criterio.Savage(X, favorable = FALSE)
print(resultado_savage_desfavorable)

# Aplicamos el criterio de Laplace (asume que todos los estados son igualmente probables)
resultado_laplace = criterio.Laplace(X, favorable = TRUE)
print(resultado_laplace)

#Ahora escenario desfavorable
resultado_laplace_desfavorable = criterio.Laplace(X, favorable = FALSE)
print(resultado_laplace_desfavorable)

# Aplicamos el criterio del Punto Ideal (selecciona la alternativa más cercana al punto ideal)
resultado_puntoideal = criterio.PuntoIdeal(X, favorable = TRUE)
print(resultado_puntoideal)

#Ahora escenario desfavorable
resultado_puntoideal_desfavorable = criterio.PuntoIdeal(X, favorable = FALSE)
print(resultado_puntoideal_desfavorable)





## Extra:  Gráfico de los resultados del criterio de Hurwicz para diferentes valores de alfa ########
# Definimos el rango de valores de alfa (de 0 a 1)
valores_alfa = seq(0, 1, by = 0.1)

# Inicializamos vectores para almacenar los resultados
hurwicz_valores = numeric(length(valores_alfa))
alternativa_optima = numeric(length(valores_alfa))

# Aplicamos el criterio de Hurwicz para cada valor de alfa
for (i in seq_along(valores_alfa)) {
    resultado_hurwicz = criterio.Hurwicz(X, alfa = valores_alfa[i], favorable = TRUE)
    hurwicz_valores[i] = resultado_hurwicz$ValorOptimo
    alternativa_optima[i] = resultado_hurwicz$AlternativaOptima
}

# Dibujamos el gráfico de los resultados
plot(valores_alfa, hurwicz_valores, type = "o", col = "blue", lwd = 2,
     xlab = expression(alpha), ylab = "Valor del criterio de Hurwicz",
     main = "Resultados del criterio de Hurwicz para diferentes valores de alfa")

# Añadimos texto para mostrar la alternativa óptima en cada punto
for (i in seq_along(valores_alfa)) {
    text(valores_alfa[i], hurwicz_valores[i], labels = paste("d", alternativa_optima[i], sep=""), pos = 3)
}
#entonces, el criterio de Hurwicz selecciona la alternativa d3 para valores de alfa menores a 0.2, la alternativa d2 para valores de alfa mayores a 0.2
#y menores a 0.4, y la alternativa d1 para valores de alfa mayores a 0.4







# Problema 2 ----------------------------
# Definir la tabla de decisión con los valores del caso real
X <- matrix(c(250, 200, 100, 10, 400, 300, 150, -20, 500, 350, 200, -50, 600, 400, 250, -100),
            nrow = 4, ncol = 4, byrow = TRUE)
colnames(X) <- c('e1', 'e2', 'e3', 'e4')
rownames(X) <- c('d1', 'd2', 'd3', 'd4')

# Cargar las funciones del archivo proporcionado (teoriadecision_funciones_incertidumbre_nuevo.R)
# source('teoriadecision_funciones_incertidumbre_nuevo.R')

# Aplicar todos los criterios de decisión bajo incertidumbre utilizando la función 'criterio.Todos'
resultado_todos <- criterio.Todos(X, alfa = 0.3, favorable = TRUE)

# Imprimir la tabla con los resultados de todos los criterios
print(resultado_todos)

# Conclusión basada en los resultados
cat("Conclusión del problema 2:\n")
cat("Basado en los resultados obtenidos, la alternativa d4 parece ser la mejor opción en la mayoría de los métodos evaluados. En el criterio de Wald (Pesimista), Optimista, y Punto Ideal, d4 es la alternativa óptima. Aunque en el criterio de Hurwicz y Laplace se destacan otras alternativas, d4 tiene un buen rendimiento general y es la recomendación más consistente.\n")
