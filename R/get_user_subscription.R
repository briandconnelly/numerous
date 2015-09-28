#' Get information about a user's subscription to a metric
#'
#' @param metric_id The ID of the metric
#' @param user_id The ID of the user
#'
#' @return A list containing information about the user's subscription to that
#' metric
#' @importFrom assertthat assert_that is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' get_user_subscription(metric_id = "4475989761572721263",
#'                       user_id = "321654987654321")
#' }
get_user_subscription <- function(metric_id, user_id)
{
    assert_that(is.string(metric_id))
    assert_that(is.string(user_id))
    
    response <- numerous_GET(path=paste("metrics", metric_id, "subscriptions",
                                        user_id, sep='/'))
    
    rval <- content(response)
    class(rval) <- c("NumerousSubscription", "list")
    rval 
}
