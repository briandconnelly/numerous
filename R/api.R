#' @title Manage Numerous API keys
#' 
#' @details The numerous package stores the user's API key so that it does not have to
#' be specified as an argument to all commands. These functions handle working
#' with saved API keys during a session.
#'
#' @description \code{set_numerous_key} sets the key for the Numerous API using
#' either the key supplied with \var{key}. If \var{key} is not specified,
#' the value stored in the environment variable specified by \var{env} (default:
#' \env{NUMEROUS_API_KEY}) is used.
#'
#' @param key Numerous API key
#' @param env The environment variable where the API key is stored
#' 
#' @note The API key is found in the Settings of the Numerous mobile app
#' @note \code{set_numerous_key} will also retrieve and store the ID of the user
#' associated with the API key.
#'
#' @importFrom assertthat assert_that is.string
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' set_numerous_key(key = "nmrs_S7ZEna7Pmjg7")
#' }
set_numerous_key <- function(key=NA, env="NUMEROUS_API_KEY")
{
    if(!is.na(key))
    {
        assert_that(is.string(key))
        assign("API_KEY", key, envir=numerous_env, inherits=FALSE)
    }
    else
    {
        eval <- Sys.getenv(x=env, unset=NA)
        if(is.na(eval)) stop("Must provide API key")
        assign("API_KEY", eval, envir=numerous_env, inherits=FALSE)
    }
    set_numerous_user(user_id = get_user(user_id = "self")$id)
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


#' @description \code{set_numerous_user} sets the Numerous ID of the user
#' @rdname set_numerous_key
#' @param user_id The ID of the current user
#' @importFrom assertthat assert_that is.string
#' @export
set_numerous_user <- function(user_id)
{
    assert_that(is.string(user_id))
    assign("USER_ID", user_id, envir=numerous_env, inherits=FALSE)
}


#' @description \code{numerous_user.isset} returns whether or not the user ID has been set
#' @rdname set_numerous_key                                                       
#' @export
numerous_user.isset <- function() exists("USER_ID", key, envir=numerous_env,
                                         inherits=FALSE)


#' @description \code{get_numerous_user} returns user ID that has been saved
#' @rdname set_numerous_key                                                       
#' @export
get_numerous_user <- function()
{
    if (!numerous_user.isset()) stop("Numerous user ID has not been set. Use set_numerous_user().")
    return(get("USER_ID", envir=numerous_env, inherits=FALSE))
}


#' @description \code{unset_numerous_user} clears the saved user ID
#' @rdname set_numerous_key                                                       
#' @export
unset_numerous_user <- function()
{
    if (!numerous_user.isset()) stop("Numerous user ID has not been set.")
    rm("USER_ID", envir=numerous_env, inherits=FALSE)   
}
