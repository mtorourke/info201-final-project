#Library programs
library(plotly)
library(stringr)

# Creates function to search for a team
TeamChart <- function(data,  search = '') {
  x <- colnames(data[,2:15])
  y <- as.numeric(data[data$TEAM == search, 2:15])
  
  return (plot_ly(data = data, x = x, y = y))
}