library(shiny)
library(rpivotTable)

ui = fluidPage(
  h1("Tabla dinámica Titanic", align="center"),
  rpivotTableOutput("Tabla")
)

server = function(input, output) {
  output$Tabla <- renderRpivotTable({
    change_locale(rpivotTable( Titanic,
                               rows = "Survived",
                               cols = c("Class","Sex"),
                               aggregatorName = "Cuenta",
                               vals = "Freq"),
                  'es')
  })
}

shinyApp(ui, server)
