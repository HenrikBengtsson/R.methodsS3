# aroma.core

<details>

* Version: 3.3.0
* GitHub: https://github.com/HenrikBengtsson/aroma.core
* Source code: https://github.com/cran/aroma.core
* Date/Publication: 2022-11-15 18:30:13 UTC
* Number of recursive dependencies: 72

Run `revdep_details(, "aroma.core")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      'sfit', 'expectile', 'HaarSeg', 'mpcbs'
    ```

# aroma.light

<details>

* Version: 3.30.0
* GitHub: https://github.com/HenrikBengtsson/aroma.light
* Source code: https://github.com/cran/aroma.light
* Date/Publication: 2023-04-25
* Number of recursive dependencies: 6

Run `revdep_details(, "aroma.light")` for more info

</details>

## In both

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      inst/rsp/.rspPlugins
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) averageQuantile.Rd:49: Escaped LaTeX specials: \&
    checkRd: (-1) normalizeQuantileRank.Rd:97: Escaped LaTeX specials: \&
    checkRd: (-1) normalizeQuantileRank.matrix.Rd:83: Escaped LaTeX specials: \&
    ```

# bioCancer

<details>

* Version: 1.28.0
* GitHub: https://github.com/kmezhoud/bioCancer
* Source code: https://github.com/cran/bioCancer
* Date/Publication: 2023-04-25
* Number of recursive dependencies: 224

Run `revdep_details(, "bioCancer")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘AlgDesign’ ‘GO.db’ ‘R.methodsS3’ ‘import’ ‘methods’ ‘org.Bt.eg.db’
      ‘shinythemes’
      All declared Imports should be used.
    ```

*   checking R code for possible problems ... NOTE
    ```
    getGenesClassification: no visible global function definition for ‘new’
    Undefined global functions or variables:
      new
    Consider adding
      importFrom("methods", "new")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

*   checking Rd \usage sections ... NOTE
    ```
    S3 methods shown with full name in documentation object 'getCancerStudies.CGDS':
      ‘getCancerStudies.CGDS’
    
    S3 methods shown with full name in documentation object 'getCaseLists.CGDS':
      ‘getCaseLists.CGDS’
    
    S3 methods shown with full name in documentation object 'getClinicalData.CGDS':
      ‘getClinicalData.CGDS’
    
    S3 methods shown with full name in documentation object 'getGeneticProfiles.CGDS':
    ...
    S3 methods shown with full name in documentation object 'setVerbose.CGDS':
      ‘setVerbose.CGDS’
    
    S3 methods shown with full name in documentation object 'test.CGDS':
      ‘test.CGDS’
    
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# canceR

<details>

* Version: 1.34.0
* GitHub: https://github.com/kmezhoud/canceR
* Source code: https://github.com/cran/canceR
* Date/Publication: 2023-04-25
* Number of recursive dependencies: 169

Run `revdep_details(, "canceR")` for more info

</details>

## In both

*   checking whether package ‘canceR’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: loading Rplot failed
      Warning: no DISPLAY variable so Tk is not available
    See ‘/wynton/home/cbi/hb/repositories/R.methodsS3/revdep/checks/canceR/new/canceR.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R.methodsS3’
      All declared Imports should be used.
    ```

*   checking Rd \usage sections ... NOTE
    ```
    S3 methods shown with full name in documentation object 'cbind.na':
      ‘cbind.na’
    
    S3 methods shown with full name in documentation object 'rbind.na':
      ‘rbind.na’
    
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# DEGraph

<details>

* Version: 1.52.0
* GitHub: NA
* Source code: https://github.com/cran/DEGraph
* Date/Publication: 2023-04-25
* Number of recursive dependencies: 66

Run `revdep_details(, "DEGraph")` for more info

</details>

## In both

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .BBSoptions
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘graph’ ‘KEGGgraph’ ‘lattice’ ‘RBGL’ ‘rrcov’ ‘Rgraphviz’ ‘NCIgraph’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Package in Depends field not imported from: ‘R.utils’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    Unexported object imported by a ':::' call: ‘graph:::getIndices’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking for non-standard things in the check directory ... NOTE
    ```
    Found the following files/directories:
      ‘randomWAMGraph.xml’
    ```

# R.devices

<details>

* Version: 2.17.1
* GitHub: https://github.com/HenrikBengtsson/R.devices
* Source code: https://github.com/cran/R.devices
* Date/Publication: 2022-06-21 08:00:02 UTC
* Number of recursive dependencies: 8

Run `revdep_details(, "R.devices")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    There are ::: calls to the package's namespace in its code. A package
      almost never needs to use ::: for its own objects:
      ‘devAll’
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘R.devices-overview.tex.rsp’ using rsp
    R.devices v2.17.1 (2022-06-21 08:00:02 UTC) successfully loaded. See ?R.devices for help.
    Error: processing vignette 'R.devices-overview.tex.rsp' failed with diagnostics:
    Running 'texi2dvi' on 'R.devices-overview.tex' failed.
    LaTeX errors:
    ! Undefined control sequence.
    l.55 \pdfsuppressptexinfo
                             =-1
    ...
    See the LaTeX manual or LaTeX Companion for explanation.
    Type  H <return>  for immediate help.
     ...                                              
    --- failed re-building ‘R.devices-overview.tex.rsp’
    
    SUMMARY: processing the following file failed:
      ‘R.devices-overview.tex.rsp’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# R.rsp

<details>

* Version: 0.45.0
* GitHub: https://github.com/HenrikBengtsson/R.rsp
* Source code: https://github.com/cran/R.rsp
* Date/Publication: 2022-06-27 18:30:09 UTC
* Number of recursive dependencies: 19

Run `revdep_details(, "R.rsp")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘R_packages-Static_PDF_and_HTML_vignettes.pdf.asis’ using asis
    --- finished re-building ‘R_packages-Static_PDF_and_HTML_vignettes.pdf.asis’
    
    --- re-building ‘R_packages-LaTeX_vignettes.ltx’ using tex
    Error: processing vignette 'R_packages-LaTeX_vignettes.ltx' failed with diagnostics:
    Running 'texi2dvi' on 'R_packages-LaTeX_vignettes.ltx' failed.
    LaTeX errors:
    ! Undefined control sequence.
    l.21 \pdfsuppressptexinfo
    ...
     ...                                              
    --- failed re-building ‘R_packages-Vignettes_prior_to_R300.tex.rsp’
    
    SUMMARY: processing the following files failed:
      ‘R_packages-LaTeX_vignettes.ltx’
      ‘Dynamic_document_creation_using_RSP.tex.rsp’ ‘RSP_refcard.tex.rsp’
      ‘R_packages-Vignettes_prior_to_R300.tex.rsp’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# roxygen2

<details>

* Version: 7.2.3
* GitHub: https://github.com/r-lib/roxygen2
* Source code: https://github.com/cran/roxygen2
* Date/Publication: 2022-12-08 23:40:02 UTC
* Number of recursive dependencies: 67

Run `revdep_details(, "roxygen2")` for more info

</details>

## In both

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
    ```

# rtf

<details>

* Version: 0.4-14.1
* GitHub: https://github.com/schaffman5/rtf
* Source code: https://github.com/cran/rtf
* Date/Publication: 2020-03-22 09:32:44 UTC
* Number of recursive dependencies: 33

Run `revdep_details(, "rtf")` for more info

</details>

## In both

*   checking for non-standard things in the check directory ... NOTE
    ```
    Found the following files/directories:
      ‘test_addPageBreak.doc’ ‘test_addPlot.doc’ ‘test_addSessionInfo.doc’
      ‘test_addTable.doc’
    ```

