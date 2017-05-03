Intro to time series in R
================

In this notebook, we will learn to use R for time series analysis and forecasting. We will also learn, basic `time series models` :

-   **White Noise (WN)**
-   **Random Walk (RW)**
-   **Autoregression (AR)**
-   **Simple Moving Average (MA)**

Exploring raw time series:
--------------------------

The most common first step when conducting time series analysis is to display your time series dataset in a visually intuitive format. The most useful way to view raw time series data in R is to use the `print()` command, which displays the Start, End, and Frequency of your data along with the observations.

Here, we will use the `Nile` dataset which is part of the `datasets` package, which is loaded by default.

``` r
print(Nile)
```

    ## Time Series:
    ## Start = 1871 
    ## End = 1970 
    ## Frequency = 1 
    ##   [1] 1120 1160  963 1210 1160 1160  813 1230 1370 1140  995  935 1110  994
    ##  [15] 1020  960 1180  799  958 1140 1100 1210 1150 1250 1260 1220 1030 1100
    ##  [29]  774  840  874  694  940  833  701  916  692 1020 1050  969  831  726
    ##  [43]  456  824  702 1120 1100  832  764  821  768  845  864  862  698  845
    ##  [57]  744  796 1040  759  781  865  845  944  984  897  822 1010  771  676
    ##  [71]  649  846  812  742  801 1040  860  874  848  890  744  749  838 1050
    ##  [85]  918  986  797  923  975  815 1020  906  901 1170  912  746  919  718
    ##  [99]  714  740

Another useful command for viewing time series data in R is the `length()` function, which tells you the total number of observations in your data.

``` r
# List the number of observations in the Nile dataset
length(Nile)
```

    ## [1] 100

Basic time series plot
----------------------

While simple commands such as print(), length(), head(), and tail() provide crucial information about your time series data, another very useful way to explore any data is to generate a plot.

In this exercise, you will plot the River Nile annual streamflow data using the plot() function. For time series data objects such as Nile, a Time index for the horizontal axis is typically included. From the previous exercise, you know that this data spans from 1871 to 1970, and horizontal tick marks are labeled as such. The default label of "Time" is not very informative. Since these data are annual measurements, you should use the label "Year". While you're at it, you should change the vertical axis label to "River Volume (1e9 m^{3})".

Additionally, it helps to have an informative title, which can be set using the argument main. For your purposes, a useful title for this figure would be "Annual River Nile Volume at Aswan, 1871-1970".

Finally, the default plotting type for time series objects is "l" for line. Connecting consecutive observations can help make a time series plot more interpretable. Sometimes it is also useful to include both the observations points as well as the lines, and we instead use "b" for both.

``` r
# Plot the Nile data
plot(Nile)
```

![](TimeSeries_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
# Plot the Nile data with xlab and ylab arguments
plot(Nile, xlab = "Year", ylab = "River Volume (1e9 m^{3})")
```

![](TimeSeries_files/figure-markdown_github/unnamed-chunk-3-2.png)

``` r
# Plot the Nile data with xlab, ylab, main, and type arguments

plot(Nile, xlab = "Year", ylab = "River Volume (1e9 m^{3})", main = "Annual River Nile Volume at Aswan, 1871-1970", type="b")
```

![](TimeSeries_files/figure-markdown_github/unnamed-chunk-3-3.png)

This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you execute code within the notebook, the results appear beneath the code.

Try executing this chunk by clicking the *Run* button within the chunk or by placing your cursor inside it and pressing *Cmd+Shift+Enter*.

``` r
plot(cars)
```

![](TimeSeries_files/figure-markdown_github/unnamed-chunk-4-1.png)

Add a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Cmd+Option+I*.

When you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Cmd+Shift+K* to preview the HTML file).
