#' Grant or update a user's permissions for a metric
#'
#' @param metric_id The ID of the metric
#' @param user_id The ID of the user
#' @param ... Additional permission parameters. See \url{https://developer.numerousapp.com/api}.
#'
#' @return A list containing information about a user's permissions to the metric
#' @importFrom assertthat assert_that is.string not_empty
#' @importFrom httr content
#' @export
#'
#' @examples
#' library(numerous)
#' update_permissions(metric_id = "4754875937013463485",
#'                    user_id = "2586911214569254875", readMetric = TRUE,
#'                    updateValue = TRUE, editMetric = FALSE,
#'                    exitPermissions = FALSE)
#' 
update_permissions <- function(metric_id, user_id, ...)
{
    other_args <- list(...)
    
    assert_that(is.string(user_id))
    assert_that(not_empty(other_args))
    
    # TODO validate readMetric updateValue editMetric editPermissions
    
    response <- numerous_PUT(path=paste("metrics", metric_id, "permissions",
                                        user_id, sep='/'),
                             body=other_args,
                             success_code=200)
    rval <- content(response)
    class(rval) <- c("NumerousPermissions", "list")
    rval
}

#' @rdname update_permissions
#' @export
grant_permissions <- update_permissions

