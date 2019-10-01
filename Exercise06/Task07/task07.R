library(tidyverse)
library(rvest)

setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise06/Task05")

html <- readRDS("oetkerhtml.rds")
nodes <- read_html(html[[1]]) %>% 
  html_nodes(".m047-searchresult-link") %>% 
  html_attr("href")

max <- 0
recipe <- ""

for (node in nodes) {
  html <- read_html(node)
  
  amounts <- html %>% 
    html_nodes(".amount")
  
  if (length(amounts) < 4) {
    next
  }
  amount <- strtoi(amounts[[4]] %>% html_text)

    if (amount > max) {
      max <- amount
      recipe <- html %>% html_node(".m013-intro-headline") %>% html_text()
  }
}

print (recipe)
print (max)
