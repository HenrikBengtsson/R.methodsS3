library("R.methodsS3")

for (quietly in c(NA, FALSE, TRUE)) {
  msg <- sprintf("Hello world! (quietly=%s)", quietly)
  pkgStartupMessage(msg, quietly=quietly)
}
