#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)
shinyUI(navbarPage("Diamond Price Predition",
                   tabPanel("Predit Your Diamond",
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(

                                helpText("Pick 4C on Your Diamond"),
                                #sliderInput('carat', 'Carat', min=0.2, max=5.1, value = 0.5, step=0.1),
                                sliderInput("Carat",
                                            "Select Carat:",
                                            min = 0.2, max = 5.1, value =0.5, step=0.1),
                                selectInput(inputId = "Cut",
                                            label = "Choose a cut:",
                                            choices = c("Fair", "Good", "Very Good", "Premium", "Ideal")),
                                 # Input: Selector for choosing color ----
                                selectInput(inputId = "Color",
                                            label = "Choose a Color:",
                                            choices = c("D", "E", "F", "G", "H","I", "J")),
                                radioButtons('Clarity', 'Choose a Clarity:', c("Included"='I1', "Internally Flawless IF"='IF', "Very Very Slightly Included 1" = 'VVS1',"Very Very Slightly Included" = 'VVS2', "Very Slightly Included 2" = 'VS2',"Very Slightly Included 1" = 'VS1',"Slightly Included 1"='S1',"Slightly Included 2"='S2'),selected = c('I1')),

                                actionButton(inputId = "submitbtn",
                                             label = "Predict my price"
                                )
                              ),
                              mainPanel(
                                h1("Prediction"),
                                h3("Your Choice of 4C"),
                                tableOutput("mychoice"),
                                h3("Shown predit price along with lower and upper price range"),
                                tableOutput("fitout"),
                                h3(textOutput("ntext")),
                                plotOutput('plotdd')
                              )
                            )
                   ),
                   tabPanel(p(icon("info"), "About"),
                            mainPanel(
                              includeMarkdown("about.html")
                            )
                   )
))
