#' Delete a metric
#'
#' @param metric_id The ID of the metric 
#'
#' @export
#' @importFrom assertthat assert_that is.scalar is.string
#' @examples
#' library(numerous)
#' delete_metric(metric_id = "536616607175882007")
delete_metric <- function(metric_id)
{
    assert_that(is.scalar(metric_id))
    assert_that(is.string(metric_id))
    
    numerous_DELETE(path=paste("metrics", metric_id, sep='/'))
}
