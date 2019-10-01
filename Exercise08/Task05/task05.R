
library(dbscan)
library(StatMatch)

setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise08/Task05")
data <- data.frame(readRDS("dbscan_test.RDS"))

?dbscan



res = list()
for (i in seq(0, 2, 0.1)) {
  scan <- dbscan::dbscan(data, eps=i, minPts=3)
  res <- c(res, length(scan$cluster[scan$cluster == 0]))
}
res

plot(seq(0, 2, 0.1), res)

?dist

dbscan::dbscan(dist(data), eps=0.5, minPts=3)

md <- as.dist(StatMatch::mahalanobis.dist(data))

dbscan::dbscan(md, eps=0.5, minPts=3)
