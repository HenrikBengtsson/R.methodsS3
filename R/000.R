##############################################################################
# This code has to come first in a library. To do this make sure this file
# is named "000.R" (zeros).
##############################################################################

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# NAMESPACE: export()
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Sets attribute export to TRUE
export <- function(x) {
  attr(x, "export") <- TRUE
  x
}
export <- export(export)

# Sets attribute export to 'value'.
"export<-" <- export(function(x, value) {
  attr(x, "export") <- value
  x
})

noexport <- export(function(x) {
  attr(x, "export") <- FALSE
  x
})


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# NAMESPACE: S3method()
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Sets attribute 'S3class' to 'value'.
"S3class<-" <- export(function(x, value) {
  attr(x, "S3class") <- value
  x
})



# Use by setGenericS3() and setMethodS3()
.findFunction <- function(name, envir, inherits=rep(FALSE, times=length(envir))) {
  # Argument 'envir':
  if (!is.list(envir)) {
    envir <- list(envir)
  }
  n <- length(envir)

  # Argument 'inherits':
  inherits <- as.logical(inherits)
  stopifnot(length(inherits) == n)

  fcn <- pkg <- NULL
  for (kk in seq_along(envir)) {
    env <- envir[[kk]]
    inh <- inherits[kk]
    if (exists(name, mode="function", envir=env, inherits=inh)) {
      fcn <- get(name, mode="function", envir=env, inherits=inh)
      pkg <- attr(env, "name")
      if (is.null(pkg)) {
        pkg <- "base"
        if (identical(env, baseenv())) {
        } else if (identical(env, globalenv())) {
          pkg <- "<R_GlobalEnv>"
        }
      } else {
        pkg <- gsub("^package:", "", pkg)
      }
      break
    }
  } # for (kk ...)

  list(fcn=fcn, pkg=pkg)
} # .findFunction()
