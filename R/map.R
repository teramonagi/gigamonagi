#' Get geocode from address string.
#'
#' Get geocode from address string.
#'
#' @param address Character vector of address strings.
#'
#' @examples
#' address <- "285 Fulton St, New York"
#' geocode(address)
#'
#' @export
geocode <- function(address)
{
  single_query <- function(address){
    url <- "http://maps.googleapis.com/maps/api/geocode/json"
    response <- httr::GET(url, query = list(address=address, sensor="false", region="JP", language="ja"))
    content <- httr::content(response)
    unlist(content$results[[1]]$geometry$location)
  }
  result <- data.frame(t(sapply(address, single_query)))
  rownames(result) <- NULL
  result
}
