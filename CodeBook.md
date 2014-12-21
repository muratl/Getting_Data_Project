# CodeBook for the tidy data

The goal is to prepare tidy data that can be used for later analysis.
The analyzed data represent data collected from the accelerometers from the Samsung Galaxy S smartphone.


## General features

A tidy dataset will be generated using a script run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Dataset description

* xTrain, yTrain, xTest, yTest, subjectTrain, subjectTest: 	contains data from the downloaded files.
* xData, yData, subjectData: merged data from train and test datasets.
* features: contains the desired column names for the xData dataset. Only column names with mean (mean) and std (standard deviation) are kept and used to subset Xdata.
* activities: contains the desired column names for the yData dataset
* allData: contains merged datasets xData, yData, subjectData.
* averageData: contains tthe average of each variable for each activity and each subject, using ddply() from the plyr package to apply colMeans(). This dataset is used to genrate the 