#Library programs
library(plotly)
library(stringr)

# Creates function to search for a team
TeamChart <- function(data,  search = '') {
  data <- data[search,]
    
  data <- as.data.frame(t(data))
  
  column <- paste0("data$", search)
  y <- eval(parse(text = column))
  
  plot_ly(data = data, x = ~Team, y= y)
}