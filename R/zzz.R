.onAttach <- function(libname, pkgname) {
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
  startupMessage(pkgname, " v", pi$Version, " (", pi$Date,
           ") successfully loaded. See ?", pkgname, " for help.");
}
