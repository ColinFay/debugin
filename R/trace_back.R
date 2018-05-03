#' A reverse traceback
#'
#' A convenient traceback that print the call stack in the order that it happens
#'   (unlike default traceback).
#'
#' @importFrom crayon has_color blue red
#' @return a reveresed traceback
#' @export
#'

trace_back <- function(){
  a <- as.list(rev(capture.output(traceback())))
  if (has_color()){
    a[1] <- blue(a[1])
    a[length(a)] <- red(a[length(a)])
  }
    for (i in seq_along(a)) cat(a[[i]], "\n")
}

#' Trace a function
#'
#' @export
#' @rdname trace
#'
trace_with_message <- function (what, tracer, exit, at, print, signature,
                                where = topenv(parent.frame()), edit = FALSE)
{
  message(paste(deparse(substitute(fun)), "is now on trace mode"))
  trace(fun)
}
#' @export
#' @rdname trace
#'
untrace_with_message <- function (what, tracer, exit, at, print, signature,
                                where = topenv(parent.frame()), edit = FALSE)
{
  message(paste(deparse(substitute(fun)), "is no longer on trace mode"))
  untrace(fun)
}
