# CRAN submission R.methodsS3 1.8.2

on 2022-06-13

I've verified this submission has no negative impact on any of the 32 reverse package dependencies available on CRAN and Bioconductor.

Thanks in advance


## Notes not sent to CRAN

### R CMD check validation

The package has been verified using `R CMD check --as-cran` on:

| R version     | GitHub | R-hub    | mac/win-builder |
| ------------- | ------ | -------- | --------------- |
| 3.4.x         | L      |          |                 |
| 3.6.x         | L      |          |                 |
| 4.0.x         | L      |          |                 |
| 4.1.x         | L M W  |          |                 |
| 4.2.x         | L M W  | L M M1 W | M1 W            |
| devel         | L . W  | L        |    W            |

*Legend: OS: L = Linux, M = macOS, M1 = macOS M1, W = Windows*


R-hub checks:

```r
res <- rhub::check(platform = c(
  "debian-clang-devel", "debian-gcc-patched", "linux-x86_64-centos-epel",
  "macos-highsierra-release-cran", "macos-m1-bigsur-release",
  "windows-x86_64-release"))
print(res)
```

gives

```
── future.tools 0.0.0-9021: OK

  Build ID:   future.tools_0.0.0-9021.tar.gz-a61d11fcd28d42aeb177135e55c420c1
  Platform:   Debian Linux, R-devel, clang, ISO-8859-15 locale
  Submitted:  9m 7.8s ago
  Build time: 9m 6.1s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

── future.tools 0.0.0-9021: OK

  Build ID:   future.tools_0.0.0-9021.tar.gz-302d0f7ed27a4e31b5766e94dcfaac0c
  Platform:   Debian Linux, R-patched, GCC
  Submitted:  9m 7.8s ago
  Build time: 7m 58.3s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

── future.tools 0.0.0-9021: OK

  Build ID:   future.tools_0.0.0-9021.tar.gz-f7e78dc725404dafb36c2f038470f539
  Platform:   CentOS 8, stock R from EPEL
  Submitted:  9m 7.8s ago
  Build time: 7m 12.2s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

── future.tools 0.0.0-9021: OK

  Build ID:   future.tools_0.0.0-9021.tar.gz-3108f834627b41bc8ded182fa9003089
  Platform:   macOS 10.13.6 High Sierra, R-release, CRAN's setup
  Submitted:  9m 7.8s ago
  Build time: 2m 6.4s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

── future.tools 0.0.0-9021: OK

  Build ID:   future.tools_0.0.0-9021.tar.gz-c6874d3f96824e319dd7592d30eedc2c
  Platform:   Apple Silicon (M1), macOS 11.6 Big Sur, R-release
  Submitted:  9m 7.8s ago
  Build time: 1m 26s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

── future.tools 0.0.0-9021: OK

  Build ID:   future.tools_0.0.0-9021.tar.gz-2d28c1fdb9eb47d48c3742eaaa2a70ac
  Platform:   Windows Server 2008 R2 SP1, R-release, 32/64 bit
  Submitted:  9m 7.8s ago
  Build time: 3m 28.9s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```
