###########################################################################/**
# @RdocDefault setGenericS3
#
# @title "Creates a generic function in S3/UseMethod style"
#
# \description{
#  \emph{Note that this method is a internal method called by
#   @see "setMethodS3" and there is no reason for calling it directly!}\cr
#
#  Creates a generic function in S3 style, i.e. setting a
#  function with name \code{name} that dispatches the method \code{name} 
#  via \code{UseMethod}. If there is already a function named \code{name} 
#  that function is renamed to \code{name.default}.
# }
#
# @synopsis
#
# \arguments{
#   \item{name}{The name of the generic function.}
#   \item{export}{A @logical setting attribute \code{"export"}.}
#   \item{envir}{The environment for where this method should be stored.}
#   \item{ellipsesOnly}{If @TRUE, the only arguments in the generic function
#      will be @....}
#   \item{dontWarn}{If a non-generic method with the same name is found it 
#      will be "renamed" to a default method. If that method is found in
#      a package with a name that is \emph{not} found in \code{dontWarn}
#      a warning will be produced, otherwise it will be renamed silently.}
#   \item{validators}{An optional @list of @functions that can be used
#      to assert that the generated generic function meets certain 
#      criteria.}
#   \item{...}{Not used.}
# }
#
# \examples{
#   myCat.matrix <- function(..., sep=", ") {
#     cat("A matrix:\n");
#     cat(..., sep=sep);
#     cat("\n");
#   }
#
#   myCat.default <- function(..., sep=", ") {
#     cat(..., sep=sep);
#     cat("\n");
#   }
#
#   setGenericS3("myCat");
#
#   myCat(1:10);
#   mat <- matrix(1:10, ncol=5);
#   attr(mat, "class") <- "matrix";  # Has to be done as of [R] V1.4.0.
#   myCat(mat);
# }
#
# \seealso{
#   To define a method for a class see @see "setMethodS3".
#   For more information about S3, see @see "base::UseMethod".
# }
#
# @author
#
# @keyword "programming"
# @keyword "methods"
# @keyword "internal"
#*/###########################################################################
setGenericS3.default <- function(name, export=TRUE, envir=parent.frame(), ellipsesOnly=TRUE, dontWarn=getOption("dontWarnPkgs"), validators=getOption("R.methodsS3:validators:setGenericS3"), ...) {
#  cat("setGenericS3(\"", name, "\", \"", get("class", envir=parent.frame()), "\", ...)\n", sep="");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  # Backward compatibility tests
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  args <- list(...);
  if (is.element("enforceRCC", names(args))) {
    warning("Argument 'enforceRCC' of setGenericS3() has been replaced by argument 'validators'.");
    # Turn off validators?
    if (args$enforceRCC == FALSE) {
      validators <- NULL;
    }
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  # 0. Define local constants and local functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  # Known generic functions (that I know of)
  GENERIC.FUNCTIONS <- c("as.vector", "range");

  # 'get' is illegal, because if it is redefined in a package, library() will
  # maybe load and set the new get, which is then a generic function, and the
  # next thing it will try to get() (it uses get internally) will not be
  # retrieved, since get.default() might not be loaded at this time, but later.
  PROTECTED.NAMES <- c("get"); 

  is.primitive <- function(fdef)
    switch(typeof(fdef), special=, builtin=TRUE, FALSE)

  
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 1. Test the definition using validators
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (!is.null(validators)) {
    for (validator in validators) {
      validator(name=name, envir=envir, ellipsesOnly=ellipsesOnly, 
                                   dontWarn=dontWarn, type="setGenericS3");
    }
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  # 2. Check for forbidden names
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  if (is.element(name, R.KEYWORDS))
    stop("Method names must not be same as a reserved keyword in R: ", name);

  if (is.element(name, PROTECTED.NAMES))
    stop("Trying to use an unsafe generic method name (trust us, it is for a *good* reason): ", name);

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  # 2. Find the environment where sys.source() loads the package, which is
  # the local variable (argument) of sys.source() named as "envir".
  # Unfortunately, the only way we can be sure which of the parent frames
  # are the sys.source() function frame is to compare its definition with
  # each of the definitions of the parent frames using sys.function().
  # Comment: sys.source() is used by library() and require() for loading
  # packages. Also note that packages that are currently loaded are not in
  # the search path, cf. search(), and there and standard exists() will not
  # find it. *Not* checking the currently loading environment would *not* 
  # be harmful, but it would produce too many warnings.
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  sys.source.def <- get("sys.source", mode="function", envir=baseenv());
  loadenv <- NULL;
  for (framePos in sys.parents()[-1]) {
    if (identical(sys.source.def, sys.function(framePos))) {
      loadenv <- parent.frame(framePos);
      break;
    }
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  # 3. Check for preexisting functions with the same name
  #     i) in the environment that we are saving to ('envir'), 
  #    ii) in the currently loading environment ('loadenv'), or
  #   iii) in the environments in the search path (search()).
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  envirs <- c(envir, loadenv, lapply(search(), FUN=as.environment));
  fcnDef <- NULL;
  for (env in envirs) {
    if (exists(name, mode="function", envir=env, inherits=FALSE)) {
      fcnDef <- get(name, mode="function", envir=env, inherits=FALSE);
      fcnPkg <- attr(env, "name");
      if (is.null(fcnPkg)) 
        fcnPkg <- "base" 
      else 
        fcnPkg <- gsub("^package:", "", fcnPkg);
      break;
    }
  }

  if (!is.null(fcnDef)) {
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    # 4a. Is it already a generic function?
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    if (is.element(name, GENERIC.FUNCTIONS)) {
      isGeneric <- TRUE;
    } else {
      bdy <- body(fcnDef);
      if (is.null(bdy)) {
        # Assume that all primitive functions are generic, which is 99% correct.
        isGeneric <- is.primitive(fcnDef);
      } else {
        src <- as.character(deparse(bdy));  # deparse is needed! / HB 2002-01-24
      	isGeneric <- any(regexpr("UseMethod", src) != -1) | 
      		     any(regexpr("standardGeneric", src) != -1);
      }
    }

    # If it is a generic function, we are done!
    if (isGeneric) {
      # TO DO: Update generic functions with '...', if missing.
      return();
    }

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    # 4b. ... or, is there already a default function with the same name?
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    # Search for preexisting default function in the same environments as above.
    nameDefault <- paste(name, ".default", sep="");
    defaultExists <- FALSE;
    for (env in envirs) {
      if (exists(nameDefault, mode="function", envir=env, inherits=FALSE)) {
        defaultExists <- TRUE
        defaultPkg <- if (is.null(env)) "base" else attr(env, "name");
        break;
      }
    }

    if (defaultExists) {
      warning("Could not create generic function. There is already a",
              " non-generic function named ", name, "() in package ", fcnPkg, 
              " with the same name as an existing default function ", 
              nameDefault, "() in package", defaultPkg, ".");
      return();
    }

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    # 4c. "Rename" the function to a default function
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    assign(nameDefault, substitute(fcn, list(fcn=fcnDef)), envir=envir);
    if (!is.element(fcnPkg, dontWarn)) {
      warning("Renamed the preexisting function ", name, " to ", 
        nameDefault, ", which was defined in environment ", fcnPkg, ".");
    }
  }

  # Create a generic function
  src <- paste("...tmpfcn <- function(...) UseMethod(\"", name, "\")", sep="");
  src <- c(src, paste("attr(...tmpfcn, \"export\") <- TRUE", sep=""));
  src <- c(src, paste("\"", name, "\" <- ...tmpfcn", sep=""));
  src <- c(src, paste("rm(list=\"...tmpfcn\");", sep=""));
  src <- paste(src, collapse=";\n");
  expr <- parse(text=src);
  eval(expr, envir=envir);
}

setGenericS3.default("setGenericS3");  # Creates itself ;)




############################################################################
# HISTORY:
# 2012-04-17
# o Added argument 'export' to setMethodS3() and setGenericS3().
# 2007-09-17
# o Replaced 'enforceRCC' argument with more generic 'validators'.
# 2007-06-09
# o Removed (incorrect) argument name 'list' from all substitute() calls.
# 2006-02-09
# o Removed all usage of NULL environments.  get(envir=NULL) is replaced
#   with get(envir=baseenv()).
# 2005-06-14
# o Now setGenericS3() allows a few methods that starts with a non-letter
#   as the first character. See code for details.
# 2005-02-15
# o Added arguments '...' in order to match any generic functions.
# 2004-06-27
# o Added known generic function 'as.vector()'.
# 2003-07-07
# o Removed obsolete argument 'force' in Rdoc.
# 2002-11-29
# o Updated some error messages.
# o Now it is possible to create generic methods with one (or several) 
#   . (period) as a prefix of the name. Such a method should be considered
#   private in the same manner as fields with a period are private.
# 2002-11-28
# o SPELL CHECK: "...name name..." in one of setGenericS3()'s error messages.
# 2002-11-10
# o Updated setGenericS3() to assert that the environment variable 'envir' 
#   is actually the one in the frame of the sys.source() function call. This
#   is done by comparing function defintions.
# o Changed setGenericS3() to *always* create generic functions with no
#   arguments except "...".
# 2002-10-21
# o Made ellipsesOnly=TRUE by default.
# 2002-10-17
# o Removed obsolete "modifiers<-"().
# o Added also "Object" to the class attribute to make static methods to
#   work.
# 2002-10-16
# o There are times when
#     generic <- function(...) UseMethod() 
#   is not working, for example
#     fcn <- get("generic"); fcn(myObj, ...);
#   For this reason, always do method dispatching using the name explicitly;
#     generic <- function(...) UseMethod("generic") 
#
# 2002-10-15
# o Created from R.oo Object.R and ideas as described on
#    http://www.maths.lth.se/help/R/
############################################################################
