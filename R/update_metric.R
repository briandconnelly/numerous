#' Update the properties of a metric
#'
#' @param metric_id The metric's ID
#' @param ... Other parameters for the metric. See \url{https://developer.numerousapp.com/api}.
#'
#' @return A list containing information about the updated metric
#' @importFrom assertthat assert_that is.string not_empty
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' update_metric(metric_id = "536616607175882007", label = "My Update Label")
#' }
update_metric <- function(metric_id, ...)
{
    other_args <- list(...)
    
    assert_that(is.string(metric_id))
    assert_that(not_empty(other_args))
    
    path <- paste("metrics", metric_id, sep='/')
    response <- numerous_PUT(path=paste("metrics", metric_id, sep='/'),
                              body=other_args, success_code=200)

    rval <- content(response)
    class(rval) <- c("NumerousMetric", "list")
    rval
}
