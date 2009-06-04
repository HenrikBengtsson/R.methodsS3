hasVarArgs.function <- function(fcn, ...) {
  if (!is.function(fcn))
    stop("Argument 'fcn' must be a function: ", mode(fcn));

  # Get the current formals
  args <- formals(fcn);

  is.element("...", names(args));
} # hasVarArgs()

hasVarArgs <- function(...) UseMethod("hasVarArgs");

appendVarArgs.function <- function(fcn, ...) {
  if (hasVarArgs(fcn))
    return(fcn);

  # Get the current formals
  args <- formals(fcn);
  # Add '...'
  args <- c(args, formals(function(...) {}));
  # Set new formals
  formals(fcn) <- args;

  fcn;
} # appendVarArgs()

appendVarArgs <- function(...) UseMethod("appendVarArgs");

############################################################################
# HISTORY:
# 2005-02-15
# o Created.
############################################################################
