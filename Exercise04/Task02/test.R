library(tidyverse)


guess_encoding("demo_files/utf8_enc.txt")
guess_encoding("demo_files/shiftjis_enc.txt")

##############


txt <- read_lines_raw("demo_files/shiftjis_enc.txt")

str_conv(rawToChar(txt[[1]]), "Shift-JIS")

##############

counts <- 0
accumulate_counts <- function(txt, pos) {
  
  txt_letters <-
    str_extract_all(txt, "\\w") %>% 
    unlist() %>% 
    str_to_upper() %>% 
    factor(levels = LETTERS) 
  
  counts <<- counts + table(txt_letters)
  
  print(pos)
  print(counts)
}

read_lines_chunked("demo_files/big_file.txt", accumulate_counts, chunk_size = 23)
barplot(counts)

#########

write_csv(data.frame(a = "鬼"), "demo_files/csv1.csv")
write_excel_csv(data.frame(a = "鬼"), "demo_files/csv2.csv")
