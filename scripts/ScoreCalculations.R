#Evan Van Cotthem
#Info 201
#Final Project

library(dplyr)

#Returns the data frame with the categories multiplied by their weights and
#the teams sorted by their total.score highest to lowest
CalculateScores <- function(data, cat.weights) {
  for(i in 1:32) {
    data <- TeamScore(data, i, cat.weights)
  }
  data <- arrange(data, -total.score)
  return(data)
}

#Returns the data frame with the selected team's categories multiplied by their weights
#and total.score calculated
TeamScore <- function(data, team, cat.weights) {
  score <- 0
  for(i in 1:14) {
    data[team, i+1] <- data[team, i+1] * cat.weights[i]
    score <- score + data[team, i+1]
  }
  data[team, "total.score"] <- score
  return(data)
}