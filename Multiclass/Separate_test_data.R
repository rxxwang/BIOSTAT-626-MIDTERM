setwd("/Users/ruixuanwang/Documents/UMich/626/Midterm")
load("midterm_data.RData")

result = read.table("Binary/binary_1015.txt")
t.num1 = which(result[,1] == 1)
t.num2 = which(result[,1] == 0)
test1 = test[t.num1,]
test2 = test[t.num2,]
save(test, test1, test2, data1, data2, data2.1, data2.2, t.num1, t.num2, 
     file = "midterm_data2.RData")
