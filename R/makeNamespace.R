makeNamespace <- function(pkg = ".", style = c("minimal", "quoted")) {
  if (pkg == ".") {
    pathname <- file.path(pkg, "DESCRIPTION")
    if (!file_test("-f", pathname)) stop("No such file: ", sQuote(pathname))
    desc <- read.dcf(pathname)
    pkg <- desc[, "Package"]
    stopifnot(length(pkg) == 1L, !is.na(pkg))
  }
  style <- match.arg(style)
  ns <- getNamespace(pkg)
  for (name in ls(envir = ns, all.names = TRUE)) { 
    fcn <- get(name, envir = ns)
    if (!is.function(fcn)) next
    s3class <- attr(fcn, "S3class")
    if (is.null(s3class)) next
    name <- gsub(sprintf("[.]%s$", s3class), "", name)
    if (style == "minimal") {
      cat(sprintf('S3method(%s,%s)\n', name, s3class))
    } else {
      cat(sprintf('S3method("%s", "%s")\n', name, s3class))
    }
  }
}
