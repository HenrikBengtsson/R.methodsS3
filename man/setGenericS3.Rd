%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  010.setGenericS3.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{setGenericS3}
\alias{setGenericS3.default}
\alias{setGenericS3}

\title{Creates an S3 generic function}

\description{
 \emph{Note that this method is a internal method called by
  \code{\link{setMethodS3}}() and there is no reason for calling it directly!}\cr

 Creates a generic function in S3 style, i.e. setting a
 function with name \code{name} that dispatches the method \code{name}
 via \code{UseMethod}. If there is already a function named \code{name}
 that function is renamed to \code{name.default}.
}

\usage{
\method{setGenericS3}{default}(name, export=TRUE, envir=parent.frame(), ellipsesOnly=TRUE,
  dontWarn=getOption("dontWarnPkgs"),
  validators=getOption("R.methodsS3:validators:setGenericS3"), overwrite=FALSE, ...)
}

\arguments{
  \item{name}{The name of the generic function.}
  \item{export}{A \code{\link[base]{logical}} setting attribute \code{"export"}.}
  \item{envir}{The environment for where this method should be stored.}
  \item{ellipsesOnly}{If \code{\link[base:logical]{TRUE}}, the only arguments in the generic function
     will be \code{...}.}
  \item{dontWarn}{If a non-generic method with the same name is found it
     will be "renamed" to a default method. If that method is found in
     a package with a name that is \emph{not} found in \code{dontWarn}
     a warning will be produced, otherwise it will be renamed silently.}
  \item{validators}{An optional \code{\link[base]{list}} of \code{\link[base]{function}}s that can be used
     to assert that the generated generic function meets certain
     criteria.}
  \item{...}{Not used.}
  \item{overwrite}{If \code{\link[base:logical]{TRUE}} an already existing generic function with
     the same name will be overwritten, otherwise not.}
}

\examples{
myCat.matrix <- function(..., sep=", ") {
  cat("A matrix:\n")
  cat(..., sep=sep)
  cat("\n")
}

myCat.default <- function(..., sep=", ") {
  cat(..., sep=sep)
  cat("\n")
}

setGenericS3("myCat")

myCat(1:10)
mat <- matrix(1:10, ncol=5)
myCat(mat)
}

\seealso{
  To define a method for a class see \code{\link{setMethodS3}}().
  For more information about S3, see \code{\link[base]{UseMethod}}().
}

\author{Henrik Bengtsson}



\keyword{programming}
\keyword{methods}
