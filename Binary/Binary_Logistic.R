###################################################
#####           Logistic Regression           #####
###################################################

library(caret)
setwd("/home/rxxwang/biostat626")
load("midterm_data.RData")
ctrl = trainControl(method = "repeatedcv", repeats = 10)

set.seed(325)
model.log1 <- train(result1 ~ ., data = data1,
                    method = "glm", trControl = ctrl)
model.log1$results
test.log1 <- predict(model.log1, newdata = test)
submit = data.frame(test.log1 = as.numeric(test.log1) - 1)
write.table(submit, file = "binary_1015_logistic.txt", 
            row.names = F, col.names = F)