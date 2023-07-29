install.packages("shiny")
install.packages("shinydashboard")
# Load required libraries
library(shiny)
library(shinydashboard)

# Sample dataset
movies <- data.frame(
  Movie = c("Movie 1", "Movie 2", "Movie 3", "Movie 4", "Movie 5"),
  Genre = c("Action, Adventure", "Action, Comedy", "Drama, Romance", "Action", "Comedy"),
  Rating = c(8.3, 7.9, 6.5, 8.0, 7.2),
  Year = c(2010, 2012, 2015, 2008, 2019)
)

# Define UI for the dashboard
ui <- dashboardPage(
  dashboardHeader(title = "Movie Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Overview", tabName = "overview"),
      menuItem("Genre Analysis", tabName = "genre")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "overview",
        h2("Movie Overview"),
        dataTableOutput("movies_table")
      ),
      tabItem(
        tabName = "genre",
        h2("Genre Analysis"),
        selectInput("genre_input", "Select Genre:", choices = c("Action", "Adventure", "Comedy", "Drama", "Romance")),
        plotOutput("genre_plot")
      )
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Render movies table
  output$movies_table <- renderDataTable({
    movies
  })
  
  # Render genre analysis plot
  output$genre_plot <- renderPlot({
    genre_selected <- input$genre_input
    genre_movies <- movies[grep(genre_selected, movies$Genre), ]
    
    barplot(genre_movies$Rating, names.arg = genre_movies$Movie, col = "steelblue",
            main = paste("Ratings of", genre_selected, "Movies"),
            xlab = "Movie", ylab = "Rating")
  })
}

# Run the app
shinyApp(ui, server)
