%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  999.package.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{R.methodsS3-package}
\alias{R.methodsS3-package}
\alias{R.methodsS3}
\docType{package}

\title{Package R.methodsS3}


\description{
 Methods that simplify the setup of S3 generic functions and S3 methods.  Major effort has been made in making definition of methods as simple as possible with a minimum of maintenance for package developers.  For example, generic functions are created automatically, if missing, and naming conflict are automatically solved, if possible.  The method setMethodS3() is a good start for those who in the future may want to migrate to S4.  This is a cross-platform package implemented in pure R that generates standard S3 methods.
 This contents of this package was extracted from the
 \pkg{R.oo} package [1].
}

\section{Installation and updates}{
  To install this package do\cr

  \code{install.packages("R.methodsS3")}

  To get the "devel" version, see \url{http://www.braju.com/R/}.
}

\section{Dependancies and other requirements}{
  This package only requires a standard \R installation.
}

\section{To get started}{
  To get started, see:
  \enumerate{
    \item \code{\link{setMethodS3}}() - Simple and safe creation of S3 methods
        and, whenever needed,  automatic creation of S3 generic function.
  }
}

\section{Further readings}{
  For a detailed introduction to the package, see [1].
}

\section{How to cite this package}{
  Whenever using this package, please cite [1] as\cr

  \preformatted{@INPROCEEDINGS{BengtssonH_2003,
 author       = {Henrik Bengtsson},
 title        = {The {R.oo} package - Object-Oriented Programming
                 with References Using Standard {R} Code},
 booktitle    = {Proceedings of the 3rd International Workshop on
                 Distributed Statistical Computing (DSC 2003)},
 year         = {2003},
 editor       = {Kurt Hornik and Friedrich Leisch and Achim Zeileis},
 address      = {Vienna, Austria},
 month        = {March},
 issn         = {1609-395X},
 howpublished = {http://www.ci.tuwien.ac.at/Conferences/DSC-2003/},
}}
\emph{}

}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\section{License}{
  The releases of this package is licensed under
  LGPL version 2.1 or newer.
}

\references{
 [1] H. Bengtsson, \emph{The R.oo package - Object-Oriented Programming with References Using Standard R Code}, In Kurt Hornik, Friedrich Leisch and Achim Zeileis, editors, Proceedings of the 3rd International Workshop on Distributed Statistical Computing (DSC 2003), March 20-22, Vienna, Austria. \url{http://www.ci.tuwien.ac.at/Conferences/DSC-2003/Proceedings/}
 \cr
}
\keyword{package}
