###########################################################################/**
# @RdocDefault getGenericS3
#
# @title "Gets an S3 generic function"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{name}{The name of the generic function.}
#   \item{envir}{The @environment from which the search for the
#     generic @function is done.}
#   \item{inherits}{A @logical specifying whether the enclosing frames
#     should be searched or not.}
#   \item{...}{Not used.}
# }
#
# \seealso{
#   @see "setGenericS3".
#   @see "getMethodS3".
#   @see "isGenericS3".
# }
#
# @author
#
# @keyword programming
# @keyword methods
#*/###########################################################################
setMethodS3("getGenericS3", "default", function(name, envir=parent.frame(), inherits=TRUE, ...) {
  fcn <- .findFunction(name, envir=envir, inherits=inherits)$fcn
  if (is.null(fcn)) {
    stop("No such function found: ", name)
  } else if (!isGenericS3(fcn)) {
    stop("The function found is not an S3 generic function: ", name)
  }
  fcn
})
