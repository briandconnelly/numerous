#' Issue a POST call to the Numerous API server
#'
#' @param path The url path to be appended to the base API url
#' @param body A list containing the data to be sent
#'
#' @return The result of the POST
#' @seealso \code{\link{POST}}
#' @importFrom assertthat assert_that is.string
#' @importFrom httr POST status_code
#' @export
#'
#' @examples
#' library(numerous)
#' result <- numerous_POST(path="users/self", body=list(TODO))
numerous_POST <- function(path, body)
{
    assert_that(is.string(path))
    assert_that(is.list(body))
    
    full_url <- paste(NUMEROUS_URL_BASE, path, sep='/')
    result <- POST(url=full_url, config=get_auth_header(APP_KEY), body=body,
                   encode="json")
        
    if(status_code(result) != 201)
    {
        stop(sprintf("Server returned code %d", status_code(result)))
    }
    result
}
