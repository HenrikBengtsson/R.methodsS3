# aroma.core

<details>

* Version: 3.2.2
* GitHub: https://github.com/HenrikBengtsson/aroma.core
* Source code: https://github.com/cran/aroma.core
* Date/Publication: 2021-01-05 05:10:12 UTC
* Number of recursive dependencies: 48

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

* Version: 3.26.0
* GitHub: https://github.com/HenrikBengtsson/aroma.light
* Source code: https://github.com/cran/aroma.light
* Date/Publication: 2022-04-26
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

# bioCancer

<details>

* Version: 1.24.01
* GitHub: https://github.com/kmezhoud/bioCancer
* Source code: https://github.com/cran/bioCancer
* Date/Publication: 2022-04-27
* Number of recursive dependencies: 220

Run `revdep_details(, "bioCancer")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.1Mb
      sub-directories of 1Mb or more:
        app       3.2Mb
        doc       2.8Mb
        extdata   1.5Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘AlgDesign’ ‘GO.db’ ‘R.methodsS3’ ‘import’ ‘methods’ ‘org.Bt.eg.db’
      ‘shinythemes’
      All declared Imports should be used.
    ```

# canceR

<details>

* Version: 1.30.01
* GitHub: https://github.com/kmezhoud/canceR
* Source code: https://github.com/cran/canceR
* Date/Publication: 2022-04-27
* Number of recursive dependencies: 166

Run `revdep_details(, "canceR")` for more info

</details>

## In both

*   checking whether package ‘canceR’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: loading Rplot failed
      Warning: no DISPLAY variable so Tk is not available
    See ‘/c4/home/henrik/repositories/R.methodsS3/revdep/checks/canceR/new/canceR.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 19.7Mb
      sub-directories of 1Mb or more:
        doc  18.2Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R.methodsS3’
      All declared Imports should be used.
    ```

# DEGraph

<details>

* Version: 1.48.0
* GitHub: NA
* Source code: https://github.com/cran/DEGraph
* Date/Publication: 2022-04-26
* Number of recursive dependencies: 80

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

# NCIgraph

<details>

* Version: 1.44.0
* GitHub: NA
* Source code: https://github.com/cran/NCIgraph
* Date/Publication: 2022-04-26
* Number of recursive dependencies: 45

Run `revdep_details(, "NCIgraph")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘DEGraph’
    ```

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .BBSoptions
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

# roxygen2

<details>

* Version: 7.2.0
* GitHub: https://github.com/r-lib/roxygen2
* Source code: https://github.com/cran/roxygen2
* Date/Publication: 2022-05-13 07:30:02 UTC
* Number of recursive dependencies: 63

Run `revdep_details(, "roxygen2")` for more info

</details>

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘devtools’
    ```

# tmle.npvi

<details>

* Version: 0.10.0
* GitHub: NA
* Source code: https://github.com/cran/tmle.npvi
* Date/Publication: 2015-05-22 18:59:02
* Number of recursive dependencies: 41

Run `revdep_details(, "tmle.npvi")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tmle-npvi.Rnw’ using knitr
    Error: processing vignette 'tmle-npvi.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'tmle-npvi.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `manfnt.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.59 \usepackage
                    [textwidth=15cm, textheight=23cm]{geometry}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘tmle-npvi.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘tmle-npvi.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking R code for possible problems ... NOTE
    ```
    NPVI: no visible global function definition for ‘quantile’
    SL.glm.condExpX2givenW: no visible global function definition for
      ‘as.formula’
    SL.glm.condExpX2givenW: no visible global function definition for ‘glm’
    SL.glm.condExpXYgivenW: no visible global function definition for
      ‘as.formula’
    SL.glm.condExpXYgivenW: no visible global function definition for ‘glm’
    SL.glm.g: no visible global function definition for ‘as.formula’
    SL.glm.g: no visible global function definition for ‘glm’
    SL.glm.theta: no visible global function definition for ‘as.formula’
    ...
      as.formula binomial dnorm gaussian glm head integrate model.matrix
      optimize plogis pnorm qlogis qnorm quantile rnorm runif sd str tail
      update var
    Consider adding
      importFrom("stats", "as.formula", "binomial", "dnorm", "gaussian",
                 "glm", "integrate", "model.matrix", "optimize", "plogis",
                 "pnorm", "qlogis", "qnorm", "quantile", "rnorm", "runif",
                 "sd", "update", "var")
      importFrom("utils", "head", "str", "tail")
    to your NAMESPACE file.
    ```

