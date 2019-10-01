library(tidyverse)
setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise04/Task02")

split <- function(txt, pos) {
  t <- as.tibble(txt)
  write_csv(filter(t, Class == "1st"), path="1st.csv", append=TRUE, col_names = TRUE)
  write_csv(filter(t, Class == "2nd"), path="2nd.csv", append=TRUE)
  write_csv(filter(t, Class == "3rd"), path="3rd.csv", append=TRUE)
  write_csv(filter(t, Class == "Crew"), path="Crew.csv", append=TRUE)
}

read_csv_chunked("titanic.csv", split, chunk_size = 8)
