#' Issue a GET call to the Numerous API server
#'
#' @param path The url path to be appended to the base API url
#' @param query Optional list of additional items to add to query
#'
#' @return The result of the GET
#' @seealso \code{\link{GET}}
#' @importFrom assertthat assert_that is.string
#' @importFrom httr GET status_code http_status
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' result <- numerous_GET(path="users/self")
#' }
numerous_GET <- function(path, query=list())
{
    assert_that(is.string(path))
    
    full_url <- paste(NUMEROUS_URL_BASE, path, sep='/')
    result <- GET(url=full_url, config=get_auth_header(get_numerous_key()),
                  query=query)
    code <- status_code(result)
    
    if (floor(code / 100) %in% c(4,5)) stop(sprintf("Server returned %s",
                                                    http_status(code)$message))
    result
}
