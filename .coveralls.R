#################################################################
# Test coverage
#
# * covr: https://github.com/jimhester/covr
# * Coveralls: https://coveralls.io/
#
# Henrik Bengtsson
#################################################################
requireNamespace("covr") || stop("Package not loaded: covr")


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Local functions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
excl_files <- function(files, max_lines=10e3) {
  excl <- lapply(files, FUN=function(...) seq_len(max_lines))
  names(excl) <- files
  excl
}
stop_lines <- function(file) {
  grep("(^|[ \t])(abort|stop|throw)[(]", readLines(file))
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exclusion rules
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
excl <- list()

## Don't report coverage on certain files
excl <- c(excl, excl_files("R/zzz.R"))

## Don't report on stop() lines
files <- dir(path="R", pattern="[.]R$", full.names=TRUE)
excl <- c(excl, sapply(files, FUN=stop_lines))

## Debugging
str(excl)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Run through tests and record source code coverage
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
covr::coveralls(exclusions=excl)
