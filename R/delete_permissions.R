#' Delete a user's permissions for a given metric
#'
#' @param metric_id The ID of the metric
#' @param user_id The ID of the user
#' 
#' @importFrom assertthat assert_that is.string
#' @export
#'
#' @examples
#' library(numerous)
#' delete_permissions(metric_id = "4754875937013463485",
#'                    user_id = "2586911214569254875")
delete_permissions <- function(metric_id, user_id)
{
    assert_that(is.string(metric_id))
    assert_that(is.string(user_id))
    
    numerous_DELETE(path=paste("metrics", metric_id, "permissions", user_id,
                               sep='/'))
}
