#' Get the most popular metrics
#' 
#' Retrieve a list of the metrics with the most subscribers
#'
#' @param count Optional: The number of popular metrics to retrieve (default: 10)
#'
#' @return A list containing information about the most popular metrics
#' @importFrom assertthat assert_that is.count 
#' @importFrom httr content
#' @export
#'
#' @examples
#' library(numerous)
#' 
#' popular <- get_popular_metrics()
#' 
get_popular_metrics <- function(count=10)
{
    assert_that(is.count(count))
    
    response <- numerous_GET(path=paste("metrics", "popular", sep='/'),
                             query=list(count=count))
    
    rval <- content(response)
    lapply(rval, function(x) { class(x) <- c("NumerousMetric", "list"); x })
}
