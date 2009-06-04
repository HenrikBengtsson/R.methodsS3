%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  isGenericS3.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{isGenericS3}
\alias{isGenericS3.default}
\alias{isGenericS3}

\title{Checks if a function is a S3/UseMethod generic function}

\description{
 Checks if a function is a S3/UseMethod generic function.
}

\usage{\method{isGenericS3}{default}(fcn, ...)}

\arguments{
  \item{fcn}{A \code{\link[base]{function}} or a \code{\link[base]{character}} string.}
  \item{...}{Not used.}
}

\details{
  A function is considered to be a generic S3/UseMethod function if its
  body, that is the source code, contains the regular pattern
  \code{"UseMethod[(]"}.
}

\value{
 Returns \code{\link[base:logical]{TRUE}} if a generic S3/UseMethod function, otherwise \code{\link[base:logical]{FALSE}}.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}




\keyword{programming}
\keyword{methods}
\keyword{internal}
