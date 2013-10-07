%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  030.setMethodS3.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{setMethodS3}
\alias{setMethodS3.default}
\alias{setMethodS3}

\title{Creates an S3 method}

\description{
 Creates an S3 method. A function with name \code{<name>.<class>} will
 be set to \code{definition}. The method will get the modifiers specified
 by \code{modifiers}.  If there exists no generic function for this method,
 it will be created automatically.
}

\usage{
\method{setMethodS3}{default}(name, class="default", definition, private=FALSE, protected=FALSE,
  export=FALSE, static=FALSE, abstract=FALSE, trial=FALSE, deprecated=FALSE,
  envir=parent.frame(), overwrite=TRUE, conflict=c("warning", "error", "quiet"),
  createGeneric=TRUE, exportGeneric=TRUE, appendVarArgs=TRUE,
  validators=getOption("R.methodsS3:validators:setMethodS3"), ...)
}

\arguments{
  \item{name}{The name of the method.}
  \item{class}{The class for which the method should be defined. If
     \code{class == "default"} a function with name \code{<name>.default}
     will be created.}
  \item{definition}{The method defintion.}
  \item{private, protected}{If \code{private=TRUE}, the method is declared
     private. If \code{protected=TRUE}, the method is declared protected.
     In all other cases the method is declared public.}
  \item{export}{A \code{\link[base]{logical}} setting attribute \code{"export"}.}
  \item{static}{If \code{\link[base:logical]{TRUE}} this method is defined to be static,
     otherwise not. Currently this has no effect expect as an indicator.}
  \item{abstract}{If \code{\link[base:logical]{TRUE}} this method is defined to be abstract,
     otherwise not. Currently this has no effect expect as an indicator.}
  \item{trial}{If \code{\link[base:logical]{TRUE}} this method is defined to be a trial method,
     otherwise not. A trial method is a method that is introduced to be
     tried out and it might be modified, replaced or even removed in a
     future release. Some people prefer to call trial versions, beta
     version. Currently this has no effect expect as an indicator.}
  \item{deprecated}{If \code{\link[base:logical]{TRUE}} this method is defined to be deprecated,
     otherwise not. Currently this has no effect expect as an indicator.}
  \item{envir}{The environment for where this method should be stored.}
  \item{overwrite}{If \code{\link[base:logical]{TRUE}} an already existing method with the same
     name (and of the same class) will be overwritten, otherwise not.}
  \item{conflict}{If a method already exists with the same name (and of
     the same class), different actions can be taken. If \code{"error"},
     an exception will be thrown and the method will not be created.
     If \code{"warning"}, a \code{\link[base]{warning}} will be given and the method \emph{will}
     be created, otherwise the conflict will be passed unnotice.}
  \item{createGeneric, exportGeneric}{If \code{createGeneric=TRUE},
     a generic S3/UseMethod function is defined for this method,
     iff missing, and \code{exportGeneric} species attribute
     \code{"export"} of it.}
  \item{appendVarArgs}{If \code{\link[base:logical]{TRUE}}, argument \code{...} is added with a
     warning, if missing.  For special methods such as \code{$} and
     \code{[[}, this is never done (argument is ignored).
     This will increase the chances that the method is consistent with a
     generic function with many arguments and/or argument \code{...}.}
  \item{validators}{An optional \code{\link[base]{list}} of \code{\link[base]{function}}s that can be used
     to assert that the generated method meets certain criteria.}
  \item{...}{Passed to \code{\link{setGenericS3}}(), iff called.}
}

\examples{
######################################################################
# Example 1
######################################################################
setMethodS3("foo", "default", function(x, ...) {
  cat("In default foo():\n");
  print(x, ...);
})


setMethodS3("foo", "character", function(s, ...) {
  cat("In foo() for class 'character':\n");
  print(s, ...);
})

# The generic function is automatically created!
print(foo)

foo(123)
foo("123")


######################################################################
# Example 2
#
# Assume that in a loaded package there is already a function bar(),
# but you also want to use the name 'bar' for the character string.
# It may even be the case that you do not know of the other package,
# but your users do!
######################################################################
# bar() in other package
bar <- function(x, y, ...) {
  cat("In bar() of 'other' package.\n");
}


# Your defintion; will redefine bar() above to bar.default().
setMethodS3("bar", "character", function(object, ...) {
  cat("In bar() for class 'character':\n");
  print(object, ...);
})

bar(123)
bar("123")


}

\seealso{
  For more information about S3, see \code{\link[base]{UseMethod}}().
}

\author{Henrik Bengtsson}



\keyword{programming}
\keyword{methods}
