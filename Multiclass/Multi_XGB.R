####################################################
#####          Multiclass XG Boosting          #####
####################################################

setwd("/home/rxxwang/biostat626")
load("midterm_data.RData")
library(caret)
library(xgboost)

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
model.xgb2 <- train(result2 ~ . , data = data2, method = "xgbTree",
                    tuneGrid = tune_grid, trControl = ctrl, verbose = FALSE,
                    verbosity = 0)
model.xgb2$bestTune
model.xgb2$results
test.xgb2 <- predict(model.xgb2, newdata = test)
submit = data.frame(
  test.xgb2 = as.numeric(test.xgb2)
)
write.table(submit, file = "multiclass_1015_xgb.txt", row.names = F, col.names = F)
