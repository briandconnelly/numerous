#' Issue a DELETE call to the Numerous API server
#'
#' @param path The url path to be appended to the base API url
#'
#' @return The result of the DELETE request
#' @importFrom assertthat assert_that is.string
#' @importFrom httr DELETE status_code http_status
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' result <- numerous_DELETE(path = "metrics/536616607175882007")
#' }
numerous_DELETE <- function(path)
{
    assert_that(is.string(path))
    
    full_url <- paste(NUMEROUS_URL_BASE, path, sep='/')
    result <- DELETE(url=full_url, config=get_auth_header(get_numerous_key()))
    code <- status_code(result)

    if (floor(code / 100) %in% c(4,5)) stop(sprintf("Server returned %s",
                                                    http_status(code)$message))
    result
}
