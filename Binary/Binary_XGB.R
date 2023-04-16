##################################################
#####               XG Boosting              #####
##################################################

setwd("/home/rxxwang/biostat626")
load("midterm_data.RData")
library(caret)
library(xgboost)


ctrl = trainControl(method = "repeatedcv", repeats = 10)
tune_grid <- expand.grid(
  nrounds = seq(1:10)*50,
  eta = 0.3,
  max_depth = 1:10,
  gamma = 0,
  colsample_bytree = 1,
  min_child_weight = 1,
  subsample = 1
)
set.seed(329) 
model.xgb1 <- train(result1 ~ . , data = data1, method = "xgbTree",
                    tuneGrid = tune_grid, trControl = ctrl, verbose = FALSE,
                    verbosity = 0)
model.xgb1$results
pred.xgb1 <- predict(model.xgb1, newdata = test)
submit = data.frame(pred.xgb1 = as.numeric(pred.xgb1) - 1)
write.table(submit, file = "binary_1015_xgb.txt",
            row.names = F, col.names = F)
