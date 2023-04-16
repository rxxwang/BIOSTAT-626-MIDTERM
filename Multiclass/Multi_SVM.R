####################################################
#####      Multiclass SVM linear & Radial      #####
####################################################

setwd("/home/rxxwang/biostat626")
load("midterm_data.RData")
library(caret)

ctrl = trainControl(method = "repeatedcv", repeats = 10)
set.seed(434)
model.svm.l2 <- train(result2~., data=data2, method = "svmLinear", trControl = ctrl)
model.svm.l2$results
test.svm.l2 <- predict(model.svm.l2, newdata = test)
submit = data.frame(
  test.svm.l2 = as.numeric(test.svm.l2)
)
write.table(submit, file = "multiclass_1015_svmlinear.txt", row.names = F, col.names = F)

ctrl = trainControl(method = "repeatedcv", repeats = 10)
set.seed(435)
model.svm.r2 <- train(result2~., data=data2, method = "svmRadial", trControl = ctrl)
model.svm.r2$results
test.svm.r2 <- predict(model.svm.r2, newdata = test)
submit = data.frame(
  test.svm.r2 = as.numeric(test.svm.r2)
)
write.table(submit, file = "multiclass_1015_svmradial.txt", row.names = F, col.names = F)