library(tidyverse)
library(jsonlite)
library(leaflet)

count <- 1

b <- data.frame()

repeat {
  data <- fromJSON(paste0("https://api.openbrewerydb.org/breweries?by_name=dog&per_page=50&page=", count))
  if (length(data) == 0) {
    break
  }
  b <- rbind(b, data)
  count <- count + 1
}

b <- na.omit(b)

b$longitude <- as.numeric(b$longitude)
b$latitude <- as.numeric(b$latitude)
str(b)
leaflet(data = b) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup= (~name))