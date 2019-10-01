library(solitude)
library(tidyverse)
library(caret)

setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise09/Task02")
data <- data.frame(read.csv("synthetic.csv"))
head(data)


forest <- isolation_forest(data[,-1], num.trees =1000)


data$score <- predict(forest, data= data, type = "anomaly_score", aggregator = "median")
#data$score <- predict(forest, data= data, type = "anomaly_score", aggregator = "min")


#filter( data, data$score > 0.402)
filter( data, data$score > 0.498)
filter(data, outlier == "yes")

table(data$score > 0.498, data$outlier == "yes")

?isolation_forest



library(dbscan)

# data <- data %>% select(-outlier)
data$lof <- lof(data[,-11])
table (data$lof > 1.37, data$outlier == "yes")
data
filter(data, data$lof >1.35)
