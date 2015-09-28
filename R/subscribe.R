#' Subscribe to a metric
#'
#' @param metric_id The ID of the metric
#' @param user_id The ID of the user
#' @param ... Any additional properties for the subscription. See \url{https://developer.numerousapp.com/api}.
#'
#' @return A list containing information about the subscription
#' @importFrom assertthat assert_that is.string not_empty
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' # TODO
#' }
subscribe <- function(metric_id, user_id, ...)
{
    other_args <- list(...)
    assert_that(is.string(metric_id))
    assert_that(is.string(user_id))
    #assert_that(not_empty(other_args))

    other_args[["notificationsEnabled"]] <- TRUE
    other_args[["notifyWhenAbove"]] <- 5000
    other_args[["notifyWhenBelow"]] <- 1000
    other_args[["notifyWhenBelowSet"]] <- TRUE
    other_args[["notifyOnPercentChange"]] <- 0.1
    other_args[["notifyOnPercentChangeSet"]] <- TRUE
    other_args[["notifyOnComment"]] <- FALSE
    other_args[["notifyOnLike"]] <- FALSE
    
    response <- numerous_PUT(path=paste("metrics", metric_id, "subscriptions",
                                        user_id, sep='/'),
                             body=other_args,
                             success_code=201)

    rval <- content(response)
    class(rval) <- c("NumerousSubscription", "list")
    rval
}
