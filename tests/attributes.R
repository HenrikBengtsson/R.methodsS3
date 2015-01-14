library("R.methodsS3")

foo <- function() NULL
str(foo)

foo <- export(foo)
str(foo)

foo <- export(foo, TRUE)
str(foo)

foo <- noexport(foo)
str(foo)

foo.Bar <- function(...) NULL
foo.Bar <- S3class(foo.Bar, "Bar")
str(foo)




