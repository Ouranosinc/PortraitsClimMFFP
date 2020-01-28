library(geojsonio)
library(leaflet)
library(shiny)
library(sp)

TG  <- geojsonio::geojson_read("C:\\Users\\mlopez\\Documents\\GitHub\\SuperZip\\www\\TG.json", what = "sp")
OneA <- geojsonio::geojson_read("C:\\Users\\mlopez\\Documents\\GitHub\\SuperZip\\www\\OneA.json", what = "sp")
TwoC <- geojsonio::geojson_read("C:\\Users\\mlopez\\Documents\\GitHub\\SuperZip\\www\\TwoC.json", what = "sp")
class(TG)
names(TG)

class(OneA)
names(OneA)

class(TwoC)
names(TwoC)

#SpP = SpatialPolygons(list(OneA,TwoC), 1:2)
pal1a <- colorNumeric("RdYlBu", domain = OneA$tg_mean)
pal2c <- colorNumeric("RdYlBu", domain = TwoC$tg_mean)

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
    fillOpacity = 0.7,
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
      fillOpacity = 0.7,
      bringToFront = TRUE),
    label = labels2,
    labelOptions = labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto"))


m <- leaflet(OneA) %>%
  setView(lat = 45.6, lng= -70.5, zoom = 7) %>%
  addTiles()  %>%
  addPolygons (
    fillColor = pal2c(TwoC$tg_mean),
    data =  TwoC,
    weight = 1,
    opacity = 1,
    color = "blue",
    dashArray = "3",
    fillOpacity = 0.7)


m
