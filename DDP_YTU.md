Developing Data Product Course Project: Shiny Application for Diamond Price Prediction
========================================================
author: Yuling Tu
date: January 27, 2018
autosize: true

========================================================

# Intruction

## Goal of the project

- A Shiny application that has widget input, ui input in server.R, reactive output using server calculations, and supporting documentation.

- A Reproducible Pitch Presentation that contains five slides in R Presentation that is pushed to and hosted on GitHub and contains embedded R code that runs.

- All related souce codes are located at Github

## https://github.com/ytu95035/Coursera_DDP

==============================================================
# Shiny Application

## Diamond is forever!!!
## Diamond is love!!!

- The application was named Diamond Price Prediction.

## 4C -- carat, cut, color and clarity.

- The application provides the prediction model for you to predict the price by selecting specified 4c you want.

## You won't get ripped off EVER!!


========================================================

# Diamond Data Set

- Diamond data is from ggplot2 package
- 53940 observations and 10 variables

```
# A tibble: 2 x 10
  carat     cut color clarity depth table price     x     y     z
  <dbl>   <ord> <ord>   <ord> <dbl> <dbl> <int> <dbl> <dbl> <dbl>
1  0.23   Ideal     E     SI2  61.5    55   326  3.95  3.98  2.43
2  0.21 Premium     E     SI1  59.8    61   326  3.89  3.84  2.31
```
- Price & 4c (carat, cut, color and clarity) have positive linear regression relationship
![plot of chunk unnamed-chunk-1](DDP_YTU-figure/unnamed-chunk-1-1.png)

========================================================
# Prediction Model


## Model: lm(formula = I(log10(price)) ~ I(carat^(1/3)) + carat + cut + color + clarity, data = diamonds)

- The model is contributed by Solomon Messing (https://solomonmessing.wordpress.com/2014/01/19/visualization-series-the-scatterplot-or-how-to-use-data-so-you-dont-get-ripped-off/).

### Are you ready to buy this diamond -- carat=2, cut='Very Good', color='G',clarity='VS2'?

## Check the price first here

Due to my company's firewall, I can't publish Shiny app to R Server.  Please run the following command in your RStudio console to launch the applicaton.  Really appreciate for your patience.  

### library(shiny)
### runGitHub("Coursera_DDP", "ytu95035")  
