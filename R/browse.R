unbrowse <- function(){
  a <- rstudioapi::getSourceEditorContext()
  a$selection[[1]]$text <- gsub('[^#]{1}browser\\(\\)', '#browser()', a$selection[[1]]$text)
  rstudioapi::insertText(location = a$selection[[1]]$range, a$selection[[1]]$text)
}

browse <- function(){
  a <- rstudioapi::getSourceEditorContext()
  a$selection[[1]]$text <- gsub('#browser\\(\\)', ' browser()', a$selection[[1]]$text)
  rstudioapi::insertText(location = a$selection[[1]]$range, a$selection[[1]]$text)
}
