#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Car stopping distance analysis and prediction"),

    # Sidebar with a slider input for speed
    sidebarLayout(
        sidebarPanel(
            sliderInput("speed",
                        "Change the speed to see the stopping distance:",
                        min = 0,
                        max = 100,
                        value = 10)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot")
        )
    )
))
