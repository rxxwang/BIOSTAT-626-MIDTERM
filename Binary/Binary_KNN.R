###################################################
#####                   KNN                   #####
###################################################

setwd("/home/rxxwang/biostat626")
load("midterm_data.RData")
library(caret)

set.seed(328)
ctrl = trainControl(method = "repeatedcv", repeats = 10)
model.knn1 <- train(result1 ~ ., data = data1, method = "knn", 
                    trControl = ctrl, tuneLength = 30)
model.knn1$results
pred.knn1 <- predict(model.knn1, newdata = test)
submit = data.frame(
  pred.knn1 = as.numeric(pred.knn1)-1
)
write.table(submit, file = "binary_1015_knn.txt", row.names = F, col.names = F)