library(tidyverse)

f <- function(p) {
  print (p)
  ir <-iris %>% 
    mutate(Petal.Length = ifelse (runif(nrow(iris), 0, 1) < p, NA, Petal.Length))
  ir_ona <- na.omit(ir)
  me <- mean(ir_ona$Petal.Length)
  ir_na <- ir %>% filter(is.na(Petal.Length))
  ir_na$Petal.Length <- me
  ir_new <- rbind(ir_ona, ir_na)
  mr <- mean(ir_new$Petal.Length)
  sr <- sd(ir_new$Petal.Length)
  kr <- ks.test(iris$Petal.Length, ir_new$Petal.Length)$p
  return (c(mr, sr, kr))
}

m <- c()
s <- c()
k <- c()
for (i in 1:99) {
  res <- f(i/100)
  m <- c(m, res[1])
  s <- c(s, res[2])
  k <- c(k, res[3])
}

plot(m)
plot(s)
plot(k)
