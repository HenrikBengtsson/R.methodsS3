%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  getDispatchMethodS3.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{getDispatchMethodS3}
\alias{getDispatchMethodS3.default}
\alias{getDispatchMethodS3}

\title{Gets the S3 method that a generic function would call}

\description{
 Gets the S3 method that a generic function would call according to an S3 \code{\link[base]{class}}() \code{\link[base]{vector}}.
}

\usage{
\method{getDispatchMethodS3}{default}(methodName, classNames, ...)
}

\arguments{
  \item{methodName}{A \code{\link[base]{character}} string specifying the name of a
    generic function.}
  \item{classNames}{A \code{\link[base]{character}} \code{\link[base]{vector}} of \code{\link[base]{class}}() names.}
  \item{...}{Not used.}
}

\value{
  Returns a \code{\link[base]{function}}, or throws an exception if not found.
}

\seealso{
  \code{\link{findDispatchMethodsS3}}().
}

\author{Henrik Bengtsson}



\keyword{programming}
\keyword{methods}
