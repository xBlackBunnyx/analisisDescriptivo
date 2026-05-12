#' Tabla con los resultados descriptivos
#'
#' Agrupa los resultados de las otras funciones para mostrar todos los resultados
#' descriptivos con opcion a filtrarlos segun las necesidades del usuario
#'
#' @param tabla Data  frame a analizar con columnas numericas para las muestras
#' y columnas adicionales (numericas o caracteres) para filtrar
#'
#' @param columnas Valor opcional que corresponde con una lista con el nombre de
#' las columnas que se quieren analizar. Si no se proporciona un valor, se analizan
#' todas las columnas numericas
#'
#' @param nombre_col Valor opcional para filtrar los datos en base a la columna
#' deseada
#'
#' @param val_col Valor opcional para filtrar por el valor deseado de la columna
#' seleccionada previamente
#'
#' @return Objeto de clase `tabla_descript` que contiene la tabla con los
#' estadisticos descriptivos, la tabla de frecuencia, los parametros del analisis
#' y las advertencias (si fuera el caso)
#'
#' @export

tabla_descript = function(tabla, columnas = NULL, nombre_col = NULL, val_col = NULL) {

  advertencias = character()

  if (!is.data.frame(tabla)){
    stop("`tabla` debe ser un data frame")
  }

  if (any(!columnas %in% names(tabla))) {
    stop("Alguna(s) columna(s) no existe(n)")
  }

  if(is.null(columnas)) {
    columnas = names(tabla)[sapply(tabla, is.numeric)]
  }

  parametros_usados = list(
    columnas_analizadas = columnas,
    variable_filtrada = nombre_col,
    valor_filtrado = val_col
  )

  if(!is.null(nombre_col)){
    if(!nombre_col %in% names(tabla)) {
      stop("No existe la columna ", nombre_col)
    }
  }

  filter_tabla = tabla

  if (!is.null(nombre_col) && !is.null(val_col)) {
    filter_tabla = tabla[tabla[[nombre_col]] == val_col,  ,drop = FALSE]

    if (nrow(filter_tabla) == 0) {
      stop("No hay datos para la columna ", nombre_col, " y  el valor ", val_col)
    }
  }

  if (!is.null(nombre_col)) {
    grupos = unique(filter_tabla[[nombre_col]])
    resultados_grupo = lapply(grupos, function(g) {
      datos_grupo = filter_tabla[filter_tabla[[nombre_col]] == g, , drop = FALSE]

      func1 = suma_valores(filter_tabla,columnas)
      func2 = cal_descript(filter_tabla, columnas)
      func3 = calc_freq(filter_tabla,columnas)

      corrected_f1 = as.data.frame(t(func1))
      corrected_f2 = as.data.frame(t(func2))
      merge_corrected = rbind(corrected_f1,corrected_f2)

      resultado_final = tabla_descriptiva(
        resultados = list(descriptivos = merge_corrected,
                          frecuencias = func3),
        parametros = parametros_usados,
        advertencias = advertencias
      )

      return(resultado_final)
    })

    names(resultados_grupo) = paste(nombre_col,grupos, sep = "_")

    return(resultados = resultados_grupo)

  } else {
    func1 = suma_valores(filter_tabla,columnas)
    func2 = cal_descript(filter_tabla, columnas)
    func3 = calc_freq(filter_tabla,columnas)

    corrected_f1 = as.data.frame(t(func1))
    corrected_f2 = as.data.frame(t(func2))
    merge_corrected = rbind(corrected_f1,corrected_f2)
    resultado_final = tabla_descriptiva(
      resultados = list(descriptivos = merge_corrected,
                        frecuencias = func3),
      parametros = parametros_usados,
      advertencias = advertencias
    )
    return(resultado_final)
  }

}
