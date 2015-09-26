#' Issue a DELETE call to the Numerous API server
#'
#' @param path The url path to be appended to the base API url
#' @param success_code The HTTP status code for successful responses
#'
#' @return The result of the DELETE request
#' @importFrom assertthat assert_that is.string
#' @importFrom httr DELETE status_code
#' @export
#'
#' @examples
#' library(numerous)
#' result <- numerous_DELETE(path = "metrics/536616607175882007")
numerous_DELETE <- function(path, success_code=204)
{
    assert_that(is.string(path))
    
    full_url <- paste(NUMEROUS_URL_BASE, path, sep='/')
    result <- DELETE(url=full_url, config=get_auth_header(get_numerous_key()))
    
    if(status_code(result) != success_code)
    {
        stop(sprintf("Server returned code %d", status_code(result)))
    }
    result
}
