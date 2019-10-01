library(tidyverse)


processChunk <- function(chunk, pos) 
{
  
  by_class <- split(chunk, chunk$Class)
  
  for (i in seq_along(by_class)) {
    
    fname <- paste(names(by_class)[i], ".csv")
    
    if (file.exists(fname)) {
      write_csv(by_class[[i]], fname , append = TRUE)
    } else {
      write_csv(by_class[[i]], fname ,append = FALSE)
    }
    
  }
  
}

read_csv_chunked(file = 'titanic.csv', processChunk, chunk_size = 2)
