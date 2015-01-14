library("R.methodsS3")

fcn <- getDispatchMethodS3("print", "default")
print(fcn)

tryCatch({
  fcn <- getDispatchMethodS3("print", "unknown")
  print(fcn)
}, error = function(ex) {
  print(ex)
})
