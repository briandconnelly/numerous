#' Format a time for Numeric API
#'
#' @param t A POSIXct object containing a date and time
#'
#' @return A string containing the given date and time in a format accepted by
#' the Numerous API
#' @export
#'
#' @examples
#' \dontrun{
#' library(numerous)
#' format_numeric_time(Sys.time())
#' }
format_datetime_numerous <- function(t)
{
    options(digits.secs = 3)
    format(t, format="%Y-%m-%dT%H:%M:%OSZ", tz="GMT", usetz=FALSE)
}
