#' Get information about a user
#'
#' @param user_id The ID of the user to get info for. If none is provided,
#' information about yourself is returned.
#'
#' @return A list containing information about the user
#' @importFrom httr add_headers content GET status_code
#' @importFrom assertthat assert_that is.scalar
#' @export
#'
#' @examples
#' library(numerous)
#' u <- get_user()
#' 
get_user <- function(user_id="self")
{
    assert_that(is.scalar(user_id))
    
    # TODO: see if authorization stuff is set
    response <- GET(url=paste(NUMEROUS_URL_BASE, 'users', user_id, sep='/'),
                    config=add_headers(Authorization=paste("Basic", authstr)))
    
    if(status_code(response) == 200)
    {
        rval <- content(response)
        class(rval) <- c("NumerousUser")
    }
    else
    {
        stop(sprintf("Server returned code %d", status_code(response)))
    }
}
