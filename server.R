#Mitchell O'Rourke - Shiny Server
#load shiny library
library(shiny)
library(dplyr)
library(plotly)

#sets working directory, reads in data
setwd("~/info201-final-project/")
source("./scripts/Visualize.R")
source("./scripts/ScoreCalculations.R")
source("./scripts/TeamVisualization.R")
data <- read.csv('./data/team-picking-categories.csv', stringsAsFactors = FALSE)

#factors out the St. Louis/New York proximity because it's arbitrary
data <- select(data, -(SLP:NYP)) 

#creates a 'total.score' column in the data frame
data <- mutate(data, total.score = 0) 

#creates a list of the acronyms and their associated titles
cat.list <- list("BMK" = 'Big Market', "UNI" = 'Uniform', "CCH" = 'Coaching', 'STX' = 'Stadium Experience',
     'SMK' = 'Small Market', 'AFF' = 'Affordability', 'FRL' = 'Fan Relations', 'BNG' = 'Bang For Your Buck',
     'TRD' = 'Tradition', 'BWG' = 'Bandwagon Factor', 'FUT' = 'Future Wins', 'PLA' = 'Players', 'OWN' = 'Ownership',
     'BEH' = 'Behavior')

#shinyServer function
shinyServer(function(input, output) {
  
  #a reactive function that modifies the data set, based on user input
  dataInput <- reactive({
    response <- c(input$radio1, input$radio2, input$radio3, input$radio4, input$radio5, 
                  input$radio6, input$radio7, input$radio8, input$radio9, input$radio10,
                  input$radio11, input$radio12, input$radio13, input$radio14)
    response <- as.numeric(response)
    response.calculated <- CalculateScores(data, response)
    return (response.calculated)
  })
  
  #function that renders a chart comparing the total score of each team
  output$chart <- renderPlotly({
    return(Visualize(dataInput(), "total.score", "Total Score"))
  })
  
  #function that renders a chart that shows that shows the weighted stats of a team of the users choice
  output$team.chart <- renderPlotly({
    return (TeamChart(dataInput(), input$team, cat.list))
  })
  
  #renders a chart that compares the score of each in a category of the users choice
  output$category.chart <- renderPlotly({
    return (Visualize(dataInput(), input$category, cat.list[[input$category]]))
  })
  
  #renders the new team that user 'should' follow based of their chosen critieria 
  output$results <- renderText({
    return (dataInput()[1, 1])
  })
  
})




