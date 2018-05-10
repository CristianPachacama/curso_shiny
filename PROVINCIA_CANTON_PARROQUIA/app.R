# Ejemplo menú anidado

parroquias <- readRDS("parroquias.rds")

prov <- unique(parroquias$PROVINCIA_NOMBRE)


ui <- fluidPage(
  
  selectInput('pro',
              h4("Provincia"),
              choices=prov
  ),
  
  selectInput('can',
              h4("Cantón"),
              choices=NULL
  ),
  
  selectInput('par',
              h4("Parroquia"),
              choices=NULL
  )
  
)

server <- function(input, output, session) {

  observe({
    cantones <- parroquias$CANTON_NOMBRE[parroquias$PROVINCIA_NOMBRE==input$pro]
    updateSelectInput(session, "can",
                      choices = cantones)
  })
  
  observe({
    parroquias <- parroquias$PARROQUIA_NOMBRE[parroquias$CANTON_NOMBRE==input$can]
    updateSelectInput(session, "par",
                      choices = parroquias)
  })
  
}

shinyApp(ui, server)

