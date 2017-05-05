#' A more general test of an object being interpretable as numbers.
#'
#' A more general test of an object being interpretable as numbers.
#'
#' @param x	Character vector of values to parse.
#' @param na	Character vector of strings to use for missing values.
#'   Set this option to \code{character()} to indicate no missing values.
#'
#' @examples
#' x <- c(1, 2, NA, "AAA", "123")
#' is_numeric(x)
#'
#' @export
is_numeric <- function(x, na = c("", "NA"))
{
  suppressWarnings(!is.na(readr::parse_number(x, na=na)))
}
