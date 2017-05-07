#' A more general test of an object being interpretable as numbers.
#'
#' A more general test of an object being interpretable as numbers.
#'
#' @param x	Character vector of values to parse.
#' @param na	Boolean. It determines wether NA is regarded as TRUE/FALSE.
#'
#' @examples
#' x <- c(1, 2, NA, "AAA", "123")
#' is_numeric(x)
#'
#' @export
is_numeric <- function(x, na = FALSE)
{
  result <- rep(na, length(x))
  index_na <- is.na(x)
  result[!index_na] <- suppressWarnings(!is.na(as.numeric(x[!index_na])))
  result
}
