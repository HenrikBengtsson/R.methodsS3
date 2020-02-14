###########################################################################/**
# @RdocDefault isGenericS3
#
# @title "Checks if a function is a S3 generic function"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{fcn}{A @function or a @character string.}
#   \item{envir}{If argument \code{fcn} is a @character, this is the
#      @environment from which the search for the @function is done.}
#   \item{...}{Not used.}
# }
#
# \details{
#   A function is considered to be a generic S3/UseMethod function if
#   its name matches one of the known S3 generic functions, or if it
#   calls \code{UseMethod()}.
# }
#
# \value{
#  Returns @TRUE if a generic S3/UseMethod function, otherwise @FALSE.
# }
#
# @author
#
# @keyword programming
# @keyword methods
#*/###########################################################################
isGenericS3.default <- function(fcn, envir=parent.frame(), ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  knownInternalGenericS3 <- function(fcn, which=1:4, ...) {
    knownGenerics <- NULL

    # Get the name of all known S3 generic functions
    if (any(which == 1L)) {
      knownGenerics <- c(knownGenerics, names(.knownS3Generics))
    }

    if (any(which == 2L)) {
      knownGenerics <- c(knownGenerics, .S3PrimitiveGenerics)
    }

    # tools:::.get_internal_S3_generics() if available
    if (any(which == 3L)) {
      ns <- getNamespace("tools")
      if (exists(".get_internal_S3_generics", envir=ns, inherits=FALSE)) {
        names <- get(".get_internal_S3_generics", envir=ns, inherits=FALSE)()
        knownGenerics <- c(knownGenerics, names)
      }
    }

    # Manually added, cf. ?cbind
    if (any(which == 4L)) {
      names <- c("cbind", "rbind")
      knownGenerics <- c(knownGenerics, names)
    }

    # Is it one of the known S3 generic functions?
    knownGenerics <- unique(knownGenerics)

    knownGenerics
  } # knownInternalGenericS3()

  isNameInternalGenericS3 <- function(fcn, ...) {
    is.element(fcn, knownInternalGenericS3())
  } # isNameInternalGenericS3()

  isPrimitive <- function(fcn, ...) {
    switch(typeof(fcn), special=TRUE, builtin=TRUE, FALSE)
  } # isPrimitive()


  if (is.character(fcn)) {
    if (isNameInternalGenericS3(fcn)) return(TRUE)

    # Get the function
    fcn <- .findFunction(fcn, envir=envir, inherits=TRUE)$fcn

    # Does it even exist?
    if (is.null(fcn)) {
      return(FALSE)
    }
  }

  # Check with codetools::findGlobals(), otherwise scan the body
  res <- tryCatch({
    fcns <- codetools::findGlobals(fcn, merge=FALSE)$functions
    is.element("UseMethod", fcns)
  }, error = function(ex) {
    # Scan the body of the function
    body <- body(fcn)
    if (is.call(body))
      body <- deparse(body)
    body <- as.character(body)
    (length(grep("UseMethod[(]", body)) > 0L)
  })
  if (isTRUE(res)) return(TRUE)

  # Check primitive functions
  if (isPrimitive(fcn)) {
    # Scan the body of the function
    body <- deparse(fcn)
    call <- grep(".Primitive[(]", body, value=TRUE)
    call <- gsub(".Primitive[(]\"", "", call)
    call <- gsub("\"[)].*", "", call)
    if (is.element(call, knownInternalGenericS3(2L))) return(TRUE)
  }

  # Finally, compare to all known internal generics
  for (name in knownInternalGenericS3()) {
    if (exists(name, mode="function", inherits=TRUE)) {
      generic <- get(name, mode="function", inherits=TRUE)
      if (identical(fcn, generic)) return(TRUE)
    }
  }

  FALSE
}
S3class(isGenericS3.default) <- "default"
export(isGenericS3.default) <- FALSE

setGenericS3("isGenericS3")



###########################################################################/**
# @RdocDefault isGenericS4
#
# @title "Checks if a function is a S4 generic function"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{fcn}{A @function or a @character string.}
#   \item{...}{Not used.}
# }
#
# \details{
#   A function is considered to be a generic S4 function if its
#   body, that is the source code, contains the regular pattern
#   \code{"standardGeneric"}.
# }
#
# \value{
#  Returns @TRUE if a generic S4 function, otherwise @FALSE.
# }
#
# @author
#
# @keyword "programming"
# @keyword "methods"
# @keyword "internal"
#*/###########################################################################
isGenericS4.default <- function(fcn, envir=parent.frame(), ...) {
  if (is.character(fcn)) {
    if (!exists(fcn, mode="function", envir=envir, inherits=TRUE)) {
      return(FALSE)
    }
    fcn <- get(fcn, mode="function", envir=envir, inherits=TRUE)
  }
  body <- body(fcn)
  if (is.call(body))
    body <- deparse(body)
  body <- as.character(body)
  return(length(grep("standardGeneric", body)) > 0)
}
S3class(isGenericS4.default) <- "default"
export(isGenericS4.default) <- FALSE

setGenericS3("isGenericS4")
