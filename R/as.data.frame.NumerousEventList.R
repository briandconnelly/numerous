#' Coerce an event list to a data frame
#'
#' @param event_list A list of events for a Numerous metric
#' @param ... Optional arguments (currently unused)
#'
#' @return A data frame
#' @importFrom lubridate parse_date_time
#' @export
#'
#' @examples
#' library(numerous)
#' elist <- get_events(metric_id = "872890734")
#' edf <- as.data.frame(elist)
#' 
as.data.frame.NumerousEventList <- function(event_list, ...)
{
    # TODO better implementation for this
    df <- as.data.frame(event_list[[1]], stringsAsFactors=FALSE)
    for (i in seq(2, length(event_list)))
    {
        df <- rbind(df, as.data.frame(event_list[[i]], stringsAsFactors=FALSE))
    }
    df$updated <- parse_date_time(df$updated, orders="%Y-%m-%d %H:%M:%S",
                                  tz="UTC")
    df
}

