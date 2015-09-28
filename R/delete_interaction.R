#' Delete an interaction
#'
#' @param metric_id The ID of the metric
#' @param interaction_id The ID of the interaction
#'
#' @importFrom assertthat assert_that is.string
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' delete_interaction(metric_id = "7081126591154125596",
#'                    interaction_id = "11198655321361")
#' }
delete_interaction <- function(metric_id, interaction_id)
{
    assert_that(is.string(metric_id))
    assert_that(is.string(interaction_id))
    
    numerous_DELETE(path=paste("metrics", metric_id, "interactions",
                               interaction_id, sep='/'))
}
