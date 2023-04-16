######################################################
#####          Multiclass Random Forest          #####
######################################################

setwd("/home/rxxwang/biostat626")
load("midterm_data.RData")
library(caret)

ctrl = trainControl(method = "repeatedcv", repeats = 10)
sqtmtry<- round(sqrt(ncol(data2) - 1))
rfGrid <- expand.grid(mtry = c(round(sqtmtry / 2), sqtmtry, 2 * sqtmtry))
set.seed(434)
model.rf2 <- train(result2 ~ . , data = data2, method = "rf", ntree = 500, 
                   tuneGrid = rfGrid, trControl = ctrl, importance = TRUE)
model.rf2$results
save(model.rf2, file = "model.rf2.RData")
pred.rf2 <- predict(model.rf2, newdata = test)
submit = data.frame(
  pred.rf2 = as.numeric(pred.rf2)
)
write.table(submit, file = "multiclass_1015_rf.txt", row.names = F, col.names = F)
