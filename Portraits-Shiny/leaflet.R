library(geojsonio)
library(leaflet)
library(shiny)
library(sp)

#TG  <- geojsonio::geojson_read("C:\\Users\\mlopez\\Documents\\GitHub\\SuperZip\\www\\TG.json", what = "sp") # TELUQ
#OneA <- geojsonio::geojson_read("C:\\Users\\mlopez\\Documents\\GitHub\\SuperZip\\www\\OneA.json", what = "sp") #TELUQ
#TwoC <- geojsonio::geojson_read("C:\\Users\\mlopez\\Documents\\GitHub\\SuperZip\\www\\TwoC.json", what = "sp") #TELUQ

TG  <- geojsonio::geojson_read("C:\\Users\\marlop1\\Documents\\GitHub\\SuperZip\\www\\TG.json", what = "sp") # DesktopOuranos
OneA <- geojsonio::geojson_read("C:\\Users\\marlop1\\Documents\\GitHub\\SuperZip\\www\\OneA.json", what = "sp") #DesktopOuranos
TwoC <- geojsonio::geojson_read("C:\\Users\\marlop1\\Documents\\GitHub\\SuperZip\\www\\TwoC.json", what = "sp") #DesktopOuranos
ThreeD <- geojsonio::geojson_read("C:\\Users\\marlop1\\Documents\\GitHub\\SuperZip\\www\\ThreeD.json", what = "sp") #DesktopOuranos <- geojsonio::geojson_read("C:\\Users\\marlop1\\Documents\\GitHub\\SuperZip\\www\\TwoC.json", what = "sp") #DesktopOuranos

class(TG)
names(TG)

class(OneA)
names(OneA)

class(TwoC)
names(TwoC)

bins <- c(14, 12, 10, 8, 6, 4, 2, 0, -2, -4, -5)

# colorNumeric(c("red", "green", "blue"), 1:10)
# 
# pal <- colorBin("RdYlBu", domain = TG$tg_mean, bins = bins)
# pal1a <- colorBin("RdYlBu", domain = OneA$tg_mean, bins = bins)
# pal2c <- colorBin("RdYlBu", domain = TwoC$tg_mean, bins = bins)
# pal3d <- colorBin("RdYlBu", domain = ThreeD$tg_mean, bins = bins)

pal <- colorNumeric(c("blue", "yellow", "red"), domain = TG$tg_mean, -5:14)
pal1a <- colorNumeric(c("blue", "yellow", "red"), domain = OneA$tg_mean, -5:14)
pal2c <- colorNumeric(c("blue", "yellow", "red"), domain = TG$tg_mean, -5:14)
pal3d <- colorNumeric(c("blue", "yellow", "red"), domain = ThreeD$tg_mean, -5:14)

labels <- sprintf(
  "<strong>%s</strong><br/>%g °C",
  TGT$TER_GUIDE, TG$tg_mean
) %>% lapply(htmltools::HTML)

labels1 <- sprintf(
  "<strong>%s</strong><br/>%g °C",
  OneA$TER_GUIDE, OneA$tg_mean
) %>% lapply(htmltools::HTML)
labels2 <- sprintf(
  "<strong>%s</strong><br/>%g °C",
  TwoC$TER_GUIDE, TwoC$tg_mean
) %>% lapply(htmltools::HTML)
labels3 <- sprintf(
  "<strong>%s</strong><br/>%g °C",
  ThreeD$TER_GUIDE, ThreeD$tg_mean
) %>% lapply(htmltools::HTML)

m <- leaflet(OneA) %>%
  setView(lat = 45.6, lng= -70.5, zoom = 7) %>%
  addTiles()  %>%
  addPolygons (
    fillColor = pal1a(OneA$tg_mean),
    data = OneA,
    weight = 1,
    opacity = 1,
    color = "black",
    dashArray = "3",
    fillOpacity = 0.8,
    label = labels1,
    labelOptions = labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto"))%>%
  addPolygons (
    fillColor = pal2c(TwoC$tg_mean),
    data =  TwoC,
    weight = 1,
    opacity = 1,
    color = "white",
    dashArray = "3",
    fillOpacity = 0.7,
    highlight = highlightOptions(
      weight = 2,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.8,
      bringToFront = TRUE),
    label = labels2,
    labelOptions = labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto"))%>%
  addPolygons (
    fillColor = pal3d(ThreeD$tg_mean),
    data =  ThreeD,
    weight = 1,
    opacity = 1,
    color = "red",
    dashArray = "3",
    fillOpacity = 0.7,
    highlight = highlightOptions(
      weight = 2,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.8,
      bringToFront = TRUE),
    label = labels3,
    labelOptions = labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto"))%>% 
  addLegend(pal = pal, values = ~TG$tg_mean, opacity = 0.7, title = NULL,
                                        position = "bottomright")

m
