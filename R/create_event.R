#' Create an event for a metric
#'
#' @param metric_id The ID of the metric
#' @param ... Additional arguments, such as "value". See \url{https://developer.numerousapp.com/api}.
#'
#' @return A list containing information about the event
#' @importFrom assertthat assert_that is.string not_empty
#' @importFrom httr content
#' @export
#'
#' @examples
#' library(numerous)
#' create_event(metric_id = "817258", value = 5)
#' 
create_event <- function(metric_id, ...)
{
    other_args <- list(...)
    
    assert_that(is.string(metric_id))
    assert_that(not_empty(other_args))
 
    response <- numerous_POST(path=paste("metrics", metric_id, "events",
                                         sep='/'),
                              body=other_args)
    rval <- content(response)
    class(rval) <- c("NumerousEvent", "list")
    rval
}
