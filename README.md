[![Travis-CI Build Status](https://travis-ci.org/casact/raw_package.svg?branch=master)](https://travis-ci.org/casact/raw_package)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/raw)](https://cran.r-project.org/package=raw)
[![Downloads from the RStudio CRAN mirror](http://cranlogs.r-pkg.org/badges/grand-total/raw)](https://cran.r-project.org/package=raw)

raw
===

In order to facilitate R instruction for actuaries, we have organized
several sets of publicly available data of interest to non-life
actuaries. In addition, we suggest a set of packages, which most
practicing actuaries will use routinely. Finally, there is an R markdown
skeleton for basic reserve analysis.

    install.packages("raw")
    raw::InstallSuggestions()

For speedy install on Windows, you can use 

    raw::InstallSuggestions(type = 'binary')
