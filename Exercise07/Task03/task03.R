
library(tidyverse)

setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise07/Task03")
data <- readRDS("banknotes.RDS")

data.pca <- prcomp(data %>% select(-Status), center = TRUE,scale. = TRUE)
data.pca$x

dn <- data %>% select(-Status) %>% 
  mutate_each_(funs(scale(.) %>% as.vector), vars=c("Length", "Left", "Right", "Bottom", "Top", "Diagonal"))

dn

andrews::andrews(dn, type=1, clr=5)
andrews::andrews(data.pca$x, type=1, clr=5)

aplpack::faces(dn)
aplpack::faces(data.pca$x)
