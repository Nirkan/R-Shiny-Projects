
## Import libraries

library(shiny)
library(shinydashboard)
library(DT)


## User Interface

ui <- dashboardPage( skin = "yellow",
  dashboardHeader( title = "First Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Iris", tabName = "iris", icon = icon("tree")),
      menuItem("Cars", tabName = "cars", icon = icon("car"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem("iris",
              box(plotOutput("correlation_plot"), width = 7),
              box(
                selectInput("features", "Features:", 
                            c("Sepal.Width", "Petal.Length", "Petal.Width")), width = 4
              )
      ),
      
      tabItem("cars",
              fluidPage(
              h1("Cars"),
              dataTableOutput("carstable")
              )
        )
      )
    )
   
  )


## Server

server <- function(input, output) {
  output$correlation_plot <- renderPlot({
    plot(iris$Sepal.Length, iris[[input$features]],
         xlab = "Sepal Length", ylab = "Feature")
  })
  
  output$carstable <- renderDataTable(mtcars)
  
}


## Shiny App

shinyApp(ui, server)