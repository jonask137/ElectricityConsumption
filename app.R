#### Loading data ----

Data <- readRDS("Data/Data.rds")
Data

#### The UI ----

ui <- fluidPage(
  
  #The title of the sliders
  titlePanel("Slicers"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    
    # Sidebar to demonstrate various slider options
    sidebarPanel(
      
      ## Add slicers here ##
      
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      
      # Output: we want a plot
      plotOutput("values")
      
    )
  )
)


#### Define server logic for slider examples ----
server <- function(input, output) {
  
  # Reactive expression to create data frame of all input values
  sliderValues <- reactive({
    
    ## INSERT THE PLOT HERE ##
    
  })
  
  # Show the values in an HTML table
  output$values <- renderPlot({
    sliderValues()
  })
}

shinyApp(ui, server)
