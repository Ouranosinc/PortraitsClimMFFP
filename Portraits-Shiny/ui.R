library(shinythemes)
shinyServer (     
  fluidPage( 
    #themeSelector(),
    
    headerPanel("Portraits Climatiques du Québec - MFFP"),
    sidebarPanel(

###Variable
       selectInput("Variable", "Séléctionez la variable climatique:",
                  choices=c("Températures moyennes, min et max","Précipitations totales et sous forme de neige",
                            "Degrés-jours de croissance", "Évènements gel-dégel", "Saison de croissance")),
      conditionalPanel(condition = "input.Variable == 'Températures moyennes, min et max'",
                       actionButton("Moyenne", "Températures moyennes (°C)"),
                       actionButton("Maximum", "Moyenne des température maximales quotidiennes (°C)"),
                       actionButton("Minimum", "Moyenne des températures minimales quotidiennes (°C)")),
      conditionalPanel(condition = "input.Variable == 'Précipitations totales et sous forme de neige'",
                       actionButton("PrecTotale", "Précipitations totales (mm)"),
                       actionButton("Neige", "Précipitations sous forme de neige (cm)")),
      br(),
      
###Echele spatial      
      selectInput("Echele", "Séléctionez l'échele:",
                 choices=c("Domaines et sous-domaines bioclimatiques", "Régions et sous-région écologiques", 
                           "Territoires guides", "Secteurs des opérations régionales",
                           "Régions forestières", "Unités d’aménagement (UA)")),
      conditionalPanel(condition = "input.Echele == 'Domaines et sous-domaines bioclimatiques'",
                 selectInput("Domaines", "Séléctionez le domaine ou sous-domaine:",
                             choices=c("Golfe du Saint-Laurent", "Pessiere a lichens", "Toundra arctique arbustive" ))),
      conditionalPanel(condition = "input.Echele == 'Régions et sous-région écologiques'",
                selectInput("RegEcol", "Séléctionez la région ou sous-région:",
                            choices=c("Collines ceinturant le lac Saint-Jean", "Coteau de l'Estrie" ))),
      conditionalPanel(condition = "input.Echele == 'Territoires guides'",
                selectInput("Terriotoires", "Séléctionez le territoire:",
                            choices=c("1a", "2a"))),
      conditionalPanel(condition = "input.Echele == 'Secteurs des opérations régionales'",
                selectInput("Secteurs", "Séléctionez le secteur:",
                            choices=c("Centre du Quebec", "Nord-est"))),                
      conditionalPanel(condition = "input.Echele == 'Régions forestières'",
                 selectInput("REgForest", "Séléctionez la région:",
                             choices=c("Abitibi-Temiscamingue", "Bas-Saint-Laurent)"))),                
      conditionalPanel(condition = "input.Echele == 'Unités d’aménagement (UA)'",
                 selectInput("UA", "Séléctionez l'unité:",
                             choices=c("01171", "01272"))),                

                      
###Saisonalité
      selectInput("Saisonalite", "Séléctionez la saisonalité:",
                  choices=c("Annuel", "Saissioniers", "Mensuel" )),
      conditionalPanel(condition = "input.Saisonalite == 'Saissioniers'",
                       actionButton("Hiver", "Hiver"),
                       actionButton("Printemps", "Printemps"),
                       actionButton("Été", "Été"),
                       actionButton("Automne", "Automne")),
      conditionalPanel(condition = "input.Saisonalite == 'Mensuel'",
                       selectInput("Mois", "Séléctionez le mois:",
                                   choices=c("Janvier", "Février", "Mars", "Avril","Mai","Juin",
                                             "Julliet","Aout","Septembre","Octobre","Novembre","Decembre"))
                       ),

###Test input
     # numericInput("n", "n", 1),

###Scenario
     # selectInput("Scenario", "Séléctionez le scenario d'émissions:",
      #            choices=c("Modérées (RCP4.5)", "Élevées (RCP8.5)" )),

###Temps
     # selectInput("Horizon", "Séléctionez l'horizon de temps:",
           #       choices=c("Historique (1950-2020)", "2041-2070 (2050)", "2071-2100 (2080)" )),

###Percentile
      sliderInput("Percentile", "Séléctionez le percentile:",
                  min=10, max=90, value= 50, step=40)
      
    ),
    
    mainPanel(
###Tabs Panel for Time Horizont      
      tabsetPanel(
        tabPanel("Historique (1980-2010)", 
                 
### Columns for emissions scenarios 
                fluidRow(
                  column(10,
                         wellPanel(p("Historique (1980-2010)"))
                )),
                 fluidRow(
                   column(6, offset = 0,
                          wellPanel(p("Scenario d'émissions modérées (RCP4.5)"),
                          img(src='image1.png', width="300px", align="center"),
                          br(),
                          img(src='image2.png', width="300px", align="center"))),
                   column(6, offset = 0,
                          wellPanel(p("Scenario d'émissions élevées (RCP8.5)"),
                                    img(src='image1.png', width="300px", align="center"),
                                    br(),
                                    img(src='image2.png', width="300px", align="center"))
                          )
                   )),
        tabPanel("2041-2070 (2050)", 
                 fluidRow(
                   column(10,
                          wellPanel(p("2041-2070 (2050)"))
                   )),
                 fluidRow(
                   column(6, offset = 0,
                          wellPanel(p("Scenario d'émissions modérées (RCP4.5)"),
                                    img(src='image1.png', width="300px", align="center"),
                                    br(),
                                    img(src='image2.png', width="300px", align="center"))),
                   column(6, offset = 0,
                          wellPanel(p("Scenario d'émissions élevées (RCP8.5)"),
                                    img(src='image1.png', width="300px", align="center"),
                                    br(),
                                    img(src='image2.png', width="300px", align="center"))
                   )
                 )),
        tabPanel("2071-2100 (2080)", 
                 fluidRow(
                   column(10,
                          wellPanel(p("2071-2100 (2080)"))
                   )),
                 fluidRow(
                   column(6, offset = 0,
                          wellPanel(p("Scenario d'émissions modérées (RCP4.5)"),
                                    img(src='image1.png', width="300px", align="center"),
                                    br(),
                                    img(src='image2.png', width="300px", align="center"))),
                   column(6, offset = 0,
                          wellPanel(p("Scenario d'émissions élevées (RCP8.5)"),
                                    img(src='image1.png', width="300px", align="center"),
                                    br(),
                                    img(src='image2.png', width="300px", align="center"))
                   )
                 ))
        )
      #img(src='image2.png', align="right")
      #imageOutput("myImage")
    )
  )
)