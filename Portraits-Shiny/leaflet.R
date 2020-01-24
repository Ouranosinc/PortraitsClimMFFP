library(geojsonio)
library(leaflet)

states <- geojsonio::geojson_read("C:\\Users\\mlopez\\Documents\\GitHub\\Tests\\output2.json", what = "sp")
class(states)

names(states)

pal <- colorNumeric("RdYlBu", domain = states$tg_mean)

m <- leaflet(states) %>%
  setView(lat = 45.6, lng= -70.5, zoom = 7) %>%
  addTiles()  %>%
  addPolygons(fillColor = pal(states$tg_mean),
              weight = 1,
              opacity = 1,
              color = "white",
              dashArray = "3",
              fillOpacity = 0.7)

