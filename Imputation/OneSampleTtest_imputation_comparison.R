original_data <- read.csv("original.csv", header = TRUE, sep = ";")
imputed_data <- read.csv("imputed_R.csv", header = TRUE)

zero_data <- original_data
zero_data[is.na(zero_data)] <- 0.001

mean_imputed <- apply(imputed_data, 2, mean)
mean_zero <- apply(zero_data, 2, mean)

diff_means <- mean_imputed - mean_zero
t_test <- t.test(diff_means)
print(t_test)
