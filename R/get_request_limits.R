#' Get information about the limits to API requests
#' 
#' Numerous limits the number of API requests per minute per user. If this limit
#' is exceeded, responses will contain response code 429.
#'
#' @return A vector containing the per-minute limit, the number of requests
#' remaining, and the number of seconds until the count resets.
#' @importFrom httr headers
#' @export
#'
#' @examples
#' library(numerous)
#' get_request_limits()
#' 
get_request_limits <- function()
{
    headers <- headers(numerous_GET(path=paste("users", "self", sep='/')))
    c(headers[["x-rate-limit-limit"]], headers[["x-rate-limit-remaining"]],
      headers[["x-rate-limit-reset"]])
}