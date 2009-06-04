%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  isGenericS3.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{isGenericS4}
\alias{isGenericS4.default}
\alias{isGenericS4}

\title{Checks if a function is a S4 generic function}

\description{
 Checks if a function is a S4 generic function.
}

\usage{\method{isGenericS4}{default}(fcn, ...)}

\arguments{
  \item{fcn}{A \code{\link[base]{function}} or a \code{\link[base]{character}} string.}
  \item{...}{Not used.}
}

\details{
  A function is considered to be a generic S4 function if its
  body, that is the source code, contains the regular pattern
  \code{"standardGeneric"}.
}

\value{
 Returns \code{\link[base:logical]{TRUE}} if a generic S4 function, otherwise \code{\link[base:logical]{FALSE}}.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}




\keyword{programming}
\keyword{methods}
\keyword{internal}
