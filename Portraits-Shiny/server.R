shinyServer(
  function(input, output, session){
    regfor <- reactive(input$RegForest)
    terguid <- reactive(input$Territoires)
    dombio <- reactive(input$Domaines)
    sdombio <- reactive(input$Sous-domaines)
    regeco <- reactive(input$RegEcol)
    sregeco <- reactive(input$SousRegEcol)
    sec <- reactive(input$Secteurs)
    ua <- reactive(input$UA)
    echelle <- reactive(input$Echelle)
    sousechelle <- reactive({ if (echelle() == "Régions forestières") {regfor()} 
                             else if (echelle() == "Territoires guides") {terrguid()}
      else if (echelle() == "Domaines bioclimatiques") {dombio()}
      else if (echelle() == "Sous-domaines bioclimatiques") {sdombio()}
      else if (echelle() == "Régions écologiques") {regeco()}
      else if (echelle() == "Sous-région écologiques") {sregeco()}
      else if (echelle() == "Secteurs des opérations régionales") {sec()}
      else if (echelle() == "Unités d’aménagement (UA)") {ua()}})
   
    
    
    
    
    
    # if (input$Echelle == "Régions forestières") {
    output$myImage <- renderImage({
      filename <- normalizePath(file.path('./www', paste(sousechelle(),"Moyenne_Annuel_Hist_Elevees.png", sep='')))
      list(src = filename, alt = paste("Echele Spatiale ", sousechelle()))
      }, deleteFile = FALSE)

     output$myImage2 <- renderImage({
      filename <- normalizePath(file.path('./www', paste(sousechelle(),"Moyenne_Annuel_2050_",input$Scenario,".png", sep='')))
      list(src = filename, alt = paste("Echele Spatiale ", sousechelle()))
     }, deleteFile = FALSE)

     output$myImage3 <- renderImage({
      filename <- normalizePath(file.path('./www', paste(sousechelle(),"Moyenne_Annuel_Hist_Elevees.png", sep='')))
      list(src = filename, alt = paste("Echele Spatiale ", sousechelle()))
    }, deleteFile = FALSE)

     output$myImage4 <- renderImage({
      filename <- normalizePath(file.path('./www', paste(sousechelle(),"Moyenne_Annuel_2080_",input$Scenario,".png", sep='')))
      list(src = filename,alt = paste("Echele Spatiale ", sousechelle()))
    }, deleteFile = FALSE)
    # }
    # else if (input$Echelle == "Territoires guides") {
    #   output$myImage <- renderImage({
    #     filename <- normalizePath(file.path('./www', paste(input$Territoires,"Moyenne_Annuel_Hist_Moderees.png", sep='')))
    #     list(src = filename, alt = paste("Echele Spatiale ", input$Territoires))
    #   }, deleteFile = FALSE)
    # 
    #   output$myImage2 <- renderImage({
    #     filename <- normalizePath(file.path('./www', paste(input$Territoires,"Moyenne_Annuel_2050_",input$Scenario,".png", sep='')))
    #     list(src = filename, alt = paste("Echele Spatiale ", input$Territoires))
    #   }, deleteFile = FALSE)
    # 
    #   output$myImage3 <- renderImage({
    #     filename <- normalizePath(file.path('./www', paste(input$Territoires,"Moyenne_Annuel_Hist_Moderees.png", sep='')))
    #     list(src = filename, alt = paste("Echele Spatiale ", input$Territoires))
    #   }, deleteFile = FALSE)
    # 
    #   output$myImage4 <- renderImage({
    #     filename <- normalizePath(file.path('./www', paste(input$Territoires,"Moyenne_Annuel_2080_",input$Scenario,".png", sep='')))
    #     list(src = filename,alt = paste("Echele Spatiale ", input$Territoires))
    #   }, deleteFile = FALSE)
    # } 
    
  
### Download files 
  # output$downloadData <- downloadHandler(
  #   filename = "Moyenne.csv",
  #   content = function(file) { 
  #     file.copy("Moyenne.csv",file)
  #   }
  #   )
  
  # output$downloadData2 <- downloadHandler(
  #   filename = "Moyenne.csv",
  #   content = function(file) { 
  #     file.copy("www/Moyenne.csv",file)
  #   }
  # )
  
  }
)