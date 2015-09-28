#' Get a list of a metric's interactions
#'
#' @param metric_id The ID of the metric
#' @param interaction_id Optional, The ID of the interaction
#' @param df Return data as a data frame using \code{\link{as.data.frame.NumerousInteractionList}} (default=FALSE)
#'
#' @return A list of interactions for the given metric
#' @importFrom assertthat assert_that is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' get_interactions(metric_id = "7081126591154125596")
#' }
get_interactions <- function(metric_id, interaction_id=NA, df=FALSE)
{
    assert_that(is.string(metric_id))
    
    if (!is.na(interaction_id))
    {
        assert_that(is.string(interaction_id))
        response <- numerous_GET(path=paste("metrics", metric_id,
                                            "interactions", interaction_id,
                                            sep='/'))        
        rval <- list(content(response))
    }
    else
    {
        response <- numerous_GET(path=paste("metrics", metric_id,
                                            "interactions", sep='/'))
        rval <- content(response)$interactions
    }
    
    class(rval) <- c("NumerousInteractionList", "list")
    ifelse(df, as.data.frame.NumerousInteractionList(rval), rval)
}
