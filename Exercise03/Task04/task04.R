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

doc <- 
  read_docx() %>% 
  body_add_par(value = "1st", style = "heading 1") %>% 
  body_add_gg(first) %>%
  body_add_par(value = "2nd", style = "heading 1") %>% 
  body_add_gg(second) %>% 
  body_add_par(value = "3rd", style = "heading 1") %>% 
  body_add_gg(third) %>% 
  body_add_par(value = "Crew", style = "heading 1") %>% 
  body_add_gg(crew)

print(doc, target = "titanic.docx")
