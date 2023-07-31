data_imputed <- read.csv("imputed_R.csv", header = TRUE)
correlation_matrix_imputed <- cor(data_imputed)

heatmap(correlation_matrix_imputed, 
        col = colorRampPalette(c("blue", "white", "red"))(100), 
        symm = TRUE, 
        margins = c(6, 6),
        cexRow = 0.3, 
        cexCol = 0.3) 

data_original <- read.csv("original.csv", header = TRUE)
correlation_matrix_original <- cor(data_original)

heatmap(correlation_matrix_original, 
        col = colorRampPalette(c("blue", "white", "red"))(100), 
        symm = TRUE, 
        margins = c(6, 6),
        cexRow = 0.3, 
        cexCol = 0.3) 


data_imputed <- read.csv("imputed_R.csv", header = TRUE)
correlation_matrix_imputed <- cor(data_imputed)

data_original <- read.csv("original.csv", header = TRUE)
correlation_matrix_original <- cor(data_original)
diff_matrix <- abs(correlation_matrix_imputed - correlation_matrix_original)
N <- 2
max_diff_indices <- which(diff_matrix == sort(diff_matrix, decreasing = TRUE)[N], arr.ind = TRUE)
for (i in 1:N) {
  row_index <- max_diff_indices[i, 1]
  col_index <- max_diff_indices[i, 2]
  var1 <- colnames(data_imputed)[row_index]
  var2 <- colnames(data_imputed)[col_index]
  print(paste("Variables with highest difference:", var1, "and", var2))
}
