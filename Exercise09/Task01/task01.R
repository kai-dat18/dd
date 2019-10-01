library(solitude)
library(tidyverse)

setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise09/Task01")
data <- data.frame(readRDS("banknotes.RDS"))
head(data)


forest <- isolation_forest(data[,-1], num.trees =1000)


data$score <- predict(forest, data= data, type = "anomaly_score", aggregator = "median")
#data$score <- predict(forest, data= data, type = "anomaly_score", aggregator = "median")

plot(ecdf(data$score))
#filter( data, data$score > 0.402)
filter( data, data$score > 0.41)

table(data$score > 0.41, data$Status)
