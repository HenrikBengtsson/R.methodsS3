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

\usage{\method{getMethodS3}{default}(name, class="default", envir=parent.frame(), ...)}

\arguments{
  \item{name}{The name of the method.}
  \item{class}{The class of the method.}
  \item{envir}{The \code{\link[base]{environment}} from which the search for the
    S3 method is done.}
  \item{...}{Not used.}
}

\seealso{
  This is just a conveniency wrapper around \code{\link[utils]{getS3method}}
  that have arguments consistent with \code{\link{setMethodS3}}().
  \code{\link{getGenericS3}}().
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}



\keyword{programming}
\keyword{methods}
