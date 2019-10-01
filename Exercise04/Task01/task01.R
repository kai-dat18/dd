library(readr)
setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise04/Task01")
guess_encoding("unknown_encoding.txt")

read_lines("unknown_encoding.txt", locale=locale(encoding="ISO-8859-2"))
