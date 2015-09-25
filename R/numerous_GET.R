#' Issue a GET call to the Numerous API server
#'
#' @param path The url path to be appended to the base API url
#' @param query Optional list of additional items to add to query
#'
#' @return The result of the GET
#' @seealso \code{\link{GET}}
#' @importFrom assertthat assert_that is.scalar is.string
#' @importFrom httr GET status_code
#' @export
#'
#' @examples
#' library(numerous)
#' result <- numerous_GET(path="users/self")
numerous_GET <- function(path, query=list())
{
    assert_that(is.scalar(path))
    assert_that(is.string(path))
    
    full_url <- paste(NUMEROUS_URL_BASE, path, sep='/')
    result <- GET(url=full_url, config=get_auth_header(APP_KEY), query=query)
    
    if(status_code(result) != 200)
    {
        stop(sprintf("Server returned code %d", status_code(result)))
    }
    result
}
