## covr: skip=all

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
