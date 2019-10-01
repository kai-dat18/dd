library(mice)
library(tidyverse)

f1 <- function() {
  ir <- data.frame(iris)
  for (i in 1:nrow(ir)) {
    p <- 0.45
    if (ir[i, 5] == "virginica") p <- 0.1
    if (ir[i, 5] == "versicolor") p <- 0.2
    if (runif(1, 0, 1) < p) {
      ir[i, 2] <- NA
    }
  }
  return (ir)
}

f2 <- function() {
  return (iris %>% 
            mutate(Sepal.Width = ifelse (runif(nrow(iris), 0, 1) < 0.25, NA, Sepal.Width)))
}

f3 <- function() {
  return (iris %>% 
            mutate(Sepal.Width = ifelse (runif(nrow(iris), 0, 1) < 0.25, NA, Sepal.Width)))
}

f1 <- f1()
f2 <- f2()
f3 <- f3()

quickpred(f1)
