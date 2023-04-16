#####################################################
#####          Multiclass XG Boosting2          #####
#####################################################

setwd("/home/rxxwang/biostat626")
load("midterm_data.RData")
library(caret)

ctrl = trainControl(method = "cv", repeats = 10)
tune_grid <- expand.grid(
  nrounds = seq(1:10)*50,
  eta = 0.3,
  max_depth = 1:10,
  gamma = 0,
  colsample_bytree = 1,
  min_child_weight = 1,
  subsample = 1
)
set.seed(323) 
model.xgb2.1 <- train(result2 ~ . , data = data2.1, method = "xgbTree",
                    tuneGrid = tune_grid, trControl = ctrl, verbose = FALSE,
                    verbosity = 0)
model.xgb2.1$bestTune
model.xgb2.1$results
test.xgb2.1 <- predict(model.xgb2.1, newdata = test1)
test.xgb2.1 = as.numeric(test.xgb2.1)
set.seed(324)
model.xgb2.2 <- train(result2 ~ . , data = data2.2, method = "xgbTree",
                    tuneGrid = tune_grid, trControl = ctrl, verbose = FALSE,
                    verbosity = 0)
model.xgb2.2$bestTune
model.xgb2.2$results
test.xgb2.2 <- predict(model.xgb2.2, newdata = test2)
test.xgb2.2 = as.numeric(test.xgb2.2)+3

result = rep(0, dim(test)[1])
result[t.num1] = test.xgb2.1
result[t.num2] = test.xgb2.2
submit = data.frame(
  result = result
)
write.table(submit, file = "multiclass_1015_xgb2.txt", row.names = F, col.names = F)
