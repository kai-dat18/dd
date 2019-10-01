grubbs_test <- function(data, alpha) {
  m <- mean(data)
  n <- length(data)
  max <- 0
  count <- 1
  maxindex <- 0
  for (d in data) {
    if (abs(m - d) > max) {
      max <- d
      maxindex <- count
    }
    count <- count + 1
  }
  sum <- 0
  for (d in data) {
    sum <- sum + (m - d)**2
  }
  sn <- sqrt(sum / (n - 1))
  g <- max / sn
  
  # zweiseitig!
  tas <- qt(alpha/(2*n), n-2) ** 2
  za <- ((n-1)/sqrt(n)) * sqrt(tas / (n - 2 + tas))

  if (g > za) {
    return (maxindex)
  }
  return (-1)
}

data <- rcauchy(100)
boxplot(data)
g <- grubbs_test(data, 0.05)
g
data
