########################################################
#####       Read file and data preprocessing       #####
########################################################

setwd("/Users/ruixuanwang/Documents/UMich/626/Midterm/")

data = read.table("training_data.txt", header = T)
test = read.table("test_data.txt", header = T)
data$result1 = ifelse(data$activity >= 4, 0, 1)
data$result2 = ifelse(data$activity >= 7, 7, data$activity)
test = test[,-1]

data1 = data[,c(-1,-2,-565)]
data2 = data[,c(-1,-2,-564)]

data2.1 = data2[which(data2$result2 <= 3),]
data2.1$result2 = factor(data2.1$result2)
data2.2 = data2[which(data2$result2 >= 4),]
data2.2$result2 = factor(data2.2$result2)

data1$result1 = factor(data1$result1)
data2$result2 = factor(data2$result2)

save(data1, data2, data2.1, data2.2, test, file = "midterm_data.RData")