library(openxlsx)
library(officer)
library(tidyverse)

hs <- createStyle(fontColour = "#ff0000", textDecoration = "Bold")

write.xlsx(iris, file="test.xlsx", headerStyle=hs)



ggpl<-
  ggplot(iris, aes(x=Petal.Width, y=Sepal.Width)) +
  geom_point()

pres <- 
  read_pptx() %>% 
  add_slide(master = "Office Theme", layout = "Title and Content") %>% 
  #ph_with_gg(ggpl)
  ph_with(ggpl, location = ph_location_fullsize())

print(pres, target = "ggpl.pptx")


