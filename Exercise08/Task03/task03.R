setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise08/Task01")
data <- data.frame(readRDS("testdata.RDS"))



isolate <- function(dat, i) {
  steps <- 0
  border = list()
  border[1] <- min(dat[1])
  border[2] <- max(dat[1])
  border[3] <- min(dat[2])
  border[4] <- max(dat[2])
  while ((sum (dat[[1]] >= border[1] & dat[[1]] <= border[2] & dat[[2]] >= border[3] & dat[[2]] <= border[4])) > 1) {
    dim = sample(1:2, 1) 
    cut = border[[2*dim-1]] + (border[[2*dim]] - border[[2*dim-1]]) / 2
    if (data[i, dim] < cut) {
      border[2*dim] <- cut
    }
    else {
      border[2*dim -1] <- cut
    }
    steps <- steps + 1
  }
  steps
}

print (isolate(data, 1))

