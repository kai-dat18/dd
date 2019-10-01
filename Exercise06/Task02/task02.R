library(tidyverse)
library(rvest)

table <- read_html("https://www.imdb.com/title/tt0903747/fullcredits")  %>%
  html_node(".cast_list") %>% 
  html_table() %>% 
  as.tibble() %>% 
  select(c(X2, X4)) %>% 
  filter(X2 != "") %>% 
  separate(X4, into=c("c", "t"), sep="\n")
table
