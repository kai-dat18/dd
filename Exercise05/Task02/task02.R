library(jsonlite)

data <- list(a=1, b=2, 3)
json <- toJSON(data, pretty=TRUE)
fromJSON(json)
print (json)

data <- c(a=1, b=2, 3)
json <- toJSON(data, pretty=TRUE)
fromJSON(json)
print(json)

json <- '[{"cars": [{"name": "Ford","models": ["Fiesta", "Focus", "Mustang"]}]}, "b"]'
obj <- fromJSON(json)
print (obj)
