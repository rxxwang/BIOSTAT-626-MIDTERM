#####################################################
#####      Multiclass SVM linear & Radial3      #####
#####################################################

setwd("/home/rxxwang/biostat626")
load("midterm_data2.RData")
library(caret)

ctrl = trainControl(method = "repeatedcv", repeats = 10)
set.seed(434)
model.svm.l3.1 <- train(result2~., data=data2.1, method = "svmLinear", 
                        trControl = ctrl, 
                        tuneGrid = expand.grid(C = seq(0.2, 2, length = 10)))
model.svm.l3.1$results
test.svm.l3.1 <- predict(model.svm.l3.1, newdata = test1)
test.svm.l3.1  = as.numeric(test.svm.l3.1)
model.svm.l3.2 <- train(result2~., data=data2.2, method = "svmLinear", 
                        trControl = ctrl, 
                        tuneGrid = expand.grid(C = seq(0.2, 2, length = 10)))
model.svm.l3.2$results
test.svm.l3.2 <- predict(model.svm.l3.2, newdata = test2)
test.svm.l3.2  = as.numeric(test.svm.l3.2) + 3

result = rep(0, dim(test)[1])
result[t.num1] = test.svm.l3.1
result[t.num2] = test.svm.l3.2
submit = data.frame(
  result = result
)
write.table(submit, file = "multiclass_1015_svmlinear3.txt", row.names = F, col.names = F)

ctrl = trainControl(method = "repeatedcv", repeats = 10)
set.seed(434)
model.svm.r3.1 <- train(result2~., data=data2.1, method = "svmRadial", 
                        trControl = ctrl, 
                        tuneGrid = expand.grid(C = seq(0.2, 2, length = 10),
                                               sigma = seq(0.001, 0.002, length = 3)))
model.svm.r3.1$results
test.svm.r3.1 <- predict(model.svm.r3.1, newdata = test1)
test.svm.r3.1  = as.numeric(test.svm.r3.1)
model.svm.r3.2 <- train(result2~., data=data2.2, method = "svmRadial", 
                        trControl = ctrl, 
                        tuneGrid = expand.grid(C = seq(0.2, 2, length = 10),
                                               sigma = seq(0.001, 0.002, length = 3)))
model.svm.r3.2$results
test.svm.r3.2 <- predict(model.svm.r3.2, newdata = test2)
test.svm.r3.2  = as.numeric(test.svm.r3.2) + 3

result = rep(0, dim(test)[1])
result[t.num1] = test.svm.r3.1
result[t.num2] = test.svm.r3.2
submit = data.frame(
  result = result
)
write.table(submit, file = "multiclass_1015_svmradial3.txt", row.names = F, col.names = F)
