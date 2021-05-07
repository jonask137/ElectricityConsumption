#### Loading data ----

Data <- readRDS("Data/Data.rds")
cln.aggr_cons <- Data$Clean_data$AggrConsumption
#Data

attach(Data$Clean_data$AggrConsumption)

#### The UI ----

ui <- fluidPage(
  
  #The title of the sliders
  titlePanel("Slicers"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    
    # Sidebar to demonstrate various slider options
    sidebarPanel(
      
      sliderInput(inputId = "Date_interval",label = h3("Dato interval")
                  ,min = as.Date(min(cln.aggr_cons$date))
                  ,max = as.Date(Sys.Date())
                  ,value = c(as.Date(min(cln.aggr_cons$date)),Sys.Date())
                  )
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      
      #To show the selected values as a range
      fluidRow(
        column(4, verbatimTextOutput(outputId = "range")) #It is callable with range
      ),

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
    y <- cln.aggr_cons$quantity[date > input$Date_interval[1] & date < input$Date_interval[2]] #input$Date_inteval[1]]
    x <- 
    
    plot(y
         ,type = 'l'
         ,panel.first = list(grid())
         ,main = "Power consumption pr. hour"
         ,x = c(1:length(y))
         )
  })

  # Show the values in an HTML table
  output$range <- renderPrint({ 
    input$Date_interval
  })
  
  output$values <- renderPlot({
    sliderValues()
  })
  
}

shinyApp(ui, server)
