library(readxl)
library(caret)
library(MASS)
library(ggplot2)
library(caTools)
library(FactoMineR)

data <- read_excel("original.xlsx")
df <- data.frame(rbind(data))

df[] <- lapply(df, function(column) {
  if (is.numeric(column)) {
    ifelse(is.infinite(column), 0, column)
  } else {
    column
  }
})

df[] <- lapply(df, function(column) {
  if (is.numeric(column)) {
    ifelse(is.na(column), 0, column)
  } else {
    column
  }
})

df1 <- df[1:198,]
df2 <- df[199:262,]
df1[,5:36] <- scale(df1[,5:36])
df2[,5:36] <- scale(df2[,5:36])
x1 <- subset(df1[, 5:36])
y1 <- factor(df1$Strainsite)
dfc1 <- data.frame(cbind(y1,x1))
x2 <- subset(df2[, 5:36])
y2 <- factor(df2$Strainsite)
dfc2 <- data.frame(cbind(y2,x2))
pca1 <- PCA(x1, scale.unit = TRUE, graph = FALSE)
pca2 <- PCA(x2, scale.unit = TRUE, graph = FALSE)
print(pca1)
print(pca2)
pca1_scores <- as.data.frame(pca1$ind$coord[, 1:2])
pca2_scores <- as.data.frame(pca2$ind$coord[, 1:2])
pca1_data <- cbind(pca1_scores, y1 = as.factor(y1))
pca2_data <- cbind(pca2_scores, y2 = as.factor(y2))
ggplot() +
  geom_point(data = pca1_data, aes(x = Dim.1, y = Dim.2, color = y1), alpha = 0.7) +
  geom_point(data = pca2_data, aes(x = Dim.1, y = Dim.2, color = y2), alpha = 0.7) +
  labs(x = "PC1", y = "PC2", color = "Strain Site") +
  ggtitle("Scatter plot of first two PCA scores")
