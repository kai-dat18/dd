library(tidyverse)



# 1. variante -------------------------------------------------------------



ir <- data.frame(iris)

for (i in 1:nrow(ir)) {
  p <- 0.45
  if (ir[i, 5] == "virginica") p <- 0.1
  if (ir[i, 5] == "versicolor") p <- 0.2
  if (runif(1, 0, 1) < p) {
    ir[i, 2] <- NA
  }
}

mean(ir$Sepal.Width, na.rm = T)
mean(iris$Sepal.Width)
sd(ir$Sepal.Width, na.rm = T)
sd(iris$Sepal.Width)

# MAR

# 2. variante -------------------------------------------------------------

ir <-  iris %>% 
  mutate(Sepal.Width = ifelse (runif(nrow(iris), 0, 1) < 0.25, NA, Sepal.Width))

mean(ir$Sepal.Width, na.rm = T)
mean(iris$Sepal.Width)
sd(ir$Sepal.Width, na.rm = T)
sd(iris$Sepal.Width)

# MCAR

# 3. variante -------------------------------------------------------------

ir <-  iris %>% mutate(Sepal.Width = ifelse (runif(nrow(iris), 0, 1) < (Sepal.Width / 8.5), NA, Sepal.Width))

mean(ir$Sepal.Width, na.rm = T)
mean(iris$Sepal.Width)
sd(ir$Sepal.Width, na.rm = T)
sd(iris$Sepal.Width)

# MAR