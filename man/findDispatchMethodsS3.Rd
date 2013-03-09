%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  findDispatchMethodsS3.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{findDispatchMethodsS3}
\alias{findDispatchMethodsS3.default}
\alias{findDispatchMethodsS3}

\title{Finds the S3 methods that a generic function would call}

\description{
 Finds the S3 methods that a generic function would call, ordered according to an S3 \code{\link[base]{class}}() \code{\link[base]{vector}}.
}

\usage{
\method{findDispatchMethodsS3}{default}(methodName, classNames, firstOnly=FALSE, ...)
}

\arguments{
  \item{methodName}{A \code{\link[base]{character}} string specifying the name of a
    generic function.}
  \item{classNames}{A \code{\link[base]{character}} \code{\link[base]{vector}} of \code{\link[base]{class}}() names.}
  \item{firstOnly}{If \code{\link[base:logical]{TRUE}}, only the first method is returned.}
  \item{...}{Not used.}
}

\value{
  Returns a names \code{\link[base]{list}} structure.
}

\seealso{
  \code{\link{getDispatchMethodS3}}().
}

\author{Henrik Bengtsson}



\keyword{programming}
\keyword{methods}
