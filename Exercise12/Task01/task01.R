library(tidyverse)

f <- function() {
  return (iris %>% 
            mutate(Sepal.Width = ifelse (runif(nrow(iris), 0, 1) < 0.25, NA, Sepal.Width)))
}

pmm <- function(data) {
  ona <- na.omit(data)
  sample <- dplyr::sample_n(ona, 100, replace=T)
  m <- lm(Sepal.Width ~ ., data = ona)
  sample$pred <- predict(m, newdata = sample)
  sample <- sample[order(sample$pred),]
  na <- data %>% filter(is.na(Sepal.Width))
  na$Sepal.Width <- predict(m, newdata = na)
  for (i in 1:nrow(na)) {
    sw <- na[i,]$Sepal.Width
    ni <- which.min(abs(sample$pred - sw))
    if (ni < 3) {
      to_select <- head(sample, n = 5)
    } else if (ni > nrow(sample) - 3) {
      to_select <- tail(sample, n = 5)
    } else {
      to_select <- sample[(ni-2):(ni+2), ]
    }
    selected <- sample_n(to_select, 1)
    na[i,]$Sepal.Width <- selected$Sepal.Width
  }
  return (rbind(na, ona))
}

ir <- f()

iri <- pmm(ir)

