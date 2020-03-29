#' Variance/Standard Deviation of a Distribution
#'
#' Get the mean and standard deviation of a distribution.
#'
#' @param object A distribution object.
#' @param ... Arguments to pass to the \code{integrate()} function (if needed).
#' @details If the statistic is not already available in the distribution
#' object, and if the distribution is not a step distribution,
#' the variance/standard deviation is calculated using the
#' \code{stats::integrate()} function.
#' @return A single numeric
#' @rdname get_variance
#' @export
get_variance <- function(object, ...) UseMethod("get_variance")

#' @export
get_variance.dst <- function(object, ...) {
	ss <- object$prop$variance
	if (!is.null(ss)) return(ss)
	stop("Calculation not developed yet.")
}


#' @rdname get_variance
#' @export
get_sd <- function(object, ...) UseMethod("get_sd")

#' @export
get_sd.dst <- function(object, ...) {
	ss <- get_variance(object, ...)
	sqrt(ss)
}