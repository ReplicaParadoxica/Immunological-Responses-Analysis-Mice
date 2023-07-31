riginal_data <- read.csv("original.csv", header = TRUE, sep = ";")
imputed_data <- read.csv("imputed_R.csv", header = TRUE)
cor_original <- cor(original_data, use = "complete.obs")


cor_imputed <- cor(imputed_data)

cor_diff <- cor_original - cor_imputed
print(cor_diff)
