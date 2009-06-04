# Allows conflicts. For more information, see library() and
# conflicts() in [R] base.
.conflicts.OK <- TRUE 

.First.lib <- function(libname, pkgname) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Set up RCC validators for R.methodsS3.
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  validators <- getOption("R.methodsS3:validators:setGenericS3");
  if (is.null(validators))
    validators <- list();
  validators <- c(validators, list(rccValidateSetGenericS3));
  validators <- getOption("R.methodsS3:validators:setMethodS3");
  if (is.null(validators))
    validators <- list();
  validators <- c(validators, list(rccValidateSetMethodS3));

  pi <- utils::packageDescription(pkgname);
  packageStartupMessage(pkgname, " v", pi$Version, " (", 
    pi$Date, ") successfully loaded. See ?", pkgname, " for help.");
}
