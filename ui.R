# Library necessary packages and tools
library(shiny)

shinyUI(navbarPage('Info 201 Final Project',
        # Create tabPanel for a project introduction
        tabPanel('Intro',
                 titlePanel('Project Introduction'),
                 mainPanel(
                   tags$h3("Welcome to our project!"),
                   
                   tags$div(  
                     tags$br()
                   ),
                   
                   "The purpose of our app is to help NFL fans pick which team they should root for based on
                   how important certain aspects of a team are to them. We collect this information from users
                   through a questionnaire and assign weights to each category based on their response. Once a user
                   has completed the questionnaire, they will be able to see which team they should root for as well
                   as different data visualizations relating to their answers.",
                   tags$div(
                     tags$br() 
                   ),
                   
                   "Our project idea came from Blyth Terrell", a("article", target="_blank", href="http://fivethirtyeight.com/features/the-rams-are-dead-to-me-so-i-answered-3352-questions-to-find-a-new-team/"),
                   "on FiveThirtyEight describing her path to
                   to deciding which NFL franchise she would be a fan of due to the Rams, her current team,
                   leaving St. Louis. We used the data set they created that scores the teams in each category
                   which is available on FiveThirtyEight\'s", a("github", target = "_blank", href="https://github.com/fivethirtyeight/data/tree/master/nfl-favorite-team"), "."
                 )
                 ),
        # Creates a tab panel to ask user questions about how important certain features are 
        tabPanel('Questions',
                 titlePanel('Picking A New NFL Team'),
                 mainPanel(
                   # Creates radio buttons to collect users input
                   radioButtons("radio1", label = ("How important to you is a big market (size of market in terms of population where bigger is better)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5,"Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio2", label = ("How important to you is stylishness of uniforms?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio3", label = ("How important to you is coaching?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio4", label = ("How important to you is stadium experience"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio5", label = ("How important to you is a small market (size of market in terms of population where smaller is better)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio6", label = ("How important to you is affordability (price of tickets, parking, concessions, etc.)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio7", label = ("How important to you is fan relations (courtesy by players, coaches and front offices toward fans, and how well a team uses technology to reach them)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio8", label = ("How important to you is bang for your buck (wins per fan dollars spent)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio9", label = ("How important to you is tradition (championships/division titles/wins in team's entire history)"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio10", label = ("How important to you is the bandwagon factor?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio11", label = ("How important to you are future wins (predicted over the next five years)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio12", label = ("How important to you are players in terms of effort on the field and likability off it?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio13", label = ("How important to you is ownership (loyality to core players and the community"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1),
                   
                   radioButtons("radio14", label = ("How important to you is behavior (suspensions by players on a team since 2007, especially considering transgression against women)?"),
                                choices = list("Not At All" = 0, "A Little Important" = 0.5, "Somewhat Important" = 1, "Very Important" = 1.5, "Most Important" = 2),
                                selected = 1)
                 )
        ),
        # Creates a tab panel for results and visualizations
        tabPanel('Visualizations',
        titlePanel('Results and Visualizations'),
                 mainPanel(
                   # Renders text to show user which team they should cheer for based on their preferences
                   "Your New NFL Team is... The",
                   
                   # Renders text to show user which team they should cheer for based on their preferences
                   tags$h3(
                     
                     tags$b(
                       
                       textOutput('results')
                     )),
                   
                   tags$div(
                     
                     tags$br()
                     
                   ),
                   
                   # Renders data visualization related to users preferences
                   plotlyOutput('chart'),
                   tags$div(  
                     tags$br()
                   ),
                   tags$div(  
                     tags$br()
                   ),
                   
                   # Selects a team to be displayed
                   selectInput("team", label = h3("Select a Team"), 
                               choices = list("Arizona Cardinals", "Atlanta Falcons", "Baltimore Ravens", "Buffalo Bills", "Carolina Panthers",
                                              "Chicago Bears", "Cincinnati Bengals", "Cleveland Browns", "Dallas Cowboys", "Denver Broncos",
                                              "Detroit Lions", "Green Bay Packers", "Houston Texans", "Indianapolis Colts", 
                                              "Jacksonville Jaguars", "Kansas City Chiefs", "Los Angeles Rams", "Miami Dolphins", 
                                              "Minnesota Vikings", "New England Patriots", "New Orleans Saints", "New York Giants", 
                                              "New York Jets", "Oakland Raiders", "Philadelphia Eagles", "Pittsburgh Steelers",
                                              "San Diego Chargers", "San Francisco 49ers", "Seattle Seahawks", "Tampa Bay Buccaneers", 
                                              "Tennessee Titans", "Washington Redskins")),
                   
                   # Renders data visualization of the selected team                          
                   plotlyOutput('team.chart'),
                   
                   # Selects a category to be displayed
                   selectInput("category", label = h3("Select a Category"), 
                               choices = list("Big Market" = 'BMK', "Uniform" = 'UNI', "Coaching" = 'CCH', 'Stadium Experience' = 'STX',
                                              'Small Market' = 'SMK', 'Affordability' = 'AFF', 'Fan Relations' = 'FRL', 'Bang For Your Buck' = 'BNG',
                                              'Tradition' = 'TRD', 'Bandwagon Factor' = 'BWG', 'Future Wins' = 'FUT', 'Players' = 'PLA', 'Ownership' = 'OWN',
                                              'Behavior' = 'BEH')),
                   
                   # Renders a data visualization of the selected category
                   plotlyOutput('category.chart'),
                   tags$div(  
                     tags$br()
                   ),
                   tags$div(  
                     tags$br()
                   )
                 )
        )
        
))