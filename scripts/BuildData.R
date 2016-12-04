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

CalculateScores <- function(data, multipliers) {
  for(i in 1:32) {
    data[i, "total.score"] <- TeamScore(i, multipliers)
  }
  return(data)
}

TeamScore <- function(team, multipliers) {
  score <- 0
  for(i in 1:14) {
    score <- score + (data[team, i+1] * multipliers[i])
  }
  return(score)
}

multiply <- c(1.5, 1.5, 1, 2, .5, 0, 0, .5, 1, 1, 1, 1.5, 2, 1)
practice <- CalculateScores(nfl.data, multiply)
