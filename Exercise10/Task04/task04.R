library(validate)
library(tidyverse)

setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise10/Task04")
dat <- read_csv("dataset.txt")
dat



v <- validator(.file='rules.yaml')

dat %>%  confront(v) %>% summary()

