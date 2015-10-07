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
    
    valid_args <- c("label", "description", "photoId", "kind", "currencySymbol",
                    "value", "precision", "units", "unit", "visibility",
                    "moreURL", "sourceKey", "sourceClass", "photoTreatment",
                    "graphingOptions")

    for (arg in names(other_args))
    {
        if (!arg %in% valid_args) stop(sprintf("Invalid argument '%s'", arg))
    }
    
    if ("kind" %in% names(other_args))
    {
        assert_that(other_args$kind %in% c("number", "percent", "timer",
                                           "currency", "temperature"))
    }
    
    if ("visibility" %in% names(other_args))
    {
        assert_that(other_args$visibility %in% c("public", "unlisted",
                                                 "private"))
    }
    
    # TODO: sourceKey 
    # TODO: sourceClass
    # TODO: photoTreatment - https://developer.numerousapp.com/api#metric-api-tips-tricks-photo-treatment
    # TODO: graphingOptions - https://developer.numerousapp.com/api#metric-api-tips-tricks-graphing-options
    
    response <- numerous_POST(path="metrics", body=other_args)
    rval <- content(response)
    class(rval) <- c("NumerousMetric", "list")
    rval
}
