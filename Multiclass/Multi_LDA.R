####################################################
#####              Multiclass LDA              #####
####################################################

setwd("/home/rxxwang/biostat626")
load("midterm_data.RData")
library(caret)

ctrl = trainControl(method = "repeatedcv", repeats = 10)
set.seed(434)
model.lda2 <- train(result2~., data=data2, method = "lda", trControl = ctrl)
model.lda2$results
test.lda2 <- predict(model.lda2, newdata = test)
submit = data.frame(
  test.lda2 = as.numeric(test.lda2)
)
write.table(submit, file = "multiclass_1015_lda.txt", row.names = F, col.names = F)
