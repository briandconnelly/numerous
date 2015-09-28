#' Get the numerous user ID
#' 
#' \code{get_numerous_id} is a function that returns the user ID of the Numerous
#' user with the API key being used.
#'
#' @return A string containing the Numerous user ID
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' me <- get_numerous_id()
#' }
get_numerous_id <- function() get_user(user_id = "self")$id
