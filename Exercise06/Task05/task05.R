library(tidyverse)
library(rvest)
library(RSelenium)

driver <- rsDriver(browser = "firefox")

client <- driver$client

client$navigate("https://www.oetker.at/at-de/rezepte/rezeptsuche-uebersicht?category=Backen&
occasion=Muttertag&sortBy=CreatedAt&q=")


for (i in 1:30) {
  weiter <- client$findElement("css selector", ".m047-searchresult-loadmore")
  weiter$clickElement()
  Sys.sleep(1)
  print (i)
}

html <- client$getPageSource()

saveRDS(html, "oetkerhtml.rds")

client$close()
driver$server$stop()
