<!-- ---------------------------------------------------------------------- -->

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version-last-release/hySpc.read.spc)](https://cran.r-project.org/package=hySpc.read.spc)
[![R-CMD-check](https://github.com/r-hyperspec/hySpc.read.spc/workflows/R-CMD-check/badge.svg)](https://github.com/r-hyperspec/hySpc.read.spc/actions)
![Website (pkgdown)](https://github.com/r-hyperspec/hySpc.read.spc/workflows/Website%20(pkgdown)/badge.svg)
[![Codecov](https://codecov.io/gh/r-hyperspec/hySpc.read.spc/branch/develop/graph/badge.svg)](https://codecov.io/gh/r-hyperspec/hySpc.read.spc?branch=develop)
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!--[![metacran downloads](https://cranlogs.r-pkg.org/badges/grand-total/hySpc.read.spc)](https://cran.r-project.org/package=hySpc.read.spc)-->
<!--[![metacran downloads](https://cranlogs.r-pkg.org/badges/hySpc.read.spc)](https://cran.r-project.org/package=hySpc.read.spc)-->
<!-- badges: end -->



<!-- ---------------------------------------------------------------------- -->
# R Package **hySpc.read.spc**
<!-- ---------------------------------------------------------------------- -->
<br>
<center>
<font color="red" size=4>
<b>This package is still under construction.</b>  
So this website is not fully updated yet.  
</font>
</center>
<br>
<!-- ---------------------------------------------------------------------- -->

[**R**](https://www.r-project.org/) package **hySpc.read.spc** is a member of the [**`r-hyperspec`**](https://r-hyperspec.github.io/) packages family, the purpose of which is to import Thermo Galactic's `.spc` file format into a hyperSpec object.


<!-- ---------------------------------------------------------------------- -->

## Documentation

https://r-hyperspec.github.io/hySpc.read.spc

<!--
There are two versions of **hySpc.read.spc** online documentation:

a. for the [released version](https://r-hyperspec.github.io/hySpc.read.spc/) of package,  
b. for the [development version](https://r-hyperspec.github.io/hySpc.read.spc/dev/) of package.
-->

The documentation of the other **`r-hyperspec`** family packages can be found at [r-hyperspec.github.io](https://r-hyperspec.github.io/).

<!-- ---------------------------------------------------------------------- -->

## Issues, Bug Reports and Feature Requests

Issues, bug reports and feature requests should go to an appopriate package's repository:

- if related to this package, use this [link](https://github.com/r-hyperspec/hySpc.read.spc/issues);
- if related to `hyperSpec` package, use this [link](https://github.com/r-hyperspec/hyperSpec/issues).
<!-- ---------------------------------------------------------------------- -->


## Installation

<!--
### Install from CRAN

> **NOTE:** this package is not relesed yet!


You can install the released version of **hySpc.read.spc** from [CRAN](https://cran.r-project.org/package=hySpc.read.spc) with:

```r
install.packages("hySpc.read.spc")
```
-->


### Install from CRAN-like Repository

The **recommended** way to install the in-development version:

```r
repos <- c("https://r-hyperspec.github.io/pkg-repo/", getOption("repos"))
install.packages("hySpc.read.spc", repos = repos)
```


### Install from GitHub

<details>
<summary>Install from GitHub (details)</summary>

You can install the in-development version of the package from [GitHub](https://github.com/r-hyperspec/hySpc.read.spc) too:

```r
if (!require(remotes)) {install.packages("remotes")}
remotes::install_github("r-hyperspec/hySpc.read.spc")
```

**NOTE 1:**
Usually, "Windows" users need to download, install and properly configure **Rtools** (see [these instructions](https://cran.r-project.org/bin/windows/Rtools/)) to make the code above work.

**NOTE 2:**
This method will **not** install package's documentation (help pages and vignettes) into your computer.
So you can either use the [online documentation](https://r-hyperspec.github.io/) or build the package from source (see the next section).

</details>



### Install from Source

<details>
<summary>Install from Source (details)</summary>

1. From the **hySpc.read.spc**'s GitHub [repository](https://github.com/r-hyperspec/hySpc.read.spc):
    - If you use Git, `git clone` the branch of interest.
      You may need to fork it before cloning.
    - Or just chose the branch of interest (1 in Figure below), download a ZIP archive with the code (2, 3) and unzip it on your computer.  
![image](https://user-images.githubusercontent.com/12725868/89338263-ffa1dd00-d6a4-11ea-94c2-fa36ee026691.png)

2. Open the downloaded directory in RStudio (preferably, as an RStudio project).
    - The code below works correctly only if your current working directory coincides with the root of the repository, i.e., if it is in the directory that contains file `README.md`.
    - If you open RStudio project correctly (e.g., by clicking `project.Rproj` icon ![image](https://user-images.githubusercontent.com/12725868/89340903-26621280-d6a9-11ea-8299-0ec5e9cf7e3e.png) in the directory), then the working directory is set correctly by default.

3. In RStudio 'Console' window, run the code (provided below) to:
    a. Install packages **remotes** and **devtools**.
    b. Install **hySpc.read.spc**'s dependencies.
    c. Create **hySpc.read.spc**'s documentation.
    d. Install package **hySpc.read.spc**.

```r
# Do not abort installation even if some packages are not available
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS = "true")

# Install packages remotes and devtools
install.packages(c("remotes", "devtools"))

# Install hySpc.read.spc's dependencies
remotes::install_deps(dependencies = TRUE)

# Create hySpc.read.spc's documentation
devtools::document()

# Install package hySpc.read.spc
devtools::install(build_vignettes = TRUE)
```

**NOTE 1:**
Usually, "Windows" users need to download, install and properly configure **Rtools** (see [these instructions](https://cran.r-project.org/bin/windows/Rtools/)) to make the code above work.

</details>
