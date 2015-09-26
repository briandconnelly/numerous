#' @importFrom assertthat assert_that is.string
is_permission_param <- function(x)
{
    assert_that(is.string(x))
    x %in% c("readMetric", "updateValue", "editMetric", "editPermissions")
}

# TODO
#' @importFrom assertthat assert_that is.string
is_user_param <- function(x)
{
    assert_that(is.string(x))
    user_params <- c("id", "userName", "fullName", "location", "photoURL",
                     "notificationsEnabled", "fbId", "twId", "twScreenName",
                     "email", "emailVerified")
    x %in% user_params
}

# TODO
#' @importFrom assertthat assert_that is.string
is_metric_param <- function(x)
{
    assert_that(is.string(x))
    metric_params <- c("label", "description", "photoId", "kind",
                       "currencySymbol", "value", "precision", "units", "unit",
                       "visibility", "moreURL", "sourceKey", "sourceClass",
                       "photoTreatment", "graphingOptions", "id",
                       "isOwnedByChannel", "ownerId", "updated", "photoURL",
                       "subscriberCount", "links")
    x %in% metric_params
}

# TODO
#' @importFrom assertthat assert_that is.string
is_valid_visibility <- function(x)
{
    assert_that(is.string(x))
    x %in% c("public", "unlisted", "private")
}

assertthat::on_failure(is_valid_visibility) <- function(call, env)
{
    paste0(deparse(call$x), " is not a valid metric visibility setting")
}
