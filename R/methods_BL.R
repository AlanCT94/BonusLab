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
  print(x$coefficients)
}
