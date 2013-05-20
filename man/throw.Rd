%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  throw.default.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{throw}
\alias{throw.default}
\alias{throw}

\title{Throws an exception}

\description{
 Throws an exception by calling stop().

 Note that \code{throw()} can be defined for specific classes, which can
 then be caught (or not) using \code{\link[base:conditions]{tryCatch}}().

 \emph{This default function will be overridden by ditto in the \pkg{R.oo}
 package, if that is loaded.  The latter \code{\link[R.oo]{throw}} implementation
 is fully backward compatible with this one, but the error object thrown
 is of class \code{\link[R.oo]{Exception}}.}
}

\usage{
\method{throw}{default}(...)
}

\arguments{
  \item{...}{One or several strings that are concatenated and collapsed
      into on message string.}
}

\value{
  Returns nothing.
}

\examples{
  rbern <- function(n=1, prob=1/2) {
    if (prob < 0 || prob > 1)
      throw("Argument 'prob' is out of range: ", prob)
    rbinom(n=n, size=1, prob=prob)
  }

  rbern(10, 0.4)
  # [1] 0 1 0 0 0 1 0 0 1 0
  tryCatch(rbern(10, 10*0.4),
    error=function(ex) {}
  )
}

\author{Henrik Bengtsson}

\keyword{error}

