#' This environment stores the Numerous API key so that it doesn't have to be
#' specified in each API call.
#' @noRd
numerous_env <- new.env()

#' Manage Numerous API keys
#' 
#' The numerous package stores the user's API key so that it does not have to
#' be specified as an argument to all commands. These functions handle working
#' with saved API keys during a session.
#'
#' \code{set_numerous_key} sets the key for the Numerous API
#'
#' @param key Numerous API key
#' 
#' @note The API key is found in the Settings of the Numerous mobile app
#'
#' @importFrom assertthat assert_that is.string
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' set_numerous_key(key = "nmrs_S7ZEna7Pmjg7")
#' }
set_numerous_key <- function(key)
{
    assert_that(is.string(key))
    assign("API_KEY", key, envir=numerous_env, inherits=FALSE)
}


#' @description \code{get_numerous_key} returns API key that has been saved
#' @rdname set_numerous_key                                                       
#' @export
get_numerous_key <- function()
{
    if (!numerous_key.isset()) stop("Numerous API key has not been set. Use set_numerous_key().")
    return(get("API_KEY", envir=numerous_env, inherits=FALSE))
}


#' @description \code{unset_numerous_key} clears the saved API key
#' @rdname set_numerous_key                                                       
#' @export
unset_numerous_key <- function()
{
    if (!numerous_key.isset()) stop("Numerous API key has not been set.")
    rm("API_KEY", envir=numerous_env, inherits=FALSE)
}


#' @description \code{numerous_key.isset} returns whether or not the API key has been set
#' @rdname set_numerous_key                                                       
#' @export
numerous_key.isset <- function() exists("API_KEY", key, envir=numerous_env,
                                        inherits=FALSE)
