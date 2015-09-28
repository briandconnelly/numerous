#' Get a metric's events
#'
#' @param metric_id The ID of the metric
#' @param event_id Optional, The ID of an event
#' @param df Return data as a data frame using \code{\link{as.data.frame.NumerousEventList}} (default=FALSE)
#'
#' @return A list of events for the given metric. If an \code{event_id} was
#' given, the list will only contain information for that event.
#' @importFrom assertthat assert_that is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' get_events(metric_id = "872890734")
#' }
get_events <- function(metric_id, event_id=NA, df=FALSE)
{
    assert_that(is.string(metric_id))
    
    if (!is.na(event_id))
    {
        assert_that(is.string(event_id))
        response <- numerous_GET(path=paste("metrics", metric_id, "events",
                                            event_id, sep='/'))        
        rval <- list(content(response))
    }
    else
    {
        response <- numerous_GET(path=paste("metrics", metric_id, "events",
                                            sep='/'))
        rval <- content(response)$events
    }
    
    if (df) as.data.frame.NumerousEventList(rval)
    else 
    {
        rval <- lapply(rval, function(x) { class(x) <- c("NumerousEvent", "list"); x })
        class(rval) <- c("NumerousEventList", "list")
        rval
    }
}
