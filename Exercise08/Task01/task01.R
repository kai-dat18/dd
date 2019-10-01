
library(tidyverse)
library(spatstat)


d <- 5

setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise08/Task01")
data <- data.frame(readRDS("testdata.RDS"))

#ggplot(data=data, aes(x=PC1, y=PC2)) +
#  geom_point()

dist <- nndist(data, k= d)

print (nnwhich(data, k=c(seq(1, d, 1))))


count <- 1
for (p1 in 1:nrow(data)) {
  countintern <- 0
  for (p2 in 1:nrow(data)) {
    if ((sqrt((data[p1, 1] - data[p2, 1]) ** 2 + (data[p1, 2] - data[p2, 2]) ** 2) - dist[count]) < 0) {
      countintern <- countintern + 1
    }
  }
  print (countintern)
  count <- count + 1;
}

?nndist
dir(spatstat)
