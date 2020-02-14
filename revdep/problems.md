# aroma.affymetrix

<details>

* Version: 3.2.0
* Source code: https://github.com/cran/aroma.affymetrix
* URL: https://www.aroma-project.org/, https://github.com/HenrikBengtsson/aroma.affymetrix
* BugReports: https://github.com/HenrikBengtsson/aroma.affymetrix/issues
* Date/Publication: 2019-06-23 06:00:14 UTC
* Number of recursive dependencies: 75

Run `revdep_details(,"aroma.affymetrix")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        R             2.3Mb
        help          1.1Mb
        testScripts   1.3Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Error in setGeneric("getX", function(object, type) standardGeneric("getX")) : 
      could not find function "setGeneric"
    ```

# aroma.core

<details>

* Version: 3.2.1
* Source code: https://github.com/cran/aroma.core
* URL: https://github.com/HenrikBengtsson/aroma.core, https://www.aroma-project.org/
* BugReports: https://github.com/HenrikBengtsson/aroma.core/issues
* Date/Publication: 2020-02-04 15:20:21 UTC
* Number of recursive dependencies: 47

Run `revdep_details(,"aroma.core")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      'sfit', 'expectile', 'HaarSeg', 'mpcbs'
    ```

# aroma.light

<details>

* Version: 3.16.0
* Source code: https://github.com/cran/aroma.light
* URL: https://github.com/HenrikBengtsson/aroma.light, https://www.aroma-project.org
* BugReports: https://github.com/HenrikBengtsson/aroma.light/issues
* Date/Publication: 2019-10-29
* Number of recursive dependencies: 6

Run `revdep_details(,"aroma.light")` for more info

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

* Version: 1.38.0
* Source code: https://github.com/cran/DEGraph
* Date/Publication: 2019-10-29
* Number of recursive dependencies: 40

Run `revdep_details(,"DEGraph")` for more info

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

*   checking R code for possible problems ... NOTE
    ```
    ...
    twoSampleFromGraph: no visible global function definition for ‘rnorm’
    writeAdjacencyMatrix2KGML: no visible binding for global variable
      ‘Arguments’
    writeAdjacencyMatrix2KGML: no visible global function definition for
      ‘pushState’
    writeAdjacencyMatrix2KGML: no visible global function definition for
      ‘popState’
    writeAdjacencyMatrix2KGML : <anonymous>: no visible global function
      definition for ‘na.omit’
    Undefined global functions or variables:
      Arguments ProgressBar as enter exit heat.colors increase na.omit
      phyper pnorm popState pushState quantile reset rnorm str
      translateNCI2GeneID var
    Consider adding
      importFrom("grDevices", "heat.colors")
      importFrom("methods", "as")
      importFrom("stats", "na.omit", "phyper", "pnorm", "quantile", "rnorm",
                 "var")
      importFrom("utils", "str")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

# IdMappingRetrieval

<details>

* Version: 1.34.0
* Source code: https://github.com/cran/IdMappingRetrieval
* Date/Publication: 2019-10-29
* Number of recursive dependencies: 60

Run `revdep_details(,"IdMappingRetrieval")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘IdMappingRetrieval-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: addServices.ServiceManager
    > ### Title: Add services to the ServiceManager object
    > ### Aliases: addServices.ServiceManager ServiceManager.addServices
    > ###   addServices.ServiceManager addServices,ServiceManager-method
    > ### Keywords: internal methods
    > 
    > ### ** Examples
    > 
    >  #create empty service manager object
    >  svm<-ServiceManager(ServiceManager$getDefaultServices());
    >  print(names(getServices(svm)))
    Error in UseMethod("getServices") : 
      no applicable method for 'getServices' applied to an object of class "c('ServiceManager', 'Object')"
    Calls: print -> getServices
    Execution halted
    ```

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .BBSoptions
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘RCurl’ ‘XML’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking S3 generic/method consistency ... NOTE
    ```
    Found the following apparent S3 methods exported but not registered:
      addServices.ServiceManager getDataFrame.Annotation
      getDataFrameList.ServiceManager getFolderName.Annotation
      getIdMap.Annotation getIdMapList.ServiceManager
      getServiceRoot.Annotation getServices.ServiceManager
      setOptions.Annotation setServices.ServiceManager
    See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
    manual.
    ```

# NCIgraph

<details>

* Version: 1.34.0
* Source code: https://github.com/cran/NCIgraph
* Date/Publication: 2019-10-29
* Number of recursive dependencies: 27

Run `revdep_details(,"NCIgraph")` for more info

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

# sisal

<details>

* Version: 0.46
* Source code: https://github.com/cran/sisal
* Date/Publication: 2015-10-10 15:45:32
* Number of recursive dependencies: 36

Run `revdep_details(,"sisal")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    ...
        naStripes = "grey50")
    where 8: do.call("sisalTable", fArgs)
    where 9: getDispatchMethodS3("plotSelected", class(x[[1]]))(x, ...)
    where 10: plotSelected.list(toy1.2, yLabels = c("+1", "+2"), main = "Toy time series", 
        xlab = expression(paste("input variables ", italic(y[t + 
            l]))), ylab = expression(paste("output ", italic(y[t + 
            k]))), pickIntPart = TRUE, intTransform = function(x) -x)
    where 11: plotSelected(toy1.2, yLabels = c("+1", "+2"), main = "Toy time series", 
        xlab = expression(paste("input variables ", italic(y[t + 
            l]))), ylab = expression(paste("output ", italic(y[t + 
            k]))), pickIntPart = TRUE, intTransform = function(x) -x)
    
     --- value of length: 10 type: logical ---
     [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
     --- function from context --- 
     --- function search by body ---
     ----------- END OF FAILURE REPORT -------------- 
    Error in is.finite(xAxisWidth) && xAxisWidth >= 0 && is.finite(xAxisHeight) &&  : 
      'length(x) = 10 > 1' in coercion to 'logical(1)'
    Calls: plotSelected ... validDetails -> validDetails.sisalTable -> stopifnot
    Execution halted
    ```

# tmle.npvi

<details>

* Version: 0.10.0
* Source code: https://github.com/cran/tmle.npvi
* Date/Publication: 2015-05-22 18:59:02
* Number of recursive dependencies: 43

Run `revdep_details(,"tmle.npvi")` for more info

</details>

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
    tmle.npvi.: no visible global function definition for ‘update’
    update.NPVI: no visible global function definition for ‘gaussian’
    updateConv.NPVI: no visible global function definition for ‘tail’
    updateGNonTab.NPVI : g1: no visible binding for global variable
      ‘qlogis’
    updateGNonTab.NPVI : g1: no visible binding for global variable
      ‘plogis’
    updateGTab.NPVI: no visible binding for global variable ‘qlogis’
    updateGTab.NPVI: no visible binding for global variable ‘plogis’
    updatePsi.NPVI: no visible global function definition for ‘str’
    Undefined global functions or variables:
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

