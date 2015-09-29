#' Subscribe or update a subscription to a metric
#'
#' @description \code{subscribe} subscribes the given user to the a metric
#' @param metric_id The ID of the metric
#' @param user_id The ID of the user. If one is not provided, the current user's ID is used.
#' @param notifications Whether or not notifications are enabled (default:
#' \code{TRUE}). Specific events for notifications must be set as additional
#' arguments (see below).
#' @param ... Any additional properties for the subscription. These include:
#' \itemize{
#'     \item \code{notifyOnAnyChange}: Notify whenever the metric changes
#'     \item \code{notifyWhenAbove}: Value above which a notification will be
#'     made
#'     \item \code{notifyWhenBelow}: Value below which a notification will be
#'     made
#'     \item \code{notifyOnPercentChange}: Change in percent above which a
#'     notification will be made
#'     \item \code{notifyOnComment}: Whether or not to notify when metric is
#'     commented on
#'     \item \code{notifyOnLike}: Whether or not to notify when metric is liked
#'     \item \code{notifyOnFollow}: Whether or not to notify when a new user
#'     subsribes to this metric
#' }
#'
#' @return A list containing information about the subscription
#' @importFrom assertthat assert_that is.string not_empty
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' subscribe(metric_id = "7081126591154125596", notifications=TRUE)
#' }
subscribe <- function(metric_id, user_id=get_numerous_id(), notifications=TRUE, ...)
{
    other_args <- list(...)
    assert_that(is.string(metric_id))
    assert_that(is.string(user_id))
    
    valid_args <- c("notificationsEnabled", "notifyOnAnyChange",
                    "notifyWhenAbove", "notifyWhenAboveSet",
                    "notifyWhenBelow", "notifyWhenBelowSet",
                    "notifyOnPercentChange", "notifyOnPercentChangeSet",
                    "notifyOnComment", "notifyOnLike", "notifyOnError",
                    "notifyOnFollow")
    
    for (arg in names(other_args))
    {
        if (!arg %in% valid_args) stop(sprintf("Invalid argument '%s'", arg))
    }
    
    other_args[['notificationsEnabled']] <- notifications
    other_args[["notifyWhenAboveSet"]] <- "notifyWhenAbove" %in% names(other_args)
    other_args[["notifyWhenBelowSet"]] <- "notifyWhenBelow" %in% names(other_args)
    other_args[["notifyOnPercentChangeSet"]] <- "notifyOnPercentChange" %in% names(other_args)

    if (!notifications & other_args[["notifyWhenAboveSet"]]) warning("notifyWhenAboveSet enabled, but notifications are disabled.")
    if (!notifications & other_args[["notifyWhenBelowSet"]]) warning("notifyWhenBelowSet enabled, but notifications are disabled.")
    if (!notifications & other_args[["notifyOnPercentChangeSet"]]) warning("notifyOnPercentChangeSet enabled, but notifications are disabled.")
    
    response <- numerous_PUT(path=paste("metrics", metric_id, "subscriptions",
                                        user_id, sep='/'),
                             body=other_args)

    rval <- content(response)
    class(rval) <- c("NumerousSubscription", "list")
    rval
}

#' @description \code{update_subscription} updates the settings for a user's subscription to
#' a metric
#' @rdname subscribe
#' @export
update_subscription <- subscribe
