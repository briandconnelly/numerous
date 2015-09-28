#' Get information about a metric
#'
#' @param metric_id The ID of the metric
#' @param owner_info Whether or not to include information about the metric's
#' owner (default: FALSE)
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
get_metric <- function(metric_id, owner_info=FALSE)
{
    assert_that(is.string(metric_id))
    
    query <- list()
    if (owner_info) query <- list(expand="owner")

    response <- numerous_GET(path=paste("metrics", metric_id, sep='/'),
                             query=query)
    
    rval <- content(response)
    class(rval) <- c("NumerousMetric", "list")
    if (owner_info) class(rval$owner) <- c("NumerousUser", "list")
    rval
}
