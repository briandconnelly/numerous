#' Update a user's information
#'
#' @param user_id The ID of the user. If one is not provided, the current user's ID is used.
#' @param ... Additional user parameters. These include:
#' \itemize{
#'     \item \code{fullName}: The user’s real name
#'     \item \code{location}: The user’s location
#'     \item \code{email}: The user’s email address. When supplied, a
#'     verification request will be sent to this address.
#' }
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
update_user <- function(user_id=get_numerous_user(), ...)
{
    other_args <- list(...)
    
    assert_that(is.string(user_id))
    assert_that(not_empty(other_args))
    
    my_info <- get_user(user_id = user_id)
    newinfo <- list()
    newinfo$fullName <- my_info$fullName
    newinfo$location <- my_info$location
    newinfo$email <- my_info$email
    
    valid_args <- c("fullName", "location", "email")
    
    for (arg in names(other_args))
    {
        if (!arg %in% valid_args) stop(sprintf("Invalid argument '%s'", arg))
        else newinfo[[arg]] <- other_args[[arg]]
    }
    
    response <- numerous_PUT(path=paste("users", user_id, sep='/'),
                             body=newinfo)
    
    rval <- content(response)
    class(rval) <- c("NumerousUser", "list")
    rval
}
