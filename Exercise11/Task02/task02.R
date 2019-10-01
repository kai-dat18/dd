library(tidyverse)



# Funktionsdef. -------------------------------------------------------------

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

# bsp 2 -------------------------------------------------------------



simulate <- function(f) {
  cors <- c()
  for (i in 1:50) {
    ir <- f()
    ir_ona <- na.omit(ir)
    m <- lm(Sepal.Width ~ Sepal.Length * Species, data = ir)
    ir_na <- ir %>% filter(is.na(Sepal.Width))
    ir_na$Sepal.Width <- predict(m, newdata = ir_na)
    ir_new <- rbind(ir_ona, ir_na)
    #cors <- c(cors, cor(ir_new$Sepal.Width, ir_new$Sepal.Length))
    cors <- c(cors, cor(ir_na$Sepal.Width, ir_na$Sepal.Length))
  }
  return (cors)
}

c1 <- simulate(f1)
c2 <- simulate(f2)
c3 <- simulate(f3)
boxplot(c1, c2, c3)
cor(iris$Sepal.Width, iris$Sepal.Length)
