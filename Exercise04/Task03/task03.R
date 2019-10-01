library(readr)
setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise04/Task03")
d <- read_file_raw("unusual_encoding.txt")

for (item in d) {
    iv <- as.integer(item)
    im <- (iv * 29) %% 255
    ch <- rawToChar(as.raw(im))
    print (ch)
}

iv <- as.integer(d)
im <- (iv * 29) %% 255
ch <- rawToChar(as.raw(im))
print (ch)
