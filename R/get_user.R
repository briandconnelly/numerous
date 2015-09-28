#' Get information about a user
#'
#' @param user_id The ID of the user to get info for. If none is provided,
#' information about yourself is returned.
#'
#' @return A list containing information about the user
#' @importFrom assertthat assert_that is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' u <- get_user()
#' }
get_user <- function(user_id="self")
{
    assert_that(is.string(user_id))
    
    response <- numerous_GET(path=paste("users", user_id, sep='/'))

    rval <- content(response)
    class(rval) <- c("NumerousUser", "list")
    rval
}
