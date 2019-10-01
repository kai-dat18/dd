library(officer)
library(tidyverse)

t <- data.frame(Titanic)

first <- ggplot(data=t[t$Class == "1st",], aes(x=Survived, weight=Freq)) +
  geom_bar() +
  facet_grid(Sex ~ Age)

second <- ggplot(data=t[t$Class == "2nd",], aes(x=Survived, weight=Freq)) +
  geom_bar() +
  facet_grid(Sex ~ Age)

third <- ggplot(data=t[t$Class == "3rd",], aes(x=Survived, weight=Freq)) +
  geom_bar() +
  facet_grid(Sex ~ Age)

crew <- ggplot(data=t[t$Class == "Crew",], aes(x=Survived, weight=Freq)) +
  geom_bar() +
  facet_grid(Sex ~ Age)


pres <- 
  read_pptx() %>% 
  add_slide(master = "Office Theme", layout = "Title and Content") %>% 
  ph_with("1st", location = ph_location_type("title")) %>% 
  ph_with(first, location = ph_location_type("body")) %>% 
  add_slide(master = "Office Theme", layout = "Title and Content") %>% 
  ph_with("2nd", location = ph_location_type("title")) %>% 
  ph_with(second, location = ph_location_type("body")) %>% 
  add_slide(master = "Office Theme", layout = "Title and Content") %>% 
  ph_with("3rd", location = ph_location_type("title")) %>% 
  ph_with(third, location = ph_location_type("body")) %>% 
  add_slide(master = "Office Theme", layout = "Title and Content") %>% 
  ph_with("Crew", location = ph_location_type("title")) %>% 
  ph_with(crew, location = ph_location_type("body"))

print(pres, target = "titanic.pptx")
  
