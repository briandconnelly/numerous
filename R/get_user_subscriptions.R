#' Get a list of a user's subscriptions
#'
#' @param user_id The ID of the user to get subscriptions info for. If one is
#' not provided, the current user's ID is used.
#'
#' @return A list containing information about the user
#' @importFrom assertthat assert_that is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' u <- get_user_subscriptions(user_id = "321654987654321")
#' }
get_user_subscriptions <- function(user_id=get_numerous_user())
{
    assert_that(is.string(user_id))
    
    response <- numerous_GET(path=paste("users", user_id, "subscriptions",
                                        sep='/'))
    
    # TODO: handle pagination?
    rval <- content(response)
    rval$subscriptions
}
