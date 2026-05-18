# analisisDescriptivo (es)

El objetivo de este paquete es hacer más fácil y automatizar el análisis de los estadísticos descriptivos más comunes (media, mediana, desviación estándar, mínimo y máximo), número de valores y número de NAs, así como una tabla de frecuencia para dichos valores.

El paquete está pensado para analizar todas las columnas numéricas si no se le especifica lo contrario, de la misma forma, también se le puede especificar las columnas que se quieran analizar y si se quiere filtrar por una columna en concreto, además se le puede especificar el valor por el que se quiere filtrar de dicha columna.

La función principal de este paquete es `tabla_descript()` que tiene como argumento obligatorio `tabla` que se corresponde con el data frame a analizar, así como los argumentos opcionales, `columnas`, `nombre_col` y `val_col`. El argumento `columnas` se corresponde con las columnas que queremos seleccionar para hacer el análisis estadístico; el argumento `nombre_col` se puede utilizar para filtrar por una columna en concreto (puede ser numérica o una cadena de caracteres); y `val_col` es el valor por el que queremos filtrar esa columna en concreto (puede ser un valor numérico o una cadena de caracteres)

## Instalación

Para instalar el paquete de forma local, es necesario introducir la ruta donde se encuentre el paquete en cuestion siguiendo el codigo que se muestra a continuación:

``` r
install.packages("/ruta_relativa_del_paquete/analisisDescriptivo.zip",repos = NULL, type = "source")
```

## Ejemplo de uso

A continuación, se muestra un ejemplo de como usar el paquete para hacer un analisis simple:

``` r
library(analisisDescriptivo)

# Usamos una semilla para que el codigo sea replicable
set.seed(33)

# Creamos un data frame de prueba para mostrar la utilidad del paquete
datos = data.frame(Grupo = c("AB","AB","AB","XZ","XZ","XZ"),
                             var1 = sample(1:5,6,replace = TRUE),
                             var2 = sample(1:5,6,replace = TRUE),
                             var3 = sample(1:5,6,replace = TRUE))

# Llamamos a la función tabla_descript() para que ejecute el analisis
tabla_descript(datos)

# Podemos también decirle las columnas que queremos analizar
tabla_descript(datos, c("var2", "var3"))

# Si queremos especificarle que queremos filtrar por una columna en concreto, es 
# necesario decirle primero las columnas que queremos analizar, o establecer el nombre
# del argumento. A continuación, se muestran ambas formas
tabla_descript(datos,c("var1","var2","var3"),"Grupo","AB")
tabla_descript(datos, c("var1","var2","var3"), nombre_col = "Grupo", val_col = "AB")

# Ambas formas deberian dar el mismo resultado final
# $Grupo_AB
# ===============================
# Resultado del analisis:
# ===============================
# 
# Tabla Descriptivos
# --------------------------
#            var1  var2
# n_validos 3.000 3.000
# n_NAs     0.000 0.000
# Media     3.000 2.333
# Mediana   2.000 2.000
# SD        1.732 1.528
# Min       2.000 1.000
# Max       5.000 4.000
# 
# Tabla Frecuencias
# --------------------------
#   valores var1 var2
# 1       2    2    1
# 2       5    1    0
# 3       1    0    1
# 4       4    0    1
```

# analisisDescriptivo (en)

The objective of the package is to make easier and automatize the descriptive statistical analysis (mean, median, standard deviation, minimum and maximum), number of valid values and number of NAs, as well as a frequency table for the given values.

The package is design to analyze all numeric columns from the data frame by default, besides you can also specify which column to analyze and which column to filter as well as the value from that column.

The main function of this package is `tabla_descript()` which mandatory argument is `tabla` that correspond with the data frame. It also has some optional argument such as `columnas`, `nombre_col` y `val_col`. The argument `columnas` corresponds with the columns we want to perform the statistical analysis; the argument `nombre_col` can be used to filter by one specific column (it can be a numeric or string column); and `val_col` is the optional value that we can use to filter that specific column (it can be a numeric or string value)

## Instalation

To install the package locally, you have to add the route where the package file is, following the next example:

``` r
install.packages("/route_to_the_package/analisisDescriptivo.zip",repos = NULL, type = "source")
```

## Example

Here there is an example of how to use the package to perform a simple analysis:

``` r
library(analisisDescriptivo)

# We use a seed so that the code is reproducible
set.seed(33)

# We create a dummy data frame
datos = data.frame(Grupo = c("AB","AB","AB","XZ","XZ","XZ"),
                             var1 = sample(1:5,6,replace = TRUE),
                             var2 = sample(1:5,6,replace = TRUE),
                             var3 = sample(1:5,6,replace = TRUE))

# We call the function tabla_descript() to perform the analysis
tabla_descript(datos)

# We can also specify the the columns to perform the analysis
tabla_descript(datos, c("var2", "var3"))

# If we want to specify which columns to filter, we can pass it as an argument
tabla_descript(datos,c("var1","var2","var3"),"Grupo","AB")
tabla_descript(datos, c("var1","var2","var3"), nombre_col = "Grupo", val_col = "AB")

# The expected result should be something like this:
# $Grupo_AB
# ===============================
# Resultado del analisis:
# ===============================
# 
# Tabla Descriptivos
# --------------------------
#            var1  var2
# n_validos 3.000 3.000
# n_NAs     0.000 0.000
# Media     3.000 2.333
# Mediana   2.000 2.000
# SD        1.732 1.528
# Min       2.000 1.000
# Max       5.000 4.000
# 
# Tabla Frecuencias
# --------------------------
#   valores var1 var2
# 1       2    2    1
# 2       5    1    0
# 3       1    0    1
# 4       4    0    1
```
