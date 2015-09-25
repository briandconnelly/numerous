#' Get a user's permissions for a given metric
#'
#' @param metric_id The ID of the metric
#' @param user_id The ID of the user
#'
#' @return A list containing information about the user's permissions for the
#'  metric
#' @importFrom assertthat assert_that is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' library(numerous)
#' p <- get_permissions(metric_id = "4754875937013463485",
#'                      user_id = "2586911214569254875")
get_permissions <- function(metric_id, user_id)
{
    assert_that(is.string(metric_id))
    assert_that(is.string(user_id))
    
    response <- numerous_GET(path=paste("metrics", metric_id, "permissions",
                                        user_id, sep='/'))
    
    rval <- content(response)
    class(rval) <- c("NumerousPermissions", "list")
    rval 
}
