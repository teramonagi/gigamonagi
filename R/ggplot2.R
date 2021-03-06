#' Get 10^x format expression for ggplot2 label
#'
#' Get 10^x format expression for ggplot2 label
#'
#' @param x numeric vector
#'
#' @examples
#' \dontrun{
#' df <- data.frame(x=10^(-2:1),y=10^(-2:1))
#' ggplot(df, aes(x, y)) +
#'   geom_point() +
#'   scale_x_continuous(label=scientific_10) +
#'   scale_y_continuous(label=scientific_10)
#' }
#'
#' @export
scientific_10 <- function(x)
{
  index_zero <- which(x == 0)
  label <- scales::scientific_format()(x)
  label <- stringr::str_replace(label, "e", " %*% 10^")
  label <- stringr::str_replace(label, "\\^\\+", "\\^")
  label[index_zero] <- "0"
  parse(text=label)
}
