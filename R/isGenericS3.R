###########################################################################/**
# @RdocDefault isGenericS3
#
# @title "Checks if a function is a S3/UseMethod generic function"
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
#   A function is considered to be a generic S3/UseMethod function if its
#   body, that is the source code, contains the regular pattern 
#   \code{"UseMethod[(]"}.
# }
#
# \value{
#  Returns @TRUE if a generic S3/UseMethod function, otherwise @FALSE.
# }
#
# @author
#
# @keyword "programming"
# @keyword "methods"
# @keyword "internal"
#*/###########################################################################
isGenericS3.default <- function(fcn, envir=parent.frame(), ...) {
  if (is.character(fcn)) {
    fcn <- get(fcn, mode="function", envir=envir, inherits=TRUE);
  }
  body <- body(fcn);
  if (is.call(body))
    body <- deparse(body);
  body <- as.character(body);
  return(length(grep("UseMethod[(]", body)) > 0)
}

setGenericS3("isGenericS3");



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
    fcn <- get(fcn, mode="function", envir=envir, inherits=TRUE);
  }
  body <- body(fcn);
  if (is.call(body))
    body <- deparse(body);
  body <- as.character(body);
  return(length(grep("standardGeneric", body)) > 0)
}

setGenericS3("isGenericS4");



############################################################################
# HISTORY:
# 2010-09-18
# o BUG FIX: isGenericS3() and isGenericS4() did not support specifying
#   the function by name as a character string, despite it was documented
#   to do so.  Thanks John Oleynick for reporting on this.
# 2004-10-18
# o Added Rdoc comments for isGenericS3() and isGenericS4().
# 2002-10-15
# o Created from R.oo Object.R and ideas as described on
#    http://www.maths.lth.se/help/R/
############################################################################
