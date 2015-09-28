#' Get information about a metric
#'
#' @param metric_id The ID of the metric
#'
#' @return A list containing information about the metric
#' @importFrom assertthat assert_that is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' m <- get_metric(metric_id = "4475989761572721263")
#' }
get_metric <- function(metric_id)
{
    assert_that(is.string(metric_id))
    
    response <- numerous_GET(path=paste("metrics", metric_id, sep='/'))

    rval <- content(response)
    class(rval) <- c("NumerousMetric", "list")
    rval
}
