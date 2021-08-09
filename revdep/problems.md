# aroma.affymetrix

<details>

* Version: 3.2.0
* GitHub: https://github.com/HenrikBengtsson/aroma.affymetrix
* Source code: https://github.com/cran/aroma.affymetrix
* Date/Publication: 2019-06-23 06:00:14 UTC
* Number of recursive dependencies: 73

Run `revdep_details(, "aroma.affymetrix")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.0Mb
      sub-directories of 1Mb or more:
        R             4.0Mb
        help          2.1Mb
        testScripts   1.1Mb
    ```

# aroma.core

<details>

* Version: 3.2.2
* GitHub: https://github.com/HenrikBengtsson/aroma.core
* Source code: https://github.com/cran/aroma.core
* Date/Publication: 2021-01-05 05:10:12 UTC
* Number of recursive dependencies: 47

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

* Version: 3.22.0
* GitHub: https://github.com/HenrikBengtsson/aroma.light
* Source code: https://github.com/cran/aroma.light
* Date/Publication: 2021-05-19
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

# DEGraph

<details>

* Version: 1.44.0
* GitHub: NA
* Source code: https://github.com/cran/DEGraph
* Date/Publication: 2021-05-19
* Number of recursive dependencies: 87

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

* Version: 1.40.0
* GitHub: NA
* Source code: https://github.com/cran/NCIgraph
* Date/Publication: 2021-05-19
* Number of recursive dependencies: 59

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

* Version: 7.1.1
* GitHub: https://github.com/r-lib/roxygen2
* Source code: https://github.com/cran/roxygen2
* Date/Publication: 2020-06-27 14:50:02 UTC
* Number of recursive dependencies: 80

Run `revdep_details(, "roxygen2")` for more info

</details>

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(roxygen2)
      > 
      > if (requireNamespace("xml2")) {
      +   test_check("roxygen2", reporter = MultiReporter$new(reporters = list(JunitReporter$new(file = "test-results.xml"), CheckReporter$new())))
      + } else {
      +   test_check("roxygen2")
    ...
       2.   └─testthat::expect_equal(s1, s2) helper-test.R:12:2
      
      [ FAIL 1 | WARN 0 | SKIP 13 | PASS 733 ]
      Error: Test failures
      In addition: Warning messages:
      1: closing unused connection 7 (/scratch/henrik/RtmpmZrBVV/file20e23e1aaa93) 
      2: closing unused connection 6 (/scratch/henrik/RtmpmZrBVV/file20e266395332) 
      3: closing unused connection 5 (/scratch/henrik/RtmpmZrBVV/file20e2138ea3e0) 
      4: closing unused connection 4 (/scratch/henrik/RtmpmZrBVV/file20e279955c39) 
      Execution halted
    ```

# tmle.npvi

<details>

* Version: 0.10.0
* GitHub: NA
* Source code: https://github.com/cran/tmle.npvi
* Date/Publication: 2015-05-22 18:59:02
* Number of recursive dependencies: 43

Run `revdep_details(, "tmle.npvi")` for more info

</details>

## In both

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

