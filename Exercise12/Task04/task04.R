library(mice)
library(tidyverse)

b <- mice::boys

histogram(b$bmi)
histogram(b$wgt)
histogram(b$hgt)

imp <- mice(b)
mice::complete(imp)
pred_mat <- imp$predictorMatrix
imp_methods <- imp$method
pred_mat
imp_methods

imp_methods["bmi"] <- "~I(wgt/(hgt/100**2))"

pred_mat[c("age", "hgt", "wgt", "hc", "gen", "phb", "tv", "reg"), "bmi"] <- 0
pred_mat

imp <- mice(b, predictorMatrix = pred_mat, method = imp_methods)
mice::complete(imp)

bi <-mice::complete(imp, action = "long") %>% 
  mutate(log_correct = bmi == bmi)
