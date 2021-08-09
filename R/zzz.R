## covr: skip=all
.onLoad <- function(libname, pkgname) {
  value <- getOption("R.methodsS3:useSearchPath", NULL)
  if (is.null(value)) {
    value <- Sys.getenv("R_R_METHODSS3_USE_SEARCH_PATH", "TRUE")
    value <- isTRUE(as.logical(value))
    options("R.methodsS3:useSearchPath" = value)
  }
}


.onAttach <- function(libname, pkgname) {
  pd <- utils::packageDescription(pkgname)
  msg <- sprintf("%s v%s", pkgname, pd$Version)
  
  field <- intersect(c("Date/Publication", "Date"), names(pd))
  if (length(field) > 0L) {
    date <- pd[[field[1]]]
    if (!is.na(date)) msg <- sprintf("%s (%s)", msg, date)
  }
  msg <- sprintf("%s successfully loaded. See ?%s for help.", msg, pkgname)
  pkgStartupMessage(msg)
}
