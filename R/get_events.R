#' Get a list of a metric's events
#'
#' @param metric_id The ID of the metric
#'
#' @return A list of events for the given metric
#' @importFrom assertthat assert_that is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' library(numerous)
#' get_events(metric_id = "872890734")
#' 
get_events <- function(metric_id)
{
    assert_that(is.string(metric_id))
    
    response <- numerous_GET(path=paste("metrics", metric_id, "events",
                                        sep='/'))
    
    rval <- content(response)
    rval$events
}
