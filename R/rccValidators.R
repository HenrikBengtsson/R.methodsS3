rccValidateFunctionName <- function(name, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate 'name'
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Assert that the generic function name is a valid function name.
  firstLetter <- substring(gsub("^[.]*", "", name), 1,1);

  allowedFirst <- c("?", "$", "$<-", "[", "[<-", "[[", "[[<-");
  if (!is.element(firstLetter, allowedFirst)) {
    if (!is.element(tolower(firstLetter), letters))
      throw("Method names must begin with a letter: ", name);

    # Check first letter  
    if (firstLetter == toupper(firstLetter))
      throw("Method names should start with a lower case letter: ", name);
  }
}
export(rccValidateFunctionName) <- FALSE;

rccValidateSetMethodS3 <- function(name, ...) {
  rccValidateFunctionName(name=name)
}
export(rccValidateSetMethodS3) <- FALSE;

rccValidateSetGenericS3 <- function(name, ...) {
  rccValidateFunctionName(name=name)
}
export(rccValidateSetGenericS3) <- FALSE;
