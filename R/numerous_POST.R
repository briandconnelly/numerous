#' Issue a POST call to the Numerous API server
#'
#' @param path The url path to be appended to the base API url
#' @param body A list containing the data to be sent
#' @param success_code The HTTP status code for successful responses (default: 201)
#'
#' @return The result of the POST
#' @seealso \code{\link{POST}}
#' @importFrom assertthat assert_that is.string
#' @importFrom httr POST status_code
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' result <- numerous_POST(path="users/self", body=list(TODO))
#' }
numerous_POST <- function(path, body, success_code=201)
{
    assert_that(is.string(path))
    assert_that(is.list(body))
    
    full_url <- paste(NUMEROUS_URL_BASE, path, sep='/')
    result <- POST(url=full_url, config=get_auth_header(get_numerous_key()),
                   body=body, encode="json")
        
    if(status_code(result) != success_code)
    {
        stop(sprintf("Server returned code %d", status_code(result)))
    }
    result
}
