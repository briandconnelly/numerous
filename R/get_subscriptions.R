#' Get a list of all subscriptions to a metric
#'
#' @param metric_id The ID of the metric
#'
#' @return A list containing information about each of the subscriptions to that
#' metric
#' @importFrom assertthat assert_that is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' subs <- get_subscriptions(metric_id = "4475989761572721263")
#' }
get_subscriptions <- function(metric_id)
{
    assert_that(is.string(metric_id))
    
    response <- numerous_GET(path=paste("metrics", metric_id, "subscriptions",
                                        sep='/'))
    # TODO: handle pagination
    rval <- content(response)
    rval$subscriptions
}
