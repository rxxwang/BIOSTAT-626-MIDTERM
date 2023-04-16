##################################################
#####              Random Forest             #####
##################################################

setwd("/home/rxxwang/biostat626")
load("midterm_data.RData")
library(caret)

ctrl = trainControl(method = "repeatedcv", repeats = 10)
sqtmtry<- round(sqrt(ncol(data1) - 1))
rfGrid <- expand.grid(mtry = c(round(sqtmtry / 2), sqtmtry, 2 * sqtmtry))
set.seed(330)
model.rf1 <- train(result1 ~ . , data = data1, method = "rf", 
                   ntree = 500, tuneGrid = rfGrid, trControl = ctrl, 
                   importance = TRUE)
model.rf1$results
save(model.rf1, file = "model.rf1.RData")
pred.rf1 <- predict(model.rf1, newdata = test)
submit = data.frame(pred.rf1 = as.numeric(pred.rf1) - 1)
write.table(submit, file = "binary_1015_rf.txt",
            row.names = F, col.names = F)
