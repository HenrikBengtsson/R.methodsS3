###########################################################################/**
# @RdocDefault getGenericS3
#
# @title "Get an S3 generic function"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{name}{The name of the generic function.}
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
# @keyword "programming"
# @keyword "methods"
#*/###########################################################################
setMethodS3("getGenericS3", "default", function(name, ...) {
  if (!exists(name, mode="function")) {
    throw("No such function found: ", name);
  }

  fcn <- get(name, mode="function");
  if (!isGenericS3(fcn)) {
    throw("The function found is not an S3 generic function: ", name);
  }

  fcn;
})



############################################################################
# HISTORY:
# 2008-05-08
# o Added getGenericS3().
############################################################################
