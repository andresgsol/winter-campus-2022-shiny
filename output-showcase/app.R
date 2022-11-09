library(shiny)
library(DT)
library(ggplot2)

ui <-
  fluidPage(   
    titlePanel("Iris Dataset"),
  
    dataTableOutput("table"),
    plotOutput("scatter_plot", click = "plot_click"),
    verbatimTextOutput("info"),
    plotOutput("distribution_plot")
    
  )


server <-
  function(input, output) {
    output$table <- renderDataTable(
      datatable(
        data <- iris
      )
    )
    
    
    output$scatter_plot <- renderPlot({
      plot(iris$Petal.Length, iris$Petal.Width)
    })
    
    output$info <- renderText({
      paste0("Petal length = ", input$plot_click$x, 
             "\nPetal width = ", input$plot_click$y)
    })
    
    
    output$distribution_plot <- renderPlot({
      ggplot(iris, aes(x = Species, y = Sepal.Length, color = Species)) +
        geom_violin(show.legend = FALSE) +
        stat_summary(show.legend = FALSE) 
    })
  }


shinyApp(ui = ui, server = server)