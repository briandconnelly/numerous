#' Get a specific interaction
#'
#' @param metric_id The ID of the metric
#' @param interaction_id The ID of the interaction
#'
#' @return A list containing information about the interaction
#' @importFrom assertthat assert_that is.scalar is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' library(numerous)
#' get_interaction(metric_id = "7081126591154125596",
#'                 interaction_id = "11198655321361")
#' 
get_interaction <- function(metric_id, interaction_id)
{
    assert_that(is.scalar(metric_id))
    assert_that(is.string(metric_id))
    assert_that(is.scalar(interaction_id))
    assert_that(is.string(interaction_id))
    
    response <- numerous_GET(path=paste("metrics", metric_id, "interactions",
                                        interaction_id, sep='/'))
    
    rval <- content(response)
    class(rval) <- c("NumerousInteraction", "list")
    rval
}
