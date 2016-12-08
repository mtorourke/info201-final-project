#Library programs
library(plotly)
library(stringr)

# Creates function to search for a team
TeamChart <- function(data,  search = '', category.names) {
  x <- unlist(category.names)
  y <- as.numeric(data[data$TEAM == search, 2:15])
<<<<<<< HEAD
  
  return (plot_ly(data = data, x = x, y = y))
=======
  p <- plot_ly(data = data, x = x, y = y, type = "bar", color = 'REDS') %>% 
    layout(title = search, 
           xaxis = list(title = "Categories"), 
           yaxis = list(title = "Score"),
           margin = list(b = 160, r = 200))
  return (p)
>>>>>>> Fixed bugs
}