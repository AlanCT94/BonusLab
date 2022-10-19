#' Print
#'
#'Print model call coefficients
#'
#' @param x Refers to the object return by ridge regression
#' @param ... argument to be passed to methods
#'
#' @return Coefficients
#' @export
#'
#' @examples data(iris)
#'           s<-ridgereg(formula=Petal.Length~Species, data=iris, 2)
#'           print(s)
print.ridgereg <- function(x, ...){
  cat("Call:")
  print(x$call)
  print(x$coefficients)
}

#' Predict
#'
#' @param x Refers to the object return by ridge regression
#' @param ... argument to be passed to methods
#'
#' @return fitted values
#' @export
#'
#' @examples data(iris)
#'           s<-ridgereg(formula=Petal.Length~Species, data=iris, 2)
#'           predict(s)
predict.ridgereg <- function(x, ...){
  print(x$fitted_values)
}

coef.ridgereg <- function(x, ...){
  print(x$coefficients)
}

