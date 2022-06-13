###########################################################################/**
# @RdocDefault setGenericS3
#
# @title "Creates an S3 generic function"
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
#   \item{dontWarn}{If a non-generic method with the same name is found it
#      will be "renamed" to a default method. If that method is found in
#      a package with a name that is \emph{not} found in \code{dontWarn}
#      a warning will be produced, otherwise it will be renamed silently.}
#   \item{validators}{An optional @list of @functions that can be used
#      to assert that the generated generic function meets certain
#      criteria.}
#   \item{...}{Not used.}
#   \item{overwrite}{If @TRUE an already existing generic function with
#      the same name will be overwritten, otherwise not.}
# }
#
# @examples "../incl/setGenericS3.Rex"
#
# \seealso{
#   To define a method for a class see @see "setMethodS3".
#   For more information about S3, see @see "base::UseMethod".
# }
#
# @author
#
# @keyword programming
# @keyword methods
#*/###########################################################################
setGenericS3.default <- function(name, export=TRUE, envir=parent.frame(), dontWarn=getOption("dontWarnPkgs"), validators=getOption("R.methodsS3:validators:setGenericS3"), overwrite=FALSE, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'name':
  if (nchar(name) == 0L) {
    stop("Cannot set S3 generic method. Argument 'name' is empty.")
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Backward compatibility tests
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  args <- list(...)
  if (is.element("enforceRCC", names(args))) {
    .Defunct(msg = "Argument 'enforceRCC' of setGenericS3() has been replaced by argument 'validators'.")
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 0. Define local constants and local functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 'get' is illegal, because if it is redefined in a package, library() will
  # maybe load and set the new get, which is then a generic function, and the
  # next thing it will try to get() (it uses get internally) will not be
  # retrieved, since get.default() might not be loaded at this time, but later.
  PROTECTED.NAMES <- c("get")

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 1. Test the definition using validators
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (!is.null(validators)) {
    for (validator in validators) {
      validator(name=name, envir=envir, dontWarn=dontWarn, type="setGenericS3")
    }
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 2. Check for forbidden names
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (is.element(name, R.KEYWORDS))
    stop("Method names must not be same as a reserved keyword in R: ", name)

  if (is.element(name, PROTECTED.NAMES))
    stop("Trying to use an unsafe generic method name (trust us, it is for a *good* reason): ", name)

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
  sys.source.def <- get("sys.source", mode="function", envir=baseenv())
  loadenv <- NULL
  for (framePos in sys.parents()[-1L]) {
    if (identical(sys.source.def, sys.function(framePos))) {
      loadenv <- parent.frame(framePos)
      break
    }
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 3. Check for preexisting functions with the same name
  #     i) in the environment that we are saving to ('envir'),
  #    ii) in the currently loading environment ('loadenv'), or
  #   iii) (optional) in the environments in the search path.
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  envirs <- c(envir, loadenv)
  if (getOption("R.methodsS3:useSearchPath", TRUE)) {
    envirs <- c(envirs, lapply(search(), FUN=as.environment))
  }
  inherits <- rep(FALSE, times=length(envirs))
  checkImports <- getOption("R.methodsS3:checkImports:setGenericS3", FALSE)
  if (checkImports) inherits[1:2] <- TRUE

  fcn <- .findFunction(name, envir=envirs, inherits=inherits)
  fcnDef <- fcn$fcn
  fcnPkg <- fcn$pkg

  if (!overwrite && !is.null(fcnDef)) {
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # 4a. Is it already a generic function?
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    isGeneric <- isGenericS3(fcnDef) || isGenericS4(fcnDef)

    # If it is a generic function, we are done!
    if (isGeneric) {
      # TO DO: Update generic functions with '...', if missing.
      return()
    }

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # 4b. ... or, is there already a default function with the same name?
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Search for preexisting default function in the same environments as above.
    nameDefault <- paste(name, ".default", sep="")
    fcn <- .findFunction(nameDefault, envir=envirs, inherits=inherits)
    defaultExists <- !is.null(fcn$fcn)
    defaultPkg <- fcn$pkg

    if (defaultExists) {
      msg <- paste("Could not create generic function. There is already a non-generic function named ", name, "() in ", sQuote(fcnPkg), " with the same name as an existing default function ", nameDefault, "() in ", sQuote(defaultPkg), ".", sep = "")
      action <- Sys.getenv("R_R_METHODSS3_SETGENERICS3_ONDEFAULTEXISTS", "error")
      action <- getOption("R.methodsS3.setGenericS3.onDefaultExists", action)
      if (identical(action, "error")) {
        stop(msg)
      } else {
        warning(msg)
        return()
      }
    }

    ## Assign 'S3class' attribute (an R.methodsS3 thing)
    attr(fcnDef, "S3class") <- "default"
    
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # 4c. "Rename" the function to a default function
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    assign(nameDefault, substitute(fcn, list(fcn=fcnDef)), envir=envir)
    if (!is.element(fcnPkg, dontWarn)) {
      warning("Renamed the preexisting function ", name, " to ",
        nameDefault, ", which was defined in environment ", fcnPkg, ".")
    }
  } # if (...)

  # By default all generic functions have '...' arguments
  argsStr <- "..."

  # Should argument 'value' be added?
  isReplacementFunction <- (regexpr("<-$", name) != -1L)
  if (isReplacementFunction) {
    argsStr <- paste(c(argsStr, "value"), collapse=", ")
  }

  # Create a generic function
  src <- sprintf("...tmpfcn <- function(%s) UseMethod(\"%s\")", argsStr, name)
  src <- c(src, sprintf("R.methodsS3:::export(...tmpfcn) <- %s", export))
  src <- c(src, sprintf("\"%s\" <- ...tmpfcn", name))
  src <- c(src, "rm(list=\"...tmpfcn\")")
  src <- paste(src, collapse=";\n")
  expr <- parse(text=src)
  eval(expr, envir=envir)
} # setGenericS3.default()
S3class(setGenericS3.default) <- "default"
export(setGenericS3.default) <- FALSE

setGenericS3.default("setGenericS3") # Creates itself ;)
