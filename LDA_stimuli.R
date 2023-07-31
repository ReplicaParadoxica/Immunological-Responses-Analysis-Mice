library(readxl)
library(caret)
library(MASS)
library(ggplot2)
library(caTools)

data_file <- " original.xlsx"
raw_data <- read_excel(data_file)
merged_data <- data.frame(rbind(raw_data))

merged_data[] <- lapply(merged_data, function(col) {
  if (is.numeric(col)) {
    ifelse(is.infinite(col), 0, col)
  } else {
    col
  }
})

merged_data[] <- lapply(merged_data, function(col) {
  if (is.numeric(col)) {
    ifelse(is.na(col), 0, col)
  } else {
    col
  }
})

subset_data1 <- merged_data[1:198, ]
subset_data2 <- merged_data[199:262, ]
subset_data1[, 5:36] <- scale(subset_data1[, 5:36])
subset_data2[, 5:36] <- scale(subset_data2[, 5:36])
x1 <- subset(subset_data1[, 5:36])
y1 <- subset_data1$Stimulation
y1 <- factor(y1)
dfc1 <- data.frame(cbind(y1, x1))
x2 <- subset(subset_data2[, 5:36])
y2 <- subset_data2$Stimulation
y2 <- factor(y2)
dfc2 <- data.frame(cbind(y2, x2))
female_subset1 <- subset(subset_data1, subset_data1[, 3] == "F")
male_subset1 <- subset(subset_data1, subset_data1[, 3] == "M")
female_subset2 <- subset(subset_data2, subset_data2[, 3] == "F")
male_subset2 <- subset(subset_data2, subset_data2[, 3] == "M")
lda_model1 <- lda(y1 ~ ., data = dfc1)
lda_results1 <- predict(lda_model1, x1)
lda_data1 <- data.frame(lda_results1$x, y1)
lda_model2 <- lda(y2 ~ ., data = dfc2)
lda_results2 <- predict(lda_model2, x2)
lda_data2 <- data.frame(lda_results2$x, y2)
print(lda_model1)
print(lda_model2)
ggplot() +
  geom_point(data = lda_data1, aes(x = LD1, y = LD2, color = y1)) +
  geom_point(data = lda_data2, aes(x = LD1, y = LD2, color = y2)) +
  xlab("LD1") + ylab("LD2") +
  ggtitle("LDA Results")
