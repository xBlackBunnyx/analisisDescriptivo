#' Objeto S3 de resultados del analisis
#'
#' Constructor S3 que muestra los resultados de la funcion principal
#'
#' @param resultados Lista con los resultados de los analisis de la funcion
#' principal
#'
#' @param parametros Lista con los parametros usados durante el analisis
#'
#' @param advertencias Vector de caracteres con las advertencias producidas
#' durante el analisis (si las hubiera)
#'
#' @return Objeto de la clase tabla_descript
#'
#' @export

tabla_descriptiva = function(resultados, parametros, advertencias = character()) {
  resultado = list(
    tabla_descriptivos = resultados$descriptivos,
    tabla_frecuencias = resultados$frecuencias,
    parametros = parametros,
    advertencias = advertencias
  )
  class(resultado) = "tabla_descript"
  resultado
}


#' Impresion de los resultados de los analisis
#'
#' Metodo print para mostrar los resultados obtenidos de la funcion principal
#'
#' @param x Objeto de la clase tabla_descript
#'
#' @param ... Argumentos adicionales
#'
#' @return Devuelve de forma invisible el objeto x
#'
#' @export

print.tabla_descript = function(x,...) {
  cat("===============================\n")
  cat("Resultado del analisis:\n")
  cat("===============================\n")
  cat("\n")
  cat("Tabla Descriptivos\n")
  cat("--------------------------\n")
  print(x$tabla_descriptivos)
  cat("\n")
  cat("Tabla Frecuencias\n")
  cat("--------------------------\n")
  print(x$tabla_frecuencias)
  if (length(x$advertencias) > 0){
    cat("Advertencias: ")
    print(x$advertencias)
  }
  invisible(x)
}
