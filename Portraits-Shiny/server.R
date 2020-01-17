shinyServer(
  function(input, output, session){
    # Send a pre-rendered image, and don't delete the image after sending it
    output$myImage <- renderImage({
      # When input$n is 3, filename is ./images/image3.jpeg
      filename <- normalizePath(file.path('./www',
                                          paste(input$Territoires,"Moyenne_Annuel_Hist_Elevees.png", sep='')))
      
      # Return a list containing the filename and alt text
      list(src = filename,
           alt = paste("Echele Spatiale ", input$Territoires))
      
    }, deleteFile = FALSE)
    output$myImage2 <- renderImage({
      # When input$n is 3, filename is ./images/image3.jpeg
      filename <- normalizePath(file.path('./www',
                                          paste(input$Territoires,"Moyenne_Annuel_2050_Elevees.png", sep='')))
      
      # Return a list containing the filename and alt text
      list(src = filename,
           alt = paste("Echele Spatiale ", input$Territoires))
      
    }, deleteFile = FALSE)
    output$myImage3 <- renderImage({
      # When input$n is 3, filename is ./images/image3.jpeg
      filename <- normalizePath(file.path('./www',
                                          paste(input$Territoires,"Moyenne_Annuel_Hist_Elevees.png", sep='')))
      
      # Return a list containing the filename and alt text
      list(src = filename,
           alt = paste("Echele Spatiale ", input$Territoires))
      
    }, deleteFile = FALSE)
    output$myImage4 <- renderImage({
      # When input$n is 3, filename is ./images/image3.jpeg
      filename <- normalizePath(file.path('./www',
                                          paste(input$Territoires,"Moyenne_Annuel_2080_Elevees.png", sep='')))
      
      # Return a list containing the filename and alt text
      list(src = filename,
           alt = paste("Echele Spatiale ", input$Territoires))
      
    }, deleteFile = FALSE)
  
### Download fiels 
  output$downloadData1 <- downloadHandler(
    filename = function() {
      paste(input$Variable, ".csv", sep = "")
    }
    )
  output$downloadData2 <- downloadHandler(
    filename = function() {
      paste(input$Variable, "2.csv", sep = "")
    }
  )
  
  }
)