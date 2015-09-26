#' Get a specific event
#'
#' @param metric_id The ID of the metric
#' @param event_id The ID of the event
#'
#' @return A list containing information about the event
#' @importFrom assertthat assert_that is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' library(numerous)
#' get_event(metric_id = "872890734", event_id = "817258")
#' 
get_event <- function(metric_id, event_id)
{
    assert_that(is.string(metric_id))
    assert_that(is.string(event_id))
    
    response <- numerous_GET(path=paste("metrics", metric_id, "events",
                                        event_id, sep='/'))
    
    rval <- content(response)
    class(rval) <- c("NumerousEvent", "list")
    rval
}
