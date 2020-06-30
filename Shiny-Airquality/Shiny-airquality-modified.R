## library and dataset

library(shiny)
data("airquality")


## Defining UI for the app to draw a histogram

ui <- fluidPage(
  
  # App title
  titlePanel("Ozone level"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      
      #Input : Slider for the number of bins
      sliderInput(
        inputId = "bins",
        label = "Number of bins:",
        min = 1,
        max = 75,
        value = 30),
    
    sliderInput(
      inputId = "bins2",
      label = "Number of bins:",
      min = 1,
      max = 75,
      value = 45)
    
  ),
    
    # Main panel for displaying outputs
    mainPanel(
      
      # Output: Histogram
      plotOutput(outputId = "distPlot"),
      plotOutput(outputId = 'distPlot2')
    ),
  
    
  )
  
)
  


## Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    x <- airquality$Ozone
    x <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    hist(x, breaks = bins, col = "yellow3", border = "black",
                xlab = "Ozone level",
                main = "Histogram of Ozone level")
  })

  output$distPlot2 <- renderPlot({
    
    y <- airquality$Temp
    y <- na.omit(y)
    bins2 <- seq(min(y), max(y), length.out = input$bins2 + 1)
    
    hist(y, breaks = bins2, col = 'skyblue', border = "black",
         xlab = "Temperature",
         main = "Histogram for temperature")
  })
  
}



## Create a Shiny app
shinyApp(ui = ui, server = server)