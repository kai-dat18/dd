library(officer)
library(tidyverse)

files <- list.files(pattern = "\\.docx$")
for (f in files) {
  doc <- read_docx(f)
  content <- docx_summary(doc)
  content$text
  content$text %>% 
    keep(., str_detect(., "Invoice No. [0-9]+")) %>% 
    str_match("Invoice No. ([0-9]+)")
  
  content$text %>% 
    keep(., str_detect(., "To.*Ship")) %>% 
    str_match("To(.*)Ship")
  
  table_content <-
    content %>% 
    filter(doc_index == 3,
           is_header == FALSE) %>% 
    select(text, row_id, cell_id) %>% 
    spread(cell_id, text)
  
  table_headers <-
    content %>% 
    filter(doc_index == 3,
           is_header == TRUE) %>% 
    select(text, row_id, cell_id) %>% 
    spread(cell_id, text) %>% 
    as.character()
  
  names(table_content) <- table_headers
  
  as_tibble(table_content)
  
  items <- table_content %>% 
    filter(table_content$Quantity != "")
  
  items
  total <- table_content %>% 
    filter(table_content$Description == "Total Due")
  total$Total
}
