#' Unsubscribe a user from a metric
#'
#' @param metric_id The ID of the metric
#' @param user_id The ID of the user
#'
#' @importFrom assertthat assert_that is.scalar is.string
#' @export
#'
#' @examples
#' library(numerous)
#' 
#' unsubscribe(metric_id = "4754875937013463485",
#'             user_id = "2586911214569254875")
#' 
unsubscribe <- function(metric_id, user_id)
{
    assert_that(is.scalar(metric_id))
    assert_that(is.string(metric_id))
    assert_that(is.scalar(user_id))
    assert_that(is.string(user_id))
    
    numerous_DELETE(path=paste("metrics", metric_id, "subscriptions", user_id,
                               sep='/'))
}
