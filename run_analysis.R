library(plyr)

###################################################################
# 1. Merges the trainData and the test sets to create one data set.
###################################################################

# Read train data
xTrain <- read.table("UCI HAR Dataset/train/x_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read test data
xTest <- read.table("UCI HAR Dataset/test/x_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge data
xData <- rbind(xTrain, xTest)
yData <- rbind(yTrain, yTest)
subjectData <- rbind(subjectTrain, subjectTest)

# Note: all data will be merged after to make easier to extract required data and apply labels on each part

############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
############################################################################################

features <- read.table("UCI HAR Dataset/features.txt")

# Reformat col names
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Get cols id containing Mean and Std
featuresMeanStd <- grep(".*Mean.*|.*Std.*", features[, 2])

# subset the desired columns
xData <- xData[, featuresMeanStd]

# Reformat col names
names(xData) <- features[featuresMeanStd, 2]


###########################################################################
# 3. Uses descriptive activity names to name the activities in the data set
###########################################################################

# Read active labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Update yData with activity labels
yData[, 1] <- activityLabels[yData[, 1], 2]

# Add activity column name
names(yData) <- "activity"


#######################################################################
# 4. Appropriately labels the data set with descriptive variable names. 
#######################################################################

# correct column name
names(subjectData) <- "subject"

# bind all the data in a single data set
allData <- cbind(xData, yData, subjectData)


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Activity and subject
averageData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averageData, "tidyData.txt", row.name=FALSE)