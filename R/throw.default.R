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
#  \emph{This default function will be overridden by ditto in the \pkg{R.oo}
#  package, if that is loaded.  The latter @see "R.oo::throw" implementation
#  is fully backward compatible with this one, but the error object thrown
#  is of class @see "R.oo::Exception".}
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
#*/###########################################################################
setMethodS3("throw", "default", function(...) {
  .Deprecated(msg = "R.methodsS3::throw() is deprecated. Use base::stop() instead, or R.oo::throw().")
  stop(...)
})
