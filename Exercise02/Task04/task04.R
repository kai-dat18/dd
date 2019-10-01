library(officer)
library(tidyverse)

doc <- read_docx("table.docx")
content <- docx_summary(doc)
content

rows = max(content$row_id, na.rm=T)
cells = max(content$cell_id, na.rm=T)

result = array(numeric(),c(r, c)) 

for (r in 1:rows) {
  for (c in 1:cells) {
    cell <- content %>% 
      filter(row_id == r, cell_id == c)
    if (!is.na(cell$text)) {
      result[r, c] <- cell$text
    }
    else {
      if (cell$col_span == 0) {
        result[r, c] <- result[r, c-1]
      }
      if (cell$row_span == 0) {
        result[r, c] <- result[r-1, c]
      }
    }
  }
}

as.tibble(result)
