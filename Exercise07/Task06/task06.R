library(MASS)

setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise07/Task06")
data <- readRDS("data.RDS")

cov(data)

distances <- rep(NA, 20)

distances[1] <- mahalanobis(c(-3, 4.5), c(0,0), cov(data))

for (index in seq(2, 20, by=1)) {
  data <- rbind(data, mvrnorm(1, mu=c(-3, 4.5), Sigma=matrix(c(1, 0, 0, 1), ncol=2)))
  distances[index] <- mahalanobis(c(-3, 4.5), c(0,0), cov(data))
}

distances

plot(distances)
plot(unlist(distances))
