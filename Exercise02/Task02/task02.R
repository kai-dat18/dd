library(officer)
library(tidyverse)

ppt1 <- read_pptx("pptx_test.pptx")
content1 <- pptx_summary(ppt1) %>% 
  as_tibble()
View(content1)

ppt2 <- read_pptx("pictures.pptx")
content2 <- pptx_summary(ppt2)
View(content2)
which(content2$content_type == "image")
for (index in which(content2$content_type == "image")) {
  media_extract(ppt2, content2$media_file[index], paste(index, ".png"))
}
