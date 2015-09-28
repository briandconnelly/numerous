#' Get information about the limits to API requests
#' 
#' Numerous limits the number of API requests per minute per user. If this limit
#' is exceeded, responses will contain response code 429.
#'
#' @return A list containing the per-minute limit, the number of requests
#' remaining, and the number of seconds until the count resets.
#' @importFrom httr headers
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' get_request_limits()
#' }
get_request_limits <- function()
{
    headers <- headers(numerous_GET(path=paste("users", "self", sep='/')))
    # TODO: turn this into a list with decent names
    res <- list(MaxRequests=headers[["x-rate-limit-limit"]],
                RequestsRemaining=headers[["x-rate-limit-remaining"]],
                TimeRemaining=headers[["x-rate-limit-reset"]])
    res
}
