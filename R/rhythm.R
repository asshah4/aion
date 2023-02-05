### Class Definition -----------------------------------------------------------

#' Rhythm of events
#'
#' The type of data that internally helps to parse data will be built and
#' validated on this class definition. This allos for understanding of the type
#' of variable (continuous or categorical) and how it is sampled (regular or
#' irregular intervals).
#'
#' @details
#'
#' Both `x` and `t` must be vectors of the same length.
#'
#' @param x Vector of potential data points that reflect (or do not reflect) event data
#'
#' @param t Vector of time points that reflect information about events
#'
#' @return A "combined" record of the `rhythm` class that has validated event
#'   and time properties.
#' @name rhythm
#' @export
rhythm <- function(x, t, ...) {
}
