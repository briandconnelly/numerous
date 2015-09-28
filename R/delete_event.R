#' Delete an event
#'
#' @param metric_id The ID of the metric
#' @param event_id The ID of the event
#'
#' @importFrom assertthat assert_that is.string
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' delete_event(metric_id = "872890734", event_id = "817258")
#' }
delete_event <- function(metric_id, event_id)
{
    assert_that(is.string(metric_id))
    assert_that(is.string(event_id))
    
    numerous_DELETE(path=paste("metrics", metric_id, "events", event_id,
                               sep='/'))
}
