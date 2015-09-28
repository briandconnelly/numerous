#' Create a new metric
#'
#' @param label The viewable title of the metric
#' @param ... Other parameters for the metric. See \url{https://developer.numerousapp.com/api}.
#'
#' @return A list containing information about the metric
#' @importFrom assertthat assert_that is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' mymetric <- create_metric(label = "Job Status", kind = "percent", value = 0.2)
#' }
create_metric <- function(label, ...)
{
    assert_that(is.string(label))
    
    other_args <- list(...)
    other_args[['label']] <- label

    response <- numerous_POST(path="metrics", body=other_args)
    rval <- content(response)
    class(rval) <- c("NumerousMetric", "list")
    rval
}
