library(OutliersO3)

setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise08/Task05")
data <- data.frame(readRDS("dbscan_test.RDS"))

library(ggplot2)
ggplot(data=data, aes(x=X1, y=X2)) +
  geom_point()

c1 <- O3prep(data, k1=2, method=c("HDo", "BAC", "PCS", "DDC", "adjOut", "MCD"), tolHDo=0.4127, tolBAC=0.7)

c2 <- O3plotM(c1)
c2$nOut
c2$gO3
