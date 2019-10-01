library(tidyverse)
library(rvest)

setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise06/Task05")

html <- readRDS("oetkerhtml.rds")
nodes <- read_html(html[[1]]) %>% 
  html_nodes(".m047-searchresult-link") %>% 
  html_attr("href")

for (node in nodes) {
  html <- read_html(node)
  sublists <- html %>% 
    html_nodes(".m053-ingredients-subline")
  if (length(sublists) > 3) {
    print(html %>% html_node(".m013-intro-headline") %>% html_text())
  }
}

