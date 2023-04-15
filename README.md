# BIOSTAT-626-MIDTERM

## Task 1 - binary classification

1. Data processing

```Data_processing.R``` gives the preprocessing of the data, classifying the activity of each time window into binary outcome ```result1``` (static (0) and dynamic (1)) and multiclass outcome ```result2``` (walking (1), walking_upstairs (2), walking_downstairs (3), sitting (4), standing (5), lying (6), and static postural transition (7)), and save the data into ```midterm_data.RData```.

2. Train model and predict

Logistic regression, support vector machine (SVM), kernel methods(KNN), extreme gradient boosting(xgboost), random forest(RF), linear discriminant analysis(LDA) are used to train models. The predicting result of each machine learning method is saved in text files such as ```binary_1015_SVMLienar.txt```. The output (accuracy of model) of each machine learning method is saved in Rout file such as ```Binary_SVM.Rout```, which is the output file of cluster. For each model, I use ```set.seed()``` to make sure the result is reproducible.

3. Compare results from different model

```Compare_reuslt.R``` compares the output txt file in (2). 

## Task 2 - multiclass classification

1. Data processing

By leaderboard, we know that the binary classification result has 100% accuracy. So ```Separate_test_data.R``` use the result from task1, and build 2 models to classify 0 in ```result1``` into 4,5,6,7 in ```result2``` and classify 1 in ```result1``` into 1,2,3 in ```result2```, and save the data into ```midterm_data2.RData```.

2. Train model and predict

Support vector machine (SVM), extreme gradient boosting(xgboost), random forest(RF), linear discriminant analysis(LDA) are used to train models.

```Multi_SVM.R```, ```Multi_XGB.R```, ```Multi_RF.R``` use one model to predict the multiclass data. ```Multi_SVM2.R```, ```Multi_XGB2.R```, ```Multi_LDA2.R``` use 2 models to predict the multiclass data, which is explain the (1). ```Multi_SVM3.R``` is the improvement of SVM methods based on ```Multi_SVM2.R``` by tuning grid. 

The predicting result of each machine learning method is saved in text files such as ```multi_1015_SVMLienar.txt```. The output (accuracy of model) of each machine learning method is saved in Rout file such as ```Multi_SVM.Rout```, which is the output file of cluster. For each model, I use ```set.seed()``` to make sure the result is reproducible.
