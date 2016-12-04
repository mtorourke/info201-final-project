library(shiny)

shinyUI(fluidPage('Picking A New NFL Team',
        tabPanel('Questions',
                 titlePanel('Questionnaire'),
                 mainPanel(
                   radioButtons("radio1", label = ("How important to you is a big market (size of market in terms of population where bigger is better)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75,"Most Important" = 1)),
                   radioButtons("radio2", label = ("How important to you is stylishness of uniforms?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio3", label = ("How important to you is coaching?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio4", label = ("How important to you is stadium experience"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio5", label = ("How important to you is a small market (size of market in terms of population where smaller is better)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio6", label = ("How important to you is affordability (price of tickets, parking, concessions, etc.)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio7", label = ("How important to you is team proximity to St. Louis?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio8", label = ("How important to you is team proximity to New York?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio9", label = ("How important to you is fan relations (courtesy by players, coaches and front offices toward fans, and how well a team uses technology to reach them)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio10", label = ("How important to you is bang for your buck (wins per fan dollars spent)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio11", label = ("How important to you is tradition (championships/division titles/wins in team's entire history)"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio12", label = ("How important to you is the bandwagon factor?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio13", label = ("How important to you is tradition (championships/division titles/wins in team's entire history)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio14", label = ("How important to you are players in terms of effort on the field and likability off it?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio15", label = ("How important to you is ownership (loyality to core players and the community"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   radioButtons("radio16", label = ("How important to you is behavior (suspensions by players on a team since 2007, especially considering transgression against women)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.25, "Somewhat Important" = 0.5, "Very Important" = 0.75, "Most Important" = 1)),
                   textOutput('results'),
                 )
        ),
        tabPanel('Visualizations',
                 titlePanel('Visualizations'),
                 mainPanel(
                   plotlyOutput('viz')
                 )
          
        )
))