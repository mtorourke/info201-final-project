#Mitchell O'Rourke - Shiny Server
#load shiny library
library(shiny)
library(dplyr)
library(plotly)

#sets working directory, reads in data
setwd("/Users/Mitch/Downloads/School/INFO201/info201-final-project/")
source("./scripts/DataVisualization.R")
source("./scripts/ScoreCalculations.R")
data <- read.csv('./data/team-picking-categories.csv', stringsAsFactors = FALSE)
data <- select(data, -(SLP:NYP)) #factors out the St. Louis/New York proximity because it's arbitrary
data <- mutate(data, total.score = 0)



shinyServer(function(input, output) {

  output$chart <- renderPlotly({
    response <- c(input$radio1, input$radio2, input$radio3, input$radio4, input$radio5, 
                  input$radio6, input$radio7, input$radio8, input$radio9, input$radio10,
                  input$radio11, input$radio12, input$radio13, input$radio14)
    response <- as.numeric(response)
    response.calculated <- CalculateScores(data, response)
    return(VisualizeData(response.calculated))
  })
})




