debug_fun <- function(){
  a <- rstudioapi::getSourceEditorContext()
  rstudioapi::sendToConsole(paste0("debugin::debug_with_message(", a$selection[[1]]$text, ")"),
                            execute = TRUE)
}

undebug_fun <- function(){
  a <- rstudioapi::getSourceEditorContext()
  rstudioapi::sendToConsole(paste0("debugin::undebug_with_message(", a$selection[[1]]$text, ")"),
                            execute = TRUE)
}

debug_once <- function(){
  a <- rstudioapi::getSourceEditorContext()
  rstudioapi::sendToConsole(paste0("debugin::debug_once_with_message(", a$selection[[1]]$text, ")"),
                            execute = TRUE)
}



#' Debug with a message
#'
#' @inheritParams debug
#'
#' @return a debuged function
#' @export
#'
#' @rdname debug
#'
#' @examples
#'\dontrun{
#' a <- function() "plop"
#' debug_with_message(a)
#' undebug_with_message(a)
#' }

debug_with_message <- function (fun, text = "", condition = NULL, signature = NULL){
  message(paste(deparse(substitute(fun)), "is now on debug mode"))
  debug(fun, text, condition, signature)
}

#' @export
#' @rdname debug

debug_once_with_message <- function (fun, text = "", condition = NULL, signature = NULL) {
  message(paste(deparse(substitute(fun)), "will be debugged once"))
  debugonce(fun, text, condition, signature)
}
#' @export
#' @rdname debug

undebug_with_message <- function (fun, signature = NULL) {
  message(paste(deparse(substitute(fun)), "is no longer on debug mode"))
  undebug(fun, signature)
}

