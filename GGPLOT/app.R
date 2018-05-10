# Ejemplo plotly

library(shiny)
library(ggplot2)
library(plotly)

ui <- fluidPage(
  plotlyOutput("grafico")
)

server <- function(input, output) {
  output$grafico <- renderPlotly({
    g <- ggplot(mtcars) +
      geom_histogram(aes(x=mpg), bins= 8, fill="#ad0017")
    ggplotly(g)
  })
}

shinyApp(ui, server)
