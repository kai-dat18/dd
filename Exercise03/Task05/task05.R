library(officer)
library(flextable)
library(tidyverse)

head(mtcars)

flextable(head(mtcars)) %>% 
  color(i = 1:5, j = 8, "red") %>% 
  color(i = 1:5, j = 9, "red") %>% 
  bg(i = 5:6, j = ~mpg, "green") %>% 
  bold(i = 3:4, j = ~cyl) %>% 
  add_header_row(values="mtcars", colwidths = 11) %>% 
  fontsize(part="header", size=18) %>% 
  align( align = "center", part = "header" ) %>% 
  autofit

          