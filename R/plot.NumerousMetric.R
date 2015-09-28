#' Plot the values of a numerous metric over time
#'
#' @param metric 
#' @param ... 
#'
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' my_metric <- get_metric(metric_id = "4475989761572721263")
#' plot(my_metric)
#' }
plot.NumerousMetric <- function(metric, ...)
{
    other_args <- list(...)
    events <- as.data.frame(get_events(metric$id))
    
    other_args$x <- events$updated
    other_args$y <- events$value
    if(!'main' %in% names(other_args)) other_args$main <- metric$label
    if(!'xlab' %in% names(other_args)) other_args$xlab <- "updated"
    if(!'ylab' %in% names(other_args)) other_args$ylab <- "value"
    
    do.call(plot, other_args)
}
