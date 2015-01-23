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
r_files <- function() {
  dir(path="R", pattern="[.]R$", full.names=TRUE)
}

excl_files <- function(files, ..., max_lines=10e3) {
  excl <- lapply(c(files, ...), FUN=function(...) seq_len(max_lines))
  names(excl) <- files
  excl
}

stop_lines <- function(file) {
  grep("(^|[ \t])(abort|stop|throw)[(]", readLines(file))
}

no_covr_lines <- function(file) {
  grep("#[ ]*covr:no", readLines(file))
}

add_excl <- function(excl=list(), new) {
  for (name in names(new)) {
    excl[[name]] <- unique(sort(c(excl[[name]], new[[name]])))
  }
  excl
}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exclusion rules
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
excl <- list()

## Don't report on stop() lines
excl <- add_excl(excl, sapply(r_files(), FUN=stop_lines))

## Don't report on lines marked with # covr:no
excl <- add_excl(excl, sapply(r_files(), FUN=no_covr_lines))

## Don't report on certain files
excl <- add_excl(excl, excl_files("R/zzz.R"))

## Debugging
str(excl)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Run through tests and record source code coverage
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if (interactive()) {
  coverage <- covr::package_coverage(exclusions=excl)
  print(coverage)
} else {
  covr::coveralls(exclusions=excl)
}
