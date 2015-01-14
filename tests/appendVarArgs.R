library("R.methodsS3")

foobar <- function(a=1) print(a)
print(foobar)

foobar <- appendVarArgs(foobar)
print(foobar)

foobar <- appendVarArgs(foobar)
print(foobar)
