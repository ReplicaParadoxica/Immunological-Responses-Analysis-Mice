# Use getwd() or file.choose() for file path
library(mice)

data <- read.csv("original.csv", header = TRUE, sep = ";")

imputed_data <- mice(data)
completed_data <- complete(imputed_data)

write.csv(completed_data, "imputed.csv", row.names = FALSE)
