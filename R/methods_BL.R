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
  cat("", sep="\n\n")

  cat("Call:")

  cat("", sep="\n\n")

  print(x$call)

  cat("", sep="\n\n")

  cat("Coefficients:")
  cat("", sep="\n\n")
  print(x$coefficients)
}

#' Predict
#'
#' @param object Refers to the object return by ridge regression
#' @param ... argument to be passed to methods
#'
#' @return fitted values
#' @export
#'
#' @examples data(iris)
#'           s<-ridgereg(formula=Petal.Length~Species, data=iris, 2)
#'           predict(s)
predict.ridgereg <- function(object, ...){
  print(object$fitted_values)
}

#' B coefficients
#'
#' @param object Refers to the object return by ridge regression
#' @param ... argument to be passed to methods
#'
#' @return Coefficients
#' @export
#'
#' @examples data(iris)
#' s<-ridgereg(formula=Petal.Length~Species, data=iris, 2)
#' coef(s)
coef.ridgereg <- function(object, ...){
  print(object$coefficients)
}

