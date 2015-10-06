#' Create an event for a metric, setting its value
#'
#' @param metric_id The ID of the metric
#' @param value The new value for the metric (or the amount to increment by)
#' @param add Whether or not to increment the metric by the given value
#' (default: FALSE)
#' @param ifchanged The event will be ignored if the value has not changed. When
#' the value has not changed, the server will respond with "client error: (409)
#' Conflict".
#' @param updated Optional: the date and time when the event occurred, if other
#'     than now. Format is "2014-02-18T20:15:43.123Z". The function 
#'     \code{\link{format_datetime_numerous}} can create a string in this
#'     format.
#' 
#' @note \code{onlyIfChanged} and \code{updated} can not be specified at the
#' same time.
#'
#' @return A list containing information about the event
#' @importFrom assertthat assert_that is.number is.string is.flag
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' create_event(metric_id = "817258", value = 5)
#' }
create_event <- function(metric_id, value, add=FALSE, ifchanged=FALSE,
                         updated=NA)
{
    assert_that(is.string(metric_id))
    assert_that(is.number(value))
    assert_that(is.flag(add))
    assert_that(is.flag(ifchanged))

    call_args <- list(value=value)
    if (add) call_args$action <- "ADD"
    if (ifchanged) call_args$onlyIfChanged <- TRUE
    if (!is.na(updated)) call_args$updated <- updated
    
    response <- numerous_POST(path=paste("metrics", metric_id, "events",
                                         sep='/'),
                              body=call_args)
    rval <- content(response)
    class(rval) <- c("NumerousEvent", "list")
    rval
}
