#' Issue a DELETE call to the Numerous API server
#'
#' @param path 
#'
#' @return The result of the DELETE request
#' @importFrom assertthat assert_that is.scalar is.string
#' @importFrom httr DELETE status_code
#' @export
#'
#' @examples
#' library(numerous)
#' result <- numerous_DELETE(path = "metrics/536616607175882007")
numerous_DELETE <- function(path)
{
    assert_that(is.scalar(path))
    assert_that(is.string(path))
    
    full_url <- paste(NUMEROUS_URL_BASE, path, sep='/')
    result <- DELETE(url=full_url, config=get_auth_header(APP_KEY))
    
    if(status_code(result) != 204)
    {
        stop(sprintf("Server returned code %d", status_code(result)))
    }
    result
}
