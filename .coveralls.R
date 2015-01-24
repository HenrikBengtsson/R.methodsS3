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
# Filters
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## Don't report on lines according to '# covr:' rules in file
covr_lines <- function(file) {
  lines <- readLines(file)
  nlines <- length(lines)
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
      if (skip == "all") {
        idxs <- seq_len(nlines)
      } else {
        idxs <- seq(from=idx+1L, to=min(nlines, idx + as.integer(skip)))
      }
      idxs <- idxs[idxs <= nlines]
      excl <- c(excl, idxs)
    }
    excl
  })
  excludes <- unlist(excludes)
  excludes <- unique(sort(excludes))
  if (is.null(excludes)) excludes <- integer(0)
  excludes
}

## Don't report on any line
all_lines <- function(file) {
  lines <- readLines(file)
  seq_along(lines)
}

## Don't report on stop() lines
stop_lines <- function(file) {
  grep("(^|[ \t])(abort|stop|throw)[(]", readLines(file))
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Local functions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
exclusions <- function(excl=list(), ...) {
  excl <- c(excl, list(...))
  structure(excl, class="exclusions")
}

as.exclusions <- function(excl) {
  if (!inherits(excl, "exclusions")) excl <- exclusions(excl)
  excl
}

c.exclusions <- function(excl=list(), new) {
  excl <- as.exclusions(excl)
  for (name in names(new)) {
    excl[[name]] <- unique(sort(c(excl[[name]], new[[name]])))
  }
  as.exclusions(excl)
}

read.exclusion <- function(excl) {
  mapply(names(excl), excl, FUN=function(file, idxs) {
    readLines(file)[idxs]
  })
}

excl_files <- function(files, ..., max_lines=10e3) {
  excl <- lapply(c(files, ...), FUN=function(...) seq_len(max_lines))
  names(excl) <- files
  as.exclusions(excl)
}

filter <- function(files, FUN, ...) {
  as.exclusions(sapply(files, FUN=FUN, ...))
}

files <- function(path, pattern, ...) {
  dir(path=path, pattern=pattern, full.names=TRUE, ignore.case=TRUE)
}

r_files <- function(...) {
  files(path="R", pattern="[.]R$", ...)
}

src_files <- function(...) {
  files(path="src", pattern="[.](h|c|cpp|hpp|f)$", ...)
}

all_files <- function(...) {
  c(r_files(), src_files())
}




# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exclusion rules
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
excl <- exclusions(
  ## Don't report on lines according to '# covr:' rules
  filter(r_files(), covr_lines),

  ## Don't report on stop() lines in R code
  filter(r_files(), stop_lines)
)

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
