###########################################################################/**
# @RdocDefault throw
#
# @title "Throws an exception"
#
# \description{
#  Throws an exception by calling stop().
#
#  Note that \code{throw()} can be defined for specific classes, which can
#  then be caught (or not) using \code{\link[base:conditions]{tryCatch}}().
#
#  \emph{This default function will be overridden by ditto in the \bold{R.oo}
#  package, if that is loaded.  The latter \code{R.oo::throw()} implementation
#  is fully backward compatible with this one, but the error object thrown
#  is of class \code{R.oo::Exception}.}
#
#  \emph{WARNING: This function is deprecated in favor of \code{R.oo::throw()},
#  or alternatively, just \code{stop()}.}
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{One or several strings that are concatenated and collapsed
#       into on message string.}
# }
#
# \value{
#   Returns nothing.
# }
#
# @examples "../incl/throw.Rex"
#
# @author
#
# \keyword{error}
# \keyword{internal}
#*/###########################################################################
setMethodS3("throw", "default", function(...) {
  .Deprecated(msg = "R.methodsS3::throw() is deprecated. Use base::stop() instead, or R.oo::throw().")
  stop(...)
})
