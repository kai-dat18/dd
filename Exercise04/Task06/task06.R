library(microbenchmark)
library(h5)

setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise04/Task06")
f <- h5file("test.h5", mode = "w")

date_vec <- seq(as.POSIXct("2015-12-01"), as.POSIXct("2015-12-31"), by ="secs")
mat <- cbind(date_vec, matrix(rnorm(length(date_vec) * 3), ncol = 3))
## set chunksize to one day
f["datumstest/testseries", chunksize= c(24*60, 1)] <- mat
f["datumstest/testseriesunchunked"] <- mat
h5flush(f)
h5close(f)

f <- h5file("test.h5", mode = "r")
microbenchmark(f["datumstest/testseries"][1:100, ])
microbenchmark(f["datumstest/testseriesunchunked"][1:100, ], times=10)
h5close(f)
