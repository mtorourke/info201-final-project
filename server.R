#Mitchell O'Rourke - Shiny Server
#load shiny library
library(shiny)
library(dplyr)
library(plotly)

#sets working directory, reads in data
setwd("/Users/Mitch/info201-final-project/")
source("./scripts/Visualize.R")
source("./scripts/ScoreCalculations.R")
source("./scripts/TeamVisualization.R")
data <- read.csv('./data/team-picking-categories.csv', stringsAsFactors = FALSE)
data <- select(data, -(SLP:NYP)) #factors out the St. Louis/New York proximity because it's arbitrary
data <- mutate(data, total.score = 0)

cat.list <- list("BMK" = 'Big Market', "UNI" = 'Uniform', "CCH" = 'Coaching', 'STX' = 'Stadium Experience',
     'SMK' = 'Small Market', 'AFF' = 'Affordability', 'FRL' = 'Fan Relations', 'BNG' = 'Bang For Your Buck',
     'TRD' = 'Tradition', 'BWG' = 'Bandwagon Factor', 'FUT' = 'Future Wins', 'PLA' = 'Players', 'OWN' = 'Ownership',
     'BEH' = 'Behavior')

shinyServer(function(input, output) {
  
  dataInput <- reactive({
    response <- c(input$radio1, input$radio2, input$radio3, input$radio4, input$radio5, 
                  input$radio6, input$radio7, input$radio8, input$radio9, input$radio10,
                  input$radio11, input$radio12, input$radio13, input$radio14)
    response <- as.numeric(response)
    response.calculated <- CalculateScores(data, response)
    return (response.calculated)
  })

  output$chart <- renderPlotly({
    return(Visualize(dataInput(), "total.score", "Total Score"))
  })
  
  output$team.chart <- renderPlotly({
    return (TeamChart(dataInput(), input$text))
  })
  
  output$category.chart <- renderPlotly({
    return (Visualize(dataInput(), input$category, cat.list[[input$category]]))
  })
  
  output$results <- renderText({
    return (paste0("Your New NFL Team is... The ", dataInput()[1, TEAM]))
  })
  
})




