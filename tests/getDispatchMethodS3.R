library("R.methodsS3")

message("TESTING: getDispatchMethodS3()...")

fcn <- getDispatchMethodS3("print", "default")
print(fcn)

tryCatch({
  fcn <- getDispatchMethodS3("print", "unknown")
  print(fcn)
}, error = function(ex) {
  print(ex)
})


## Odds and ends
# Trying to retrieve base::.Options, but should be
# detected as a non-function and return an empty result
fcn <- findDispatchMethodsS3("", "Options")
stopifnot(length(fcn) == 0L)

message("TESTING: getDispatchMethodS3()...DONE")
