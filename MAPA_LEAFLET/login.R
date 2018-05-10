USER <- reactiveValues(Logged=FALSE)

output$uiLogin <- renderUI({
        if (USER$Logged == FALSE) {
                wellPanel(
                        h5(textInput("userName", "Usuario:")),
                        h5(passwordInput("passwd", "Contraseña:")),
                        h3(actionButton("Login", "Ingresar"))
                )
        }
})

output$mensaje <- renderText({
        if (USER$Logged == FALSE) {
                if (!is.null(input$Login)) {
                        if (input$Login > 0) {
                                Username <- isolate(input$userName)
                                Password <- isolate(input$passwd)
                                Id.username <- which(word$in1 == Username)
                                Id.password <- which(word$in2 == Password)
                                if (length(Id.username) > 0 & length(Id.password) > 0) {
                                        if (Id.username == Id.password) {
                                                USER$Logged <- TRUE
                                        }
                                        else  {
                                                "Usuario o contraseña incorrectos!"
                                        }
                                } else  {
                                        "Usuario o contraseña incorrectos!"
                                }
                        }
                }
        }
})
