library(tidyverse)
library(rvest)

site <- "https://news.ycombinator.com/"

morelink <- ""

headlines <- list()

for (i in 1:30) {
  
  url <- paste0(site, morelink, sep="")
  html <- read_html(url)
  
  newheadlines <- html %>% 
    html_nodes(".storylink") %>% 
    html_text()
  headlines <- c(headlines, newheadlines)
  
  morelink <- html %>% html_node(".morelink") %>% 
    html_attr("href")
  if (is.na(morelink)) {
    break
  }
  
}

headlines
