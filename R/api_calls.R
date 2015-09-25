#' Issue a GET call to the Numerous API server
#'
#' @param path The url path to be appended to the base API url
#'
#' @return THe result of the GET
#' @seealso \code{\link{GET}}
#' @importFrom assertthat assert_that is.scalar is.string
#' @importFrom httr GET status_code
#' @export
#'
#' @examples
#' library(numerous)
#' result <- numerous_get(path="users/self")
numerous_GET <- function(path)
{
    assert_that(is.scalar(path))
    assert_that(is.string(path))
    
    full_url <- paste(NUMEROUS_URL_BASE, path, sep='/')
    result <- GET(url=full_url, config=get_auth_header(APP_KEY))
    
    if(status_code(result) != 200)
    {
        stop(sprintf("Server returned code %d", status_code(result)))
    }
    result
}
