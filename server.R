#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

shinyServer(
  function(input, output, session) {

    output$plotdd <- renderPlot({
      ggplot(diamonds, aes(x=carat, y=price, color=cut))+ geom_point()+ facet_grid(color ~ clarity)
    })

    observeEvent(
      eventExpr = input[["submitbtn"]],
      handlerExpr = {
        withProgress(message = 'Just a moment...', value = 0, {
          m1 <- lm(I(log10(price)) ~ I(carat^(1/3)), data = diamonds)
          m2 <- update(m1,~ . +carat)
          m3 <- update(m2,~ . +cut)
          m4 <- update(m3,~ . +color)
          m5 <- update(m4,~ . +clarity)
        })

        Carat <- input$Carat
        Cut <- input$Cut
        Color <- input$Color
        Clarity <- input$Clarity

        myEntry <- data.frame(carat=Carat, cut=Cut, color=Color, clarity=Clarity)

        output$mychoice <- renderTable(myEntry)

        fitpred <- predict(m5,newdata = myEntry, interval = "prediction",level = .95)
        myPrediction <- 10^fitpred
        output$fitout <- renderTable(myPrediction)

        df1 <- subset(diamonds, cut==Cut & color==Color & clarity==Clarity)
        output$ntext <- renderText("The new chart displays observations of your choice of cut, color and clarity from dismonds data set.")
        output$plotdd <- renderPlot({
          ggplot(df1, aes(x=carat, y=price))+ geom_point()})

      })

  }
)
