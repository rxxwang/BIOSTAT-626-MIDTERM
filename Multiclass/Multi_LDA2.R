######################################################
#####               Multiclass LDA               #####
######################################################

setwd("/home/rxxwang/biostat626")
load("midterm_data2.RData")
library(caret)

ctrl = trainControl(method = "repeatedcv", repeats = 10)
set.seed(434)
model.lda2.1 <- train(result2~., data=data2.1, method = "lda", 
                        trControl = ctrl)
model.lda2.1$results
test.lda2.1 <- predict(model.lda2.1, newdata = test1)
test.lda2.1  = as.numeric(test.lda2.1)
model.lda2.2 <- train(result2~., data=data2.2, method = "lda", 
                        trControl = ctrl)
model.lda2.2$results
test.lda2.2 <- predict(model.lda2.2, newdata = test2)
test.lda2.2  = as.numeric(test.lda2.2) + 3

result = rep(0, dim(test)[1])
result[t.num1] = test.lda2.1
result[t.num2] = test.lda2.2
submit = data.frame(
  result = result
)
write.table(submit, file = "multiclass_1015_lda2.txt", row.names = F, col.names = F)

