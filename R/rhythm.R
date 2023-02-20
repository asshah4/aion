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
#' Both `x` and `t` must be vectors of the same length. `a` is presumed to be
#' only annotation data at certain positions. `f` serves as a marker of
#' frequency or scale of the data (e.g. if its in days, years, months, or a
#' smaller, more continuous scale such as seconds, minutes, etc).
#'
#' @param x Vector of potential data points that reflect (or do not reflect) event data
#'
#' @param t Vector of time points that reflect information about events
#'
#' @param f Frequency of data sampling to help udnerstand the range and scale of
#'   `t`, such as if its in calendar years, time stamps, or continuous time
#'   intervals.
#'
#' @param a Annotation that labels certain points as of having particular
#'   interest, such as event status, censorship, etc.
#'
#' @return A "combined" record of the `rhythm` class that has validated event
#'   and time properties.
#' @name rhythm
#' @export
rhythm <- function(x, t, f, a, ...) {

	# Very simply will return an enframed vector series
	obj <- data.frame(
		data_point = x,
		time_point = t,
		annotation = a
	)

	# Tentative new class
	structure(
		obj,
		time_scale = f,
		class = c("rhythm_rcrd", class(obj))
	)

}
