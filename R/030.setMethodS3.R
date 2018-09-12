###########################################################################/**
# @RdocDefault setMethodS3
#
# @title "Creates an S3 method"
#
# \description{
#  Creates an S3 method. A function with name \code{<name>.<class>} will
#  be set to \code{definition}. The method will get the modifiers specified
#  by \code{modifiers}.  If there exists no generic function for this method,
#  it will be created automatically.
# }
#
# @synopsis
#
# \arguments{
#   \item{name}{The name of the method.}
#   \item{class}{The class for which the method should be defined. If
#      \code{class == "default"} a function with name \code{<name>.default}
#      will be created.}
#   \item{definition}{The method definition.}
#   \item{private, protected}{If \code{private=TRUE}, the method is declared
#      private. If \code{protected=TRUE}, the method is declared protected.
#      In all other cases the method is declared public.}
#   \item{export}{A @logical setting attribute \code{"export"}.}
#   \item{static}{If @TRUE this method is defined to be static,
#      otherwise not. Currently this has no effect expect as an indicator.}
#   \item{abstract}{If @TRUE this method is defined to be abstract,
#      otherwise not. Currently this has no effect expect as an indicator.}
#   \item{trial}{If @TRUE this method is defined to be a trial method,
#      otherwise not. A trial method is a method that is introduced to be
#      tried out and it might be modified, replaced or even removed in a
#      future release. Some people prefer to call trial versions, beta
#      version. Currently this has no effect expect as an indicator.}
#   \item{deprecated}{If @TRUE this method is defined to be deprecated,
#      otherwise not. Currently this has no effect expect as an indicator.}
#   \item{envir}{The environment for where this method should be stored.}
#   \item{overwrite}{If @TRUE an already existing method with the same
#      name (and of the same class) will be overwritten, otherwise not.}
#   \item{conflict}{If a method already exists with the same name (and of
#      the same class), different actions can be taken. If \code{"error"},
#      an exception will be thrown and the method will not be created.
#      If \code{"warning"}, a @warning will be given and the method \emph{will}
#      be created, otherwise the conflict will be passed unnoticed.}
#   \item{createGeneric, exportGeneric}{If \code{createGeneric=TRUE},
#      a generic S3/UseMethod function is defined for this method,
#      iff missing, and \code{exportGeneric} species attribute
#      \code{"export"} of it.}
#   \item{appendVarArgs}{If @TRUE, argument \code{...} is added with a
#      warning, if missing.  For special methods such as \code{$} and
#      \code{[[}, this is never done (argument is ignored).
#      This will increase the chances that the method is consistent with a
#      generic function with many arguments and/or argument \code{...}.}
#   \item{validators}{An optional @list of @functions that can be used
#      to assert that the generated method meets certain criteria.}
#   \item{...}{Passed to @see "setGenericS3", iff called.}
# }
#
# @examples "../incl/setMethodS3.Rex"
#
# \seealso{
#   For more information about S3, see @see "base::UseMethod".
# }
#
# @author
#
# @keyword "programming"
# @keyword "methods"
#*/###########################################################################
setMethodS3.default <- function(name, class="default", definition, private=FALSE, protected=FALSE, export=FALSE, static=FALSE, abstract=FALSE, trial=FALSE, deprecated=FALSE, envir=parent.frame(), overwrite=TRUE, conflict=c("warning", "error", "quiet"), createGeneric=TRUE, exportGeneric=TRUE, appendVarArgs=TRUE, validators=getOption("R.methodsS3:validators:setMethodS3"), ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'name':
  if (nchar(name) == 0L) {
    stop("Cannot set S3 method. Argument 'name' is empty.")
  }

  # Argument 'class':
  if (nchar(class) == 0L) {
    stop("Cannot set S3 method. Argument 'class' is empty.")
  }

  # Argument 'conflict':
  conflict <- match.arg(conflict)


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Backward compatibility tests
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  args <- list(...)
  if (is.element("enforceRCC", names(args))) {
    warning("Argument 'enforceRCC' of setGenericS3() has been replaced by argument 'validators'.")
    # Turn off validators?
    if (!args$enforceRCC) validators <- NULL
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 1. Test the definition using validators
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (!is.null(validators)) {
    for (validator in validators) {
      validator(name=name, class=class, definition=definition, private=private, protected=protected, static=static, abstract=abstract, trial=trial, deprecated=deprecated, envir=envir, overwrite=overwrite, conflict=conflict, createGeneric=createGeneric, appendVarArgs=appendVarArgs, type="setMethodS3")
    }
  }

  # Ignore argument 'appendVarArgs' if a "special" method
  # or a replacement method.
  if (appendVarArgs) {
    # (a) Do not append '...' for the following methods
    ignores <- c("$", "$<-", "[[", "[[<-", "[", "[<-")
    ignores <- c(ignores, "==")
    ignores <- c(ignores, "+", "-", "*", "/", "^", "%%", "%/%")
    appendVarArgs <- !is.element(name, ignores)

    if (appendVarArgs) {
      # (b) Neither functions with any of these name patterns
      ignorePatterns <- c("<-$", "^%[^%]*%$")
      ignores <- (sapply(ignorePatterns, FUN=regexpr, name) != -1L)
      appendVarArgs <- appendVarArgs && !any(ignores)
    }
  }

  # Check for forbidden names.
  if (is.element(name, R.KEYWORDS))
    stop("Method names must not be same as a reserved keyword in R: ", name)

  if (class == "ANY") class <- "default"

  # Create the modifiers
  if (private)
    protection <- "private"
  else if (protected)
    protection <- "protected"
  else
    protection <- "public"

  modifiers <- protection
  if (static == TRUE) modifiers <- c(modifiers, "static")
  if (abstract == TRUE) modifiers <- c(modifiers, "abstract")
  if (deprecated == TRUE) modifiers <- c(modifiers, "deprecated")
  if (trial == TRUE) modifiers <- c(modifiers, "trial")

  if (missing(definition) && abstract == TRUE) {
    # Set default 'definition'.
    src <- paste("...R.oo.definition <- function(...) stop(\"Method \\\"", name, "\\\" is defined abstract in class \\\"", class, "\\\" and has not been overridden by any of the subclasses: \", class(list(...)[[1]])[1])", sep="")
    expr <- parse(text=src)

    # If just defining a local 'definition' function, to be used below,
    # one will get warnings "using .GlobalEnv instead of package:<pkg>"
    # when loading the package *with lazy loading*. I do not understand
    # the reasons for it, but here follows a trick in order to not get
    # such warnings. It kinda borrows the 'envir' frame to define a local
    # function. It works, but don't ask me why. /HB 2005-02-25
    eval(expr, envir=envir)
    definition <- get("...R.oo.definition", envir=envir)
    rm(list="...R.oo.definition", envir=envir)
  }


  # Create the class method 'name':
  methodName <- paste(name, class, sep=".")

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
  #   iii) in the environments in the search path (search()).
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  envirs <- c(envir, loadenv, lapply(search(), FUN=as.environment))
  inherits <- rep(FALSE, times=length(envirs))
  checkImports <- getOption("R.methodsS3:checkImports:setGenericS3", FALSE)
  if (checkImports) inherits[1:2] <- TRUE

  fcn <- .findFunction(methodName, envir=envirs, inherits=inherits)
  fcnDef <- fcn$fcn; fcnPkg <- fcn$pkg


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 4. Append '...' if missing.
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (appendVarArgs) {
    if (!hasVarArgs(definition)) {
      warning("Added missing argument '...' to make it more compatible with a generic function: ", methodName)
#      definition <- appendVarArgs(definition)

      # As above, to avoid "using .GlobalEnv instead of package:<pkg>"
      # warnings, we do the below trick. /HB 2005-02-25
      assign("...R.oo.definition", definition, envir=envir)
      eval(substitute(fcn <- R.methodsS3::appendVarArgs(fcn), list(fcn=as.name("...R.oo.definition"))), envir=envir)
      definition <- get("...R.oo.definition", envir=envir)
      rm(list="...R.oo.definition", envir=envir)
    }
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 5. Validate replacement functions (since R CMD check will complain)
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (regexpr("<-$", name) != -1L) {
    f <- formals(definition)

    fStr <- capture.output(args(definition))[[1]]
    fStr <- sub("^[\t\n\f\r ]*", "", fStr) # trim() is not available
    fStr <- sub("[\t\n\f\r ]*$", "", fStr) # when package loads!

    if (names(f)[length(f)] != "value") {
      ## covr: skip=2
      stop("Last argument of a ", name,
                              "() method should be named 'value': ", fStr)
    }
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 5b. Validate arguments for 'picky' methods.
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  pickyMethods <- list(
    "$"    = c(NA_character_, "name"),
    "$<-"  = c(NA_character_, "name", "value")
  )

  if (is.element(name, names(pickyMethods))) {
    f <- formals(definition)

    fStr <- capture.output(args(definition))[[1L]]
    fStr <- sub("^[\t\n\f\r ]*", "", fStr) # trim() is not available
    fStr <- sub("[\t\n\f\r ]*$", "", fStr) # when package loads!

    reqArgs <- pickyMethods[[name]]
    nbrOfReqArgs <- length(reqArgs)

    # Check for correct number of arguments
    if (length(f) != nbrOfReqArgs) {
      ## covr: skip=2
      stop("There should be exactly ", nbrOfReqArgs, " arguments of a ",
                                              name, "() method: ", fStr)
    }

    for (kk in 1:nbrOfReqArgs) {
      if (!is.na(reqArgs[kk]) && (names(f)[kk] != reqArgs[kk])) {
        ## covr: skip=2
        stop("Argument #", kk, " in a ", name,
             "() method, should be named '", reqArgs[kk], "': ", fStr)
      }
    }
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 6. Assign/create the new method
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (is.null(fcnDef) || overwrite) {
    # Create
    expr <- substitute({
        fcn <- definition
        `R.methodsS3_export<-` <- get("export<-", mode="function",
                        envir=asNamespace("R.methodsS3"), inherits=FALSE)
        R.methodsS3_export(fcn) <- doExport
        rm(list="R.methodsS3_export<-")
        attr(fcn, "S3class") <- class
        attr(fcn, "modifiers") <- modifiers
      }, list(fcn=as.name(methodName), class=class, definition=definition,
              doExport=export, modifiers=modifiers)
    )
    # Assign
    eval(expr, envir=envir)
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 7. Report that a method was redefined?
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (!is.null(fcnDef)) {
    msg <- paste("Method already existed and was",
                  if (overwrite != TRUE) " not", " overwritten: ", sep="")
    if (is.null(conflict))
      conflict <- "quiet"
    if (conflict == "quiet") {
    } else if (conflict == "warning") {
      warning(msg, methodName)
    } else
      stop(msg, methodName)
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 8. Create a generic function?
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (createGeneric) {
    setGenericS3(name, export=exportGeneric, envir=envir, validators=validators, ...)
  }
} # setMethodS3.default()
S3class(setMethodS3.default) <- "default"
export(setMethodS3.default) <- FALSE

setGenericS3("setMethodS3")
