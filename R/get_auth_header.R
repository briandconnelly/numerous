#' Build a string for numerous API authentication
#'
#' @param api_key The Numerous API key. This can be found in the Numerous mobile apps under Settings > Developer Info.
#'
#' @return A HTTP request object that contains the Authorization header
#' @seealso \code{\link{add_headers}}
#' @importFrom assertthat assert_that is.string
#' @importFrom base64enc base64encode
#' @importFrom httr add_headers
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' h <- get_auth_header(api_key = "nmrs_S7ZEna7Pmjg7")
#' }
get_auth_header <- function(api_key)
{
    assert_that(is.string(api_key))
    
    auth_str <- paste("Basic", base64encode(charToRaw(paste0(api_key, ':'))))
    add_headers(Authorization=auth_str)
}
