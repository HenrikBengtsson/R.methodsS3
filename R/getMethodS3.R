###########################################################################/**
# @RdocDefault getMethodS3
#
# @title "Get an S3 method"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{name}{The name of the method.}
#   \item{class}{The class of the method.}
#   \item{...}{Not used.}
# }
#
# \examples{
#  @include "../incl/setMethodS3.Rex"
# }
#
# \seealso{
#   This is just a conveniency wrapper around @see "utils::getS3method"
#   that have arguments consistent with @see "setMethodS3".
#   @see "getGenericS3".
# }
#
# @author
#
# @keyword "programming"
# @keyword "methods"
#*/###########################################################################
setMethodS3("getMethodS3", "default", function(name, class="default", ...) {
  getS3method(name, class=class, optional=FALSE);
})



############################################################################
# HISTORY:
# 2008-05-08
# o Added getMethodS3().
############################################################################
