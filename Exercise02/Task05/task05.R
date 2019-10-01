library(pdftools)
library(tidyverse)

content <- pdf_text("Invoice.pdf")
content

content %>% str_match("Invoice No. ([0-9]+)")


#empfänger
content %>%
  str_match("To\\r\\n(.*)\\r\\nShip")

content %>% 
  str_match("Quantity[[:print:][:space:]]*Subtotal") %>% 
  str_replace_all("\r\n *| *\r\n", "\r\n") %>% 
  str_replace_all(" {2,}", ";") %>% 
  read_delim(delim = ";")


