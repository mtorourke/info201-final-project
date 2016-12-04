# Data Visualization - Emilee Helm
setwd('~/Desktop/info201-final-project/data')
data <- read.csv('team-picking-categories.csv', stringsAsFactors = FALSE)

# Load in packages
library(plotly)
library(dplyr)

# Scatter Bar Plot Build - Takes in dataset, and returns plot 
Team <- data$TEAM 

VisualizeData <- function(x) {
  
  p <- plot_ly(x, x = ~Team, y = ~BMK, type = 'bar', name = 'Big Market') %>%
    add_trace(y = ~UNI, name = 'Uniform') %>%
    add_trace(y = ~CCH, name = 'Coaching') %>%
    add_trace(y = ~STX, name = 'Stadium Experience') %>%
    add_trace(y = ~SMK, name = 'Small Market Value') %>%
    add_trace(y = ~AFF, name = 'Affordability') %>%
    add_trace(y = ~FRL, name = 'Fan Relations') %>%
    add_trace(y = ~BNG, name = 'Bang For Your Buck') %>%
    add_trace(y = ~TRD, name = 'Tradition') %>%
    add_trace(y = ~BWG, name = 'Bandwagon Factor') %>%
    add_trace(y = ~FUT, name = 'Future Wins') %>%
    add_trace(y = ~PLA, name = 'Players Likability') %>%
    add_trace(y = ~OWN, name = 'Ownership') %>%
    add_trace(y = ~BEH, name = 'Behavior') %>%
    layout(yaxis = list(title = 'Score'), barmode = 'stack') 
  
  return(p)
}
