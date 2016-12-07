# Visualization - Teams Total Score
# Emilee Helm
# INFO 201

library(plotly)

# Function that takes in general data and visualizes selected team statistics
Visualize <- function(data, y, title) {
  column <- paste0('data$', y)

  p <- plot_ly(
    x = data$TEAM,
    y = eval(parse(text = column)),
    name = title,
    type = "bar"
  )
  return(p)
}

