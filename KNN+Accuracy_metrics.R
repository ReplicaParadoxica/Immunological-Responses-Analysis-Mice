library(readxl)
library(caret)
library(MASS)
library(ggplot2)
library(caTools)

data_file <- "original.xlsx"
data <- read_excel(data_file)

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

df1 <- df[1:198, ]
df1[, 5:36] <- scale(df1[, 5:36])
x1 <- subset(df1[, 5:36])
y1 <- df1$Stimulation
y1 <- factor(y1)
dfc1 <- data.frame(cbind(y1, x1))

df2 <- df[199:262, ]
df2[, 5:36] <- scale(df2[, 5:36])
x2 <- subset(df2[, 5:36])
y2 <- df2$Stimulation
y2 <- factor(y2)
dfc2 <- data.frame(cbind(y2, x2))

defemale1 <- subset(df1, df1[, 3] == "F")
dmale1 <- subset(df1, df1[, 3] == "M")
defemale2 <- subset(df2, df2[, 3] == "F")
dmale2 <- subset(df2, df2[, 3] == "M")

split_ratio <- 0.8
split <- sample.split(df1, SplitRatio = split_ratio)
split
xt1 <- subset(scale(df1[, 5:36]), split == "TRUE")
w1 <- subset(scale(df1[, 5:36]), split == "FALSE")
yt1 <- subset(df1$Stimulation, split == "TRUE")
yt1 <- factor(yt1)
zt1 <- subset(df1$Stimulation, split == "FALSE")
zt1 <- factor(zt1)
dfratio1 <- data.frame(cbind(yt1, xt1))
test1 <- data.frame(cbind(zt1, w1))

library(class)
library(ggplot2)

k <- 2
pred <- knn(xt1, w1, yt1, k)

cm <- table(pred, zt1)
print(cm)

accuracy <- sum(diag(cm)) / sum(cm)
print(paste("Accuracy:", accuracy))

test1$pred <- pred
ggplot(test1, aes(x = w1[, 1], y = w1[, 2], color = pred)) + geom_point()

library(class)
library(ggplot2)

K_values <- c(1, 5, 10, 15, 20)
accuracy_scores <- list()

for (k in K_values) {
  pred <- knn(xt1, w1, yt1, k)
  cm <- table(pred, zt1)
  acc <- sum(diag(cm)) / sum(cm)
  accuracy_scores[[as.character(k)]] <- acc
  test1$pred <- pred
  ggplot(test1, aes(x = w1[, 1], y = w1[, 2], color = pred)) +
    geom_point() +
    ggtitle(paste0("K = ", k))
}
accuracy_df <- data.frame(K = K_values, Accuracy = unlist(accuracy_scores))
ggplot(accuracy_df, aes(x = K, y = Accuracy))  + geom_line() + ggtitle("Accuracy vs K values")
