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

#' Does each column in a data.frame have NA
#'
#' Does each column in a data.frame have NA
#'
#' @param df data.frame
#'
#' @examples
#' df <- data.frame(a=1:3, b=5:7, c=c(NA, 1:2))
#' has_na(df)
#'
#' @export
has_na <- function(df)
{
  apply(df, 2, function(x){any(is.na(x))})
}
