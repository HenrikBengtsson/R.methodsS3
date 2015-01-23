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
add_excl <- function(excl=list(), new) {
  for (name in names(new)) {
    excl[[name]] <- unique(sort(c(excl[[name]], new[[name]])))
  }
  excl
}

r_files <- function() {
  dir(path="R", pattern="[.]R$", full.names=TRUE)
}

covr_lines <- function(file) {
  lines <- readLines(file)
  pattern <- ".*#[ ]*covr:[ ]*([^#]*).*"
  idxs <- grep(pattern, lines)
  excludes <- lapply(idxs, FUN=function(idx) {
    rule <- gsub(pattern, "\\1", lines[idx])
    rule <- unlist(strsplit(rule, split=",", fixed=TRUE))
    rule <- gsub("[ \t]", "", rule)
    rule <- strsplit(rule, split="=", fixed=TRUE)
    actions <- sapply(rule, FUN=`[`, 1L)
    stopifnot(!any(duplicated(actions)))
    values <- sapply(rule, FUN=`[`, 2L)
    names(values) <- actions
    excl <- integer(0L)
    skip <- values[actions == "skip"]
    if (length(skip) > 0) {
      excl <- c(excl, seq(from=idx+1L, length.out=as.integer(skip)))
    }
    excl
  })
  excludes <- unlist(excludes)
  excludes <- unique(sort(excludes))
  if (is.null(excludes)) excludes <- integer(0)
  excludes
}

excl_files <- function(files, ..., max_lines=10e3) {
  excl <- lapply(c(files, ...), FUN=function(...) seq_len(max_lines))
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

## Don't report on certain files
excl <- add_excl(excl, excl_files("R/zzz.R"))

## Don't report on lines according to # covr: rules
excl <- add_excl(excl, sapply(r_files(), FUN=covr_lines))

## Don't report on stop() lines
excl <- add_excl(excl, sapply(r_files(), FUN=stop_lines))


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
