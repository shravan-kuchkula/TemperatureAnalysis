Introduction to Data
================
Shravan Kuchkula

-   [Language of data](#language-of-data)

Language of data
----------------

We will first start by exploring the `high school and beyond` **hsb2** dataset which part of the `openintro` package. Notice here that if we are loading a dataset which is part of a package, we will be using the `data()` function to load the dataset. Other ways to import data into R would be from flatfiles, websites, APIs etc.

As usual, we will use our function to install/load the required packages into this session.

``` r
# Install a package and load it.
installRequiredPackages <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[,"Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# List of packages used in this session
libs <- c("dplyr", "ggplot2", "tidyr", "openintro")

# call the function
installRequiredPackages(libs)
```

    ##     dplyr   ggplot2     tidyr openintro 
    ##      TRUE      TRUE      TRUE      TRUE

Load the dataset `hsb2`

``` r
data("hsb2")
```

Glimpse the dataset `hsb2`

``` r
glimpse(hsb2)
```

    ## Observations: 200
    ## Variables: 11
    ## $ id      <int> 70, 121, 86, 141, 172, 113, 50, 11, 84, 48, 75, 60, 95...
    ## $ gender  <chr> "male", "female", "male", "male", "male", "male", "mal...
    ## $ race    <chr> "white", "white", "white", "white", "white", "white", ...
    ## $ ses     <fctr> low, middle, high, high, middle, middle, middle, midd...
    ## $ schtyp  <fctr> public, public, public, public, public, public, publi...
    ## $ prog    <fctr> general, vocational, general, vocational, academic, a...
    ## $ read    <int> 57, 68, 44, 63, 47, 44, 50, 34, 63, 57, 60, 57, 73, 54...
    ## $ write   <int> 52, 59, 33, 44, 52, 52, 59, 46, 57, 55, 46, 65, 60, 63...
    ## $ math    <int> 41, 53, 54, 47, 57, 51, 42, 45, 54, 52, 51, 51, 71, 57...
    ## $ science <int> 47, 63, 58, 53, 53, 63, 53, 39, 58, 50, 53, 63, 61, 55...
    ## $ socst   <int> 57, 61, 31, 56, 61, 61, 61, 36, 51, 51, 61, 61, 71, 46...
