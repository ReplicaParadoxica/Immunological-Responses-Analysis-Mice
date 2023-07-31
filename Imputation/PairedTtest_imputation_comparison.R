original_data <- read.csv("original.csv", header=TRUE)
imputed_data <- read.csv("imputed_R.csv", header=TRUE)

original_norm <- shapiro.test(original_data$IL.1β)
imputed_norm <- shapiro.test(imputed_data$IL.1β)
vairance_test <- leveneTest(original_data$IL.1β, imputed_data$IL.1β, center = mean)

qqplot(original_data$IL.1β, main = "QQplot")
qqplot(imputed_data$IL.1β, main = "QQplot")

result <- t.test(original_data$IL.1β, imputed_data$IL.1β, paired=TRUE)
print(result)
