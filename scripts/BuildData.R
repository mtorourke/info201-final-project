#Evan Van Cotthem
#Info 201
#Final Project

library(dplyr)

setwd("C:/Users/Evan/Documents/info201-final-project/data")

data <- read.csv("team-picking-categories.csv")

#Get rid of St. Louis and New York proximity scores
#nfl.data <- data %>% 
#  select(-(SLP: NYP)) %>% 
#  mutate(total.score = 0)

#Calculates the score of each team based on the weighting of each category
#Returns the data frame with the teams sorted by their score (highest = first)
CalculateScores <- function(data, cat.weights) {
  for(i in 1:32) {
    data[i, "total.score"] <- TeamScore(data, i, cat.weigths)
  }
  data <- arrange(data, -total.score)
  return(data)
}

#Calculates and returns the score of a specific team based on the weighting of each category
TeamScore <- function(data, team, cat.weigths) {
  score <- 0
  for(i in 1:14) {
    score <- score + (data[team, i+1] * cat.weights[i])
  }
  return(score)
}

multiply <- c(1.5, 1.5, 1, 2, .5, 0, 0, .5, 1, 1, 1, 1.5, 2, 1)
practice <- CalculateScores(nfl.data, multiply)
