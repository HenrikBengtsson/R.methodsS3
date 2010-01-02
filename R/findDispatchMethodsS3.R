###########################################################################/**
# @RdocDefault findDispatchMethodsS3
#
# @title "Finds the S3 methods that a generic function would call"
#
# \description{
#  @get "title", ordered according to an S3 @see "base::class" @vector.
# }
#
# @synopsis
#
# \arguments{
#   \item{methodName}{A @character string specifying the name of a
#     generic function.}
#   \item{classNames}{A @character @vector of @see "base::class" names.}
#   \item{firstOnly}{If @TRUE, only the first method is returned.}
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns a names @list structure.
# }
#
# \seealso{
#   @see "getDispatchMethodS3".
# }
#
# @author
#
# @keyword "programming"
# @keyword "methods"
#*/########################################################################### 
setMethodS3("findDispatchMethodsS3", "default", function(methodName, classNames, firstOnly=FALSE, ...) {
  # Argument 'methodName':
  methodName <- as.character(methodName);
  if (length(methodName) == 0) {
    throw("Argument 'methodName' is empty.");
  }
  if (length(methodName) > 1) {
    throw("Argument 'methodName' must only contain one element: ", paste(head(methodName), collapse=", "));
  }

  # Argument 'classNames':
  classNames <- as.character(classNames);
  if (length(classNames) == 0) {
    throw("Argument 'classNames' is empty.");
  }

  # Argument 'firstOnly':
  firstOnly <- as.logical(firstOnly);


  res <- list();
  for (kk in seq(along=classNames)) {
    className <- classNames[kk];
    fcnName <- paste(methodName, className, sep=".");
    obj <- do.call("getAnywhere", list(fcnName));
    if (length(obj$objs) == 0) {
      # No matching objects
      next;
    }

    # Keep only functions
    keep <- which(sapply(obj$objs, FUN=is.function));
    if (length(keep) == 0) {
      # No functions
      next;
    }

    # Keep the first function
    first <- keep[1];
    fcn <- obj$objs[[first]];
    where <- obj$where[first];

    resKK <- list();
    resKK$class <- className;
    resKK$name <- methodName;
    resKK$fullname <- fcnName;
    resKK$fcn <- fcn;
    resKK$where <- obj$where;

    res[[className]] <- resKK;

    # Return only the first match?
    if (firstOnly) {
      break;
    }
  } # for (kk ...)

  res;
}, private=TRUE) # findDispatchMethodsS3()


############################################################################
# HISTORY:
# 2010-12-02
# o Added Rdoc comments.
# o Made findDispatchMethodsS3() a default method.
# 2009-11-20
# o Added findDispatchMethodsS3().
############################################################################ 
