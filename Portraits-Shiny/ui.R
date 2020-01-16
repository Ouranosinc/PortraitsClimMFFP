library(shinythemes)
shinyServer (     
  fluidPage( 
    #themeSelector(),
    
    headerPanel(title=div(img(src='MFFP.png', width="100px", align="left"), br(), "Portraits Climatiques du Québec")),
    sidebarPanel(

###Echele spatial      
      selectInput("Echele", "Séléctionez l'échele spatiale:",
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
                       selectInput("Territoires", "Séléctionez le territoire:",
                                   choices=c("Tous les Territoires", "1a", "2a"))),
      conditionalPanel(condition = "input.Echele == 'Secteurs des opérations régionales'",
                       selectInput("Secteurs", "Séléctionez le secteur:",
                                   choices=c("Centre du Quebec", "Nord-est"))),                
      conditionalPanel(condition = "input.Echele == 'Régions forestières'",
                       selectInput("REgForest", "Séléctionez la région:",
                                   choices=c("Abitibi-Temiscamingue", "Bas-Saint-Laurent)"))),                
      conditionalPanel(condition = "input.Echele == 'Unités d’aménagement (UA)'",
                       selectInput("UA", "Séléctionez l'unité:",
                                   choices=c("01171", "01272"))),         
      
###Variable
       selectInput("Variable", "Séléctionez la variable climatique:",
                  choices=c("Températures moyennes, min et max","Précipitations totales et sous forme de neige",
                            "Degrés-jours de croissance", "Évènements gel-dégel", "Saison de croissance")),
      conditionalPanel(condition = "input.Variable == 'Températures moyennes, min et max'",
                       actionButton("Moyenne", "Températures moyennes (°C)"),
                       actionButton("Maximum", "Moyenne des températures maximales quotidiennes (°C)"),
                       actionButton("Minimum", "Moyenne des températures minimales quotidiennes (°C)")),
      conditionalPanel(condition = "input.Variable == 'Précipitations totales et sous forme de neige'",
                       actionButton("PrecTotale", "Précipitations totales (mm)"),
                       actionButton("Neige", "Précipitations sous forme de neige (cm)")),
      br(),
      
             
###Saisonnalité
      selectInput("Saisonnalite", "Séléctionez la saisonnalité:",
                  choices=c("Annuel", "Saissoniers", "Mensuel" )),
      conditionalPanel(condition = "input.Saisonnalite == 'Saissoniers'",
                       actionButton("Hiver", "Hiver"),
                       actionButton("Printemps", "Printemps"),
                       actionButton("Été", "Été"),
                       actionButton("Automne", "Automne")),
      conditionalPanel(condition = "input.Saisonnalite == 'Mensuel'",
                       selectInput("Mois", "Séléctionez le mois:",
                                   choices=c("Janvier", "Février", "Mars", "Avril","Mai","Juin",
                                             "Julliet","Aout","Septembre","Octobre","Novembre","Decembre"))
                       ),

###Scenario
     # selectInput("Scenario", "Séléctionez le scenario d'émissions:",
      #            choices=c("Modérées (RCP4.5)", "Élevées (RCP8.5)" )),
      h5(tags$b("Séléctionez le scenario d'émissions:")),
      actionButton("Moderees", "Modérées (RCP4.5)"),
      actionButton("Elevees", "Élevées (RCP8.5)"),
    
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
       tabPanel(div(icon("calendar"), "2041-2070"), 
                 
                 fluidRow(
                   column(6, offset = 0,
                          wellPanel(p("Données Historiques"),
                                    imageOutput("myImage"))),
                   column(6, offset = 0,
                          wellPanel(p("Données pour l'Horizon 2041-2070"),
                                    #img(src='image1.png', width="400px", align="center")
                                    imageOutput("myImage2")
                                    ))
                 )),
        tabPanel(div(icon("calendar"),"2071-2100"), 
                 
                 fluidRow(
                   column(6, offset = 0,
                          wellPanel(p("Données Historiques"),
                                    img(src='image1.png', width="400px", align="center"))),
                   column(6, offset = 0,
                          wellPanel(p("Données pour l'Horizon 2071-2100"),
                                    img(src='image1.png', width="400px", align="center")))
                 )),
        tabPanel(div(icon("image"), "Graphique"),
                                    br(),
                                    img(src='temMoy.png', width="900px", align="center")),

        tabPanel(div(icon("table"),"Sommaire"), 
                 br(),
                 img(src='sommaire.png', width="900px", align="center"))

        )
      #img(src='image2.png', align="right")
      #imageOutput("myImage")
    )
  )
)
