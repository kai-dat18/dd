
n <- 1000
m <- 100


computeOutliersNums <- function(matrix) {
  outliers <- list()
  for (row in 1:nrow(matrix)) {
    line <- matrix[row, ]
    iqr <- IQR(line)
    q25 <- quantile(line, 0.25) - 1.5 * iqr
    q75 <- quantile(line, 0.75) + 1.5 * iqr
    condition <- sapply(line, function(x) x<q25 | x>q75)
    outliers[row] <- length(line[condition])[[1]]
  }
  list(outliers, mean)
}

x <- rnorm(n*m, mean=0, sd=1)
X <- matrix(x, ncol=m)
norm <- computeOutliersNums(X)
mean(norm)
sd(norm)

x <- rexp(n*m, 0.25)
X <- matrix(x, ncol=m)
exp025 <- computeOutliersNums(X)
mean(exp025)
sd(exp025)

x <- rexp(n*m, 2)
X <- matrix(x, ncol=m)
exp2 <- computeOutliersNums(X)
mean(exp2)
sd(exp2)

x <- rcauchy(n*m, 0, 2)
X <- matrix(x, ncol=m)
cauchy <- computeOutliersNums(X)
mean(cauchy)
sd(cauchy)
