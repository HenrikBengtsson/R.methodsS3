%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  getMethodS3.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{getMethodS3}
\alias{getMethodS3.default}
\alias{getMethodS3}

\title{Get an S3 method}

\description{
 Get an S3 method.
}

\usage{\method{getMethodS3}{default}(name, class="default", ...)}

\arguments{
  \item{name}{The name of the method.}
  \item{class}{The class of the method.}
  \item{...}{Not used.}
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
  This is just a conveniency wrapper around \code{\link[utils]{getS3method}}
  that have arguments consistent with \code{\link{setMethodS3}}().
  \code{\link{getGenericS3}}().
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}



\keyword{programming}
\keyword{methods}
