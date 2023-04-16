###################################################
#####         SVM linear & SVM Radial         #####
###################################################

library(caret)
setwd("/home/rxxwang/biostat626")
load("midterm_data.RData")
ctrl = trainControl(method = "repeatedcv", repeats = 10)

# SVM linear
set.seed(323)
model.svm.l1 <- train(result1~., data=data1, method = "svmLinear", trControl = ctrl)
model.svm.l1$results
test.svm.l1 <- predict(model.svm.l1, newdata = test)
submit = data.frame(
  test.svm.l1 = as.numeric(test.svm.l1)-1
)
write.table(submit, file = "binary_1015_svmlinear.txt", 
            row.names = F, col.names = F)

# SVM radial
set.seed(324)
model.svm.r1 <- train(result1~., data=data1, method = "svmRadial", trControl = ctrl)
model.svm.r1$results
test.svm.r1 <- predict(model.svm.r1, newdata = test)
submit = data.frame(
  test.svm.r1 = as.numeric(test.svm.r1)-1
)
write.table(submit, file = "binary_1015_svmradial.txt", 
            row.names = F, col.names = F)