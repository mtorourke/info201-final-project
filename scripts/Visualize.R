# Visualization - Teams Total Score
# Emilee Helm
# INFO 201

library(plotly)
library(dplyr)

# Function that takes in general data and visualizes selected team statistics
Visualize <- function(data, y, title) {
  column <- paste0('data$', y)

  p <- plot_ly(
    x = data$TEAM,
    y = eval(parse(text = column)),
    name = title,
    type = "bar") %>%
    layout(title = title,
      xaxis = list(title = 'Team'),
      yaxis = list(title = 'Score'),
      margin = list(b = 160))
    
  
  return(p)
}

