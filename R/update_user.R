#' Update a user's information
#'
#' @param user_id The ID of the user
#' @param ... Additional user parameters. See \url{https://developer.numerousapp.com/api}.
#'
#' @return A list containing information about the user
#' @importFrom assertthat assert_that is.string not_empty
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' update_user(user_id = "321654987654321", fullName = "Newman Russ",
#'             location = "Walla Walla, WA")
#' }
update_user <- function(user_id, ...)
{
    other_args <- list(...)
    
    assert_that(is.string(user_id))
    assert_that(not_empty(other_args))
    
    response <- numerous_PUT(path=paste("users", user_id, sep='/'),
                             body=other_args)
    
    rval <- content(response)
    class(rval) <- c("NumerousUser", "list")
    rval
}
