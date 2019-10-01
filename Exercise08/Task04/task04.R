setwd("C:/Users/Kai Bergmann/work/fh/dd/dd19_ue_bergmann/Exercise08/Task01")
data <- data.frame(readRDS("testdata.RDS"))

dat <- matrix(rnorm(40), nrow = 10)


isolate <- function(dat, i, step =0) {
  
if (nrow(dat) <= 1) {
  return(step)
}
  
chosen_dim <- sample(dim(dat)[2], 1)
split <- runif(min = min(dat[, chosen_dim]), max = max(dat[, chosen_dim]), 1)

if (i[chosen_dim] > split) {
  s <- isolate(dat[dat[, chosen_dim] > split, ], i, step+1)
} else {
  
  s <- isolate(dat[dat[, chosen_dim] <= split, ], i, step+1)
}

s

}

isolate()


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
  steps -1
}


library(ggplot2)
ggplot(data=data, aes(x=PC1, y=PC2)) +
  geom_point()

anomaly_score <- function(dat, i, n_trees) {
  sum  <- 0
  for (index in 1:n_trees) {
    sum <- sum + isolate(dat, i)
  }
  ehx <- sum / n_trees
  n <- length(dat)
  cn <- 2*sum(1/(1:n)) - (2*(n-1))/n
  s <- 2 ** (-ehx / cn)
  s
}

print (anomaly_score(data, 37, 1000))
isolate(data, 37)
