#' Issue a PUT call to the Numerous API server
#'
#' @param path The url path to be appended to the base API url
#' @param body A list containing the data to be sent
#' @param success_code The HTTP status code for successful responses
#'
#' @return The result of the PUT
#' @seealso \code{\link{PUT}}
#' @importFrom assertthat assert_that is.string
#' @importFrom httr PUT status_code
#' @export
#'
#' @examples
#' library(numerous)
#' result <- numerous_PUT(path="users/self", body=list(TODO))
#' 
numerous_PUT <- function(path, body, success_code=200)
{
    assert_that(is.string(path))
    assert_that(is.list(body))

    result <- PUT(url=paste(NUMEROUS_URL_BASE, path, sep='/'),
                  config=get_auth_header(get_numerous_key()),
                  body=body,
                  encode="json")
  
    if(status_code(result) != success_code)
    {
        stop(sprintf("Server returned code %d", status_code(result)))
    }
    result
}
