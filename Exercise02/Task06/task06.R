library(tesseract)
library(tidyverse)

engine <- tesseract(options = list(tessedit_pageseg_mode = 4))

ocr("Invoicetable.png", engine = engine) %>% 
  read_delim(delim = " ",
             locale = locale(decimal_mark = ","),
             col_names = FALSE)

data <- ocr_data("Invoicetable.png", engine = engine)
data
