###################################################
#####                   LDA                   #####
###################################################

library(caret)
setwd("/home/rxxwang/biostat626")
load("midterm_data.RData")
ctrl = trainControl(method = "repeatedcv", repeats = 10)

set.seed(326)
model.lda1 = train(result1 ~ ., data = data1,
                   method = "lda", trControl = ctrl)
model.lda1$results
pred.lda1 = predict(model.lda1, test)
submit = data.frame(pred.lda1 = as.numeric(pred.lda1) - 1)
write.table(submit, file = "binary_1015_lda.txt",
            row.names = F, col.names = F)