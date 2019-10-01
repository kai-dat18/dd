library(MASS)
library(ggplot)


mu <- c(3, 5)
sigma <- matrix (c(9, 2.4, 2.4, 1), ncol=2)

points <- data.frame(mvrnorm(80, mu = mu, Sigma = sigma))

pl <-ggplot(points, aes(x=X1, y=X2)) + 
  geom_point()
pl
x <- rnorm (80, 3, 3)
y <- rnorm (80, 5, 1)
marg  <- data.frame(cbind(x, y))

pl <- pl + geom_point(data = marg, aes(x = x, y = y), color = "red")
pl


gibbs <- function(mu, sigmax, sigmay, rho, n) {
  yquer <- mu
  samples <- data.frame(c())
  for (i in 1:n) {
    muX1gegX2 <- mu[1] + (sigmax ** 0.5 / sigmay ** 0.5) * rho * (yquer[2] - mu[2])
    sigX1gegX2 <- ((1 - rho ** 2) * sigmax) ** 0.5
    yquer[1] <- rnorm(1, muX1gegX2, sigX1gegX2)
    muX2gegX1 <- mu[2] + (sigmay ** 0.5 / sigmax ** 0.5) * rho * (yquer[1] - mu[1])
    sigX2gegX1 <- ((1 - rho ** 2) * sigmay) ** 0.5
    yquer[2] <- rnorm (1, muX2gegX1, sigX2gegX1)
    samples <- rbind(samples, yquer)
  }
  samples
}

rho <- 2.4 / 3
gib <- gibbs(mu, 9, 1, rho, 80) 
colnames(gib) <- c("x", "y")

pl <- pl + geom_point(data = gib, aes(x = x, y = y), color = "blue")
pl
