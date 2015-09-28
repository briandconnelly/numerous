#' Issue a POST call to the Numerous API server
#'
#' @param path The url path to be appended to the base API url
#' @param body A list containing the data to be sent
#'
#' @return The result of the POST
#' @seealso \code{\link{POST}}
#' @importFrom assertthat assert_that is.string
#' @importFrom httr POST status_code http_status
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' result <- numerous_POST(path="users/self", body=list(TODO))
#' }
numerous_POST <- function(path, body)
{
    assert_that(is.string(path))
    assert_that(is.list(body))
    
    full_url <- paste(NUMEROUS_URL_BASE, path, sep='/')
    result <- POST(url=full_url, config=get_auth_header(get_numerous_key()),
                   body=body, encode="json")
    code <- status_code(result)
        
    if (floor(code / 100) %in% c(4,5)) stop(sprintf("Server returned %s",
                                                    http_status(code)$message))
    result
}
