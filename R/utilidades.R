#' Suma de todos los valores de las columnas numericas del data frame
#'
#' Calcula la suma de la cantidad de valores validos como perdidos
#'
#' @param tabla Data frame con varias columnas numericas para cada muestra
#'
#' @param columnas Valor opcional `columnas` para filtrar por la(s) variable(s)
#' que se quieren analizar
#'
#' @return Data frame con el `n_validos` y `n_NAs` correspondiente a cada columna
#' @export

suma_valores = function(tabla, columnas=NULL) {

  columnas = as.character(columnas)

  lista_res = lapply(tabla[columnas], aux_suma)
  return(data.frame(do.call(rbind.data.frame,lista_res)))
}

#' Funcion auxiliar
#'
#' Ayuda a la funcion suma_valores() a calcular el numero de valores validos y NAs
#'
#' @param x lista de los valores dentro de la columna del data frame
#'
#' @return data frame con el `n_validos` y `n_NAs` que hay en una columna

aux_suma = function(x) {
  n_validos = 0
  n_NAs = 0
  for (i in seq_along(x)) {
    if(is.na(x[i]) || x[i] == 0) {
      n_NAs = n_NAs + 1
    } else if (!is.integer(x[i]) && !is.double(x[i])) {
      stop("Valores no validos")
    } else {
      n_validos = n_validos + 1
    }
  }
  resultado = c(n_validos, n_NAs)
  names(resultado) = c("n_validos", "n_NAs")
  return(as.data.frame(t(resultado)))
}

#' Calculo descriptivos del data frame
#'
#' Calcula los estadisticos descriptivos mas comunes de todas las columnas numericas
#' del data frame
#'
#' @param tabla Data frame con varias columnas numericas para cada muestra
#'
#' @param columnas Valor opcional `columnas` para filtrar por la(s) variable(s)
#' que se quieren analizar
#'
#' @return Data frame con los descriptivos (Media, Mediana, Desviacion, Minimo y Maximo)
#'
#' @export

cal_descript = function(tabla,columnas=NULL) {

  columnas = as.character(columnas)

  resultados = data.frame(
    Media = round(sapply(tabla[columnas], mean, na.rm = TRUE), digits = 3),
    Mediana = sapply(tabla[columnas], median, na.rm = TRUE),
    SD = round(sapply(tabla[columnas], sd, na.rm = TRUE),digits = 3),
    Min = sapply(tabla[columnas], min, na.rm = TRUE),
    Max = sapply(tabla[columnas], max, na.rm = TRUE)
  )

  return(resultados)
}

#' Calculo de frecuencias
#'
#' Calcula la frecuencia cn la que un elemento aparece en cada columna del Data frame
#'
#' @importFrom dplyr group_by tally
#'
#' @importFrom tidyr pivot_longer pivot_wider
#'
#' @importFrom magrittr %>%
#'
#' @param tabla Data frame con varias columnas numericas para cada muestra
#'
#' @param columnas Valor opcional `columnas` para filtrar por la(s) variable(s)
#' que se quieren analizar
#'
#' @return Data frame con la frecuencia que aparece cada elemento en cada columna
#'
#' @export

calc_freq = function(tabla,columnas) {

  columnas = as.character(columnas)

  resultado = tabla[columnas] %>%
    tidyr::pivot_longer(cols = everything(),values_to = "valores", values_drop_na = TRUE) %>%
    dplyr::group_by(name,valores) %>%
    dplyr::tally() %>%
    tidyr::pivot_wider(names_from = "name", values_from = n, values_fill = 0)

  return(as.data.frame(resultado))
}





