#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$plot <- renderPlot({
        library("ggplot2")
        data("cars", package = "datasets")
        model <- lm(dist ~ speed, data = cars)
        #predict(model, cars)
        mydata <- data.frame(cars, stringsAsFactors = TRUE)
        mydata <- mydata[-c(2)]
        pred.int <- predict(model, interval = "confidence")
        mydata <- cbind(mydata, pred.int)
        if (input$speed != 0){
            new.speed <- data.frame(
                speed = c(input$speed)
            )
            newpred.int <- predict(model, newdata = new.speed, interval = "prediction")
            mydata <- rbind(mydata, c(input$speed, newpred.int))
        }
        
        
        p <- ggplot(mydata, aes(speed, fit)) +
            geom_point() +
            stat_smooth(method = lm)
        # Add prediction intervals
        p + geom_line(aes(y = lwr), color = "red", linetype = "dashed")+ geom_line(aes(y = upr), color = "red", linetype = "dashed")

    })

})
