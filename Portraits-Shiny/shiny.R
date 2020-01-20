shinyServer(
  function(input, output, session){
    
    
    
    
    #if (input$Echelle == "Régions forestières") {
    # output$myImage <- renderImage({
    #   filename <- normalizePath(file.path('./www', paste(input$RegForest,"Moyenne_Annuel_Hist_Elevees.png", sep='')))
    #   list(src = filename, alt = paste("Echele Spatiale ", input$RegForest))
    #   }, deleteFile = FALSE)
    # 
    #  output$myImage2 <- renderImage({
    #   filename <- normalizePath(file.path('./www', paste(input$RegForest,"Moyenne_Annuel_2050_",input$Scenario,".png", sep='')))
    #   list(src = filename, alt = paste("Echele Spatiale ", input$RegForest))
    #  }, deleteFile = FALSE)
    # 
    #  output$myImage3 <- renderImage({
    #   filename <- normalizePath(file.path('./www', paste(input$RegForest,"Moyenne_Annuel_Hist_Elevees.png", sep='')))
    #   list(src = filename, alt = paste("Echele Spatiale ", input$RegForest))
    # }, deleteFile = FALSE)
    # 
    #  output$myImage4 <- renderImage({
    #   filename <- normalizePath(file.path('./www', paste(input$RegForest,"Moyenne_Annuel_2080_",input$Scenario,".png", sep='')))
    #   list(src = filename,alt = paste("Echele Spatiale ", input$RegForest))
    # }, deleteFile = FALSE)
    #}
    # else if (input$Echelle == "Territoires guides") {
    output$myImage <- renderImage({
      filename <- normalizePath(file.path('./www', paste(input$Territoires,"Moyenne_Annuel_Hist_Elevees.png", sep='')))
      list(src = filename, alt = paste("Echele Spatiale ", input$Territoires))
    }, deleteFile = FALSE)
    
    output$myImage2 <- renderImage({
      filename <- normalizePath(file.path('./www', paste(input$Territoires,"Moyenne_Annuel_2050_",input$Scenario,".png", sep='')))
      list(src = filename, alt = paste("Echele Spatiale ", input$Territoires))
    }, deleteFile = FALSE)
    
    output$myImage3 <- renderImage({
      filename <- normalizePath(file.path('./www', paste(input$Territoires,"Moyenne_Annuel_Hist_Elevees.png", sep='')))
      list(src = filename, alt = paste("Echele Spatiale ", input$Territoires))
    }, deleteFile = FALSE)
    
    output$myImage4 <- renderImage({
      filename <- normalizePath(file.path('./www', paste(input$Territoires,"Moyenne_Annuel_2080_",input$Scenario,".png", sep='')))
      list(src = filename,alt = paste("Echele Spatiale ", input$Territoires))
    }, deleteFile = FALSE)
    # } 
    
    
    ### Download files 
    output$downloadData <- downloadHandler(
      filename = "Moyenne.csv",
      content = function(file) { 
        file.copy("Moyenne.csv",file)
      }
    )
    
    # output$downloadData2 <- downloadHandler(
    #   filename = "Moyenne.csv",
    #   content = function(file) { 
    #     file.copy("www/Moyenne.csv",file)
    #   }
    # )
    
  }
)