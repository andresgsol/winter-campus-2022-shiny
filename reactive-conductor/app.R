library(shiny)

ui <-
  fluidPage(
    verticalLayout(
      titlePanel("Fibonacci"),
      textInput("n", "Fibonacci sequence depth", 1),
      textOutput("nthValue"),
      textOutput("nthValueInv")
    )
  )
      

# Calculate nth number in Fibonacci sequence
fib <- function(n) {
  if (n < 3)
    1
  else
    fib(n - 1) + fib(n - 2)
}

server <- function(input, output) {
  output$nthValue    <- renderText({
    fib(as.numeric(input$n))
  })
  output$nthValueInv <- renderText({
    1 / fib(as.numeric(input$n))
  })
}


shinyApp(ui = ui, server = server)