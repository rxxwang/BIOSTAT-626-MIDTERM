setwd("/Users/ruixuanwang/Documents/UMich/626/Midterm/Binary")

binary_lda = read.table("binary_1015_lda.txt")
binary_svmradial = read.table("binary_1015_svmradial.txt")
binary_svmlinear = read.table("binary_1015_svmlinear.txt")
binary_xgb = read.table("binary_1015_xgb.txt")
binary_rf = read.table("binary_1015_rf.txt")
binary_logistic = read.table("binary_1015_logistic.txt")

all.equal(binary_lda$V1, binary_logistic$V1)
all.equal(binary_lda$V1, binary_rf$V1)
all.equal(binary_lda$V1, binary_svmradial$V1)
all.equal(binary_lda$V1, binary_svmlinear$V1)
all.equal(binary_lda$V1, binary_xgb$V1)
