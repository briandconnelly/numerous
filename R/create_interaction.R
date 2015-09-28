#' Create an interaction with a number
#'
#' @param metric_id The ID of the metric
#' @param author_id The ID of the user doing the interaction
#' @param kind The type of interaction. One of: "like", "comment", or "error"
#' @param ... 
#'
#' @note If \code{kind} is "comment" or "error", must also supply an argument for \code{commentBody}.
#' @return A list containing information about the interaction
#' @importFrom assertthat assert_that is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' create_interaction(metric_id = "TODO", author_id = "TODO", kind = "like")
#' }
create_interaction <- function(metric_id, author_id, kind, ...)
{
    other_args <- list(...)
    
    assert_that(is.string(metric_id))
    assert_that(is.string(author_id))
    assert_that(is.string(kind))
    assert_that(tolower(kind) %in% c('like', 'comment', 'error'))
    
    #if (tolower(kind) %in% c('comment', 'error')) assert_that('commentBody' %in% other_args)
    
    other_args[['authorId']] <- author_id
    other_args[['kind']] <- tolower(kind)
    
    response <- numerous_POST(path=paste("metrics", metric_id, "interactions",
                                         sep='/'),
                              body=other_args)
    rval <- content(response)
    class(rval) <- c("NumerousInteraction", "list")
    rval
}
