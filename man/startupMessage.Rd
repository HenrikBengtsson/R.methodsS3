%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  startupMessage.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{startupMessage}
\alias{startupMessage.default}
\alias{startupMessage}

\title{Generates a (package) startup message}

\description{
  Generates a (package) startup message.
}

\usage{
\method{startupMessage}{default}(..., quietly=NA)
}

\arguments{
  \item{...}{Arguments passed to \code{\link[base]{packageStartupMessage}}().}
  \item{quietly}{If \code{\link[base:logical]{FALSE}}, the message is outputed, otherwise not.
    If \code{\link[base]{NA}}, the message is \emph{not} outputted if \code{\link[base]{library}}()
    (or \code{require()}) was called with argument \code{quietly=TRUE}.}
}

\value{
  Returns nothing.
}

\author{Henrik Bengtsson}

\seealso{
  \code{\link[base]{packageStartupMessage}}().
}


\keyword{internal}
