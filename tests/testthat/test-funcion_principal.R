testthat::test_that("tabla_descript() devuelve una tabla con los analisis para todas las columnas numericas",
                    {
                      datos = data.frame(Grupo = c("AB","AB","AB","XZ","XZ","XZ"),
                                         var1 = sample(1:5,6,replace = TRUE),
                                         var2 = sample(1:5,6,replace = TRUE),
                                         var3 = sample(1:5,6,replace = TRUE))

                      resultado = tabla_descript(datos)

                      expect_equal(names(resultado),
                                   c("tabla_descriptivos", "tabla_frecuencias",
                                     "parametros", "advertencias"))

                      expect_equal(resultado$parametros$columnas, c("var1","var2","var3"))
                    }
                    )


testthat::test_that("tabla_descript() devuelve una tabla con los analisis para las columnas seleccionadas",
                    {
                      datos = data.frame(Grupo = c("AB","AB","AB","XZ","XZ","XZ"),
                                         var1 = sample(1:5,6,replace = TRUE),
                                         var2 = sample(1:5,6,replace = TRUE),
                                         var3 = sample(1:5,6,replace = TRUE))

                      resultado = tabla_descript(datos, c("var1","var3"))

                      expect_equal(names(resultado),
                                   c("tabla_descriptivos", "tabla_frecuencias",
                                     "parametros", "advertencias"))

                      expect_equal(resultado$parametros$columnas, c("var1","var3"))
                    }
)


testthat::test_that("tabla_descript() falla si el nombre de la columna no existe",
                    {
                      datos = data.frame(Grupo = c("AB","AB","AB","XZ","XZ","XZ"),
                                         var1 = sample(1:5,6,replace = TRUE),
                                         var2 = sample(1:5,6,replace = TRUE),
                                         var3 = sample(1:5,6,replace = TRUE))

                      expect_error(tabla_descript(datos,c("var1","var4")),
                                   "Alguna(s) columna(s) no existe(n)", fixed=TRUE)
                    }
)

testthat::test_that("tabla_descript() falla si el nombre de la columna filtro no existe",
                    {
                      datos = data.frame(Grupo = c("AB","AB","AB","XZ","XZ","XZ"),
                                         var1 = sample(1:5,6,replace = TRUE),
                                         var2 = sample(1:5,6,replace = TRUE),
                                         var3 = sample(1:5,6,replace = TRUE))

                      expect_error(tabla_descript(datos,c("var1","var2"),"var4"),
                                   "No existe la columna var4", fixed=TRUE)
                    }
)


testthat::test_that("tabla_descript() falla si no se le pasa un numero valido",
                    {
                      datos = data.frame(Grupo = c("AB","AB","AB","XZ","XZ","XZ"),
                                         var1 = LETTERS[1:6])

                      expect_error(tabla_descript(datos,"var1"),
                                   "Valores no validos", fixed=TRUE)
                    }
)


testthat::test_that("tabla_descript() falla si no se le pasa un data frame",
                    {
                      datos = sample(1:5,6,replace = TRUE)

                      expect_error(tabla_descript(datos),
                                   "`tabla` debe ser un data frame", fixed=TRUE)
                    }
)
