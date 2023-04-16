#####################################################
#####      Multiclass SVM linear & Radial2      #####
#####################################################

setwd("/home/rxxwang/biostat626")
load("midterm_data2.RData")
library(caret)

ctrl = trainControl(method = "repeatedcv", repeats = 10)
set.seed(434)
model.svm.l2.1 <- train(result2~., data=data2.1, method = "svmLinear", 
                        trControl = ctrl)
model.svm.l2.1$results
test.svm.l2.1 <- predict(model.svm.l2.1, newdata = test1)
test.svm.l2.1  = as.numeric(test.svm.l2.1)
model.svm.l2.2 <- train(result2~., data=data2.2, method = "svmLinear", 
                        trControl = ctrl)
model.svm.l2.2$results
test.svm.l2.2 <- predict(model.svm.l2.2, newdata = test2)
test.svm.l2.2  = as.numeric(test.svm.l2.2) + 3

result = rep(0, dim(test)[1])
result[t.num1] = test.svm.l2.1
result[t.num2] = test.svm.l2.2
submit = data.frame(
  result = result
)
write.table(submit, file = "multiclass_1015_svmlinear2.txt", row.names = F, col.names = F)

ctrl = trainControl(method = "repeatedcv", repeats = 10)
set.seed(434)
model.svm.r2.1 <- train(result2~., data=data2.1, method = "svmRadial", 
                        trControl = ctrl)
model.svm.r2.1$results
test.svm.r2.1 <- predict(model.svm.r2.1, newdata = test1)
test.svm.r2.1  = as.numeric(test.svm.r2.1)
model.svm.r2.2 <- train(result2~., data=data2.2, method = "svmRadial", 
                        trControl = ctrl)
model.svm.r2.2$results
test.svm.r2.2 <- predict(model.svm.r2.2, newdata = test2)
test.svm.r2.2  = as.numeric(test.svm.r2.2) + 3

result = rep(0, dim(test)[1])
result[t.num1] = test.svm.r2.1
result[t.num2] = test.svm.r2.2
submit = data.frame(
  result = result
)
write.table(submit, file = "multiclass_1015_svmradial2.txt", row.names = F, col.names = F)
