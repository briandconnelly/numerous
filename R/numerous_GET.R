#' Issue a GET call to the Numerous API server
#'
#' @param path The url path to be appended to the base API url
#' @param query Optional list of additional items to add to query
#' @param success_code The HTTP status code for successful responses (default: 200)
#'
#' @return The result of the GET
#' @seealso \code{\link{GET}}
#' @importFrom assertthat assert_that is.string
#' @importFrom httr GET status_code
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' result <- numerous_GET(path="users/self")
#' }
numerous_GET <- function(path, query=list(), success_code=200)
{
    assert_that(is.string(path))
    
    full_url <- paste(NUMEROUS_URL_BASE, path, sep='/')
    result <- GET(url=full_url, config=get_auth_header(get_numerous_key()),
                  query=query)
    
    if(status_code(result) != success_code)
    {
        stop(sprintf("Server returned code %d", status_code(result)))
    }
    result
}
