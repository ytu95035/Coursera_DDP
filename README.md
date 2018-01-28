
# Developing Data Product Course Project -- Shiny application and R Presentation

## This assignment has two parts. 
## First, create a Shiny application and deploy it on Rstudio's servers. 
## Second, use Rstudio Presenter to prepare a reproducible pitch presentation about Shiny application.

The Shiny application is named "Diamonds Price Predition" and Diamonds data set is used.
The Predition model is referenced from the following website.

https://www.r-bloggers.com/visualization-series-using-scatterplots-and-models-to-understand-the-diamond-market-so-you-dont-get-ripped-off/

## Shiny web app hosting on github

### the process is instructed by Abiyu Giday
http://abiyug.github.io/2016-04-05-shiny-web-app-hosting-on-github

Other people can view the app in their RStudio by run the following.  

Step 6: From any R console with internet access run the following commands to launch your app.
library(shiny)     
#name of the app dir and username
runGitHub("Coursera_DDP", "ytu95035") 
