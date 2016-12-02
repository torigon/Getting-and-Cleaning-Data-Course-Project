# Reads the "Human Activity Recognition Using Smartphones Dataset" and
# writes a tidy data set file with the average of each variable for each
# activity and each subject.

cat("Wait a moment...\n")
flush.console()

library(dplyr)
library(reshape2)

# # downloads data for the project in case you have not downloaded yet
# zipFileName <- "UCI_HAR_Dataset.zip"
# 
# if (!file.exists(zipFileName)) {
#     download.file(
#         "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
#         destfile=zipFileName)
# }
# 
# unzip(zipFileName)

##**************************************************************************
## 1. Merges the training and the test sets to create one data set.
##**************************************************************************
# creates file paths
path <- "UCI HAR Dataset"
featureFile <- paste(path, "features.txt", sep="/")
activityLblFile <- paste(path, "activity_labels.txt", sep="/")
subjectTrainFile <- paste(path, "train/subject_train.txt", sep="/")
xTrainFile <- paste(path, "train/X_train.txt", sep="/")
yTrainFile <- paste(path, "train/y_train.txt", sep="/")
subjectTestFile <- paste(path, "test/subject_test.txt", sep="/")
xTestFile <- paste(path, "test/X_test.txt", sep="/")
yTestFile <- paste(path, "test/y_test.txt", sep="/")

# reads files with 'white space' separators
features <- read.table(featureFile, sep="", header=FALSE, 
                       stringsAsFactors=FALSE)
activityLabels <- read.table(activityLblFile, sep="", header=FALSE,
                             stringsAsFactors=FALSE)
subjectTrainData <- read.table(subjectTrainFile, sep="", header=FALSE)
xTrainData <- read.table(xTrainFile, sep="", header=FALSE)
yTrainData <- read.table(yTrainFile, sep="", header=FALSE)
subjectTestData <- read.table(subjectTestFile, sep="", header=FALSE)
xTestData <- read.table(xTestFile, sep="", header=FALSE)
yTestData <- read.table(yTestFile, sep="", header=FALSE)

# combines data sets
trainData <- cbind(subjectTrainData, xTrainData, yTrainData)
testData <- cbind(subjectTestData, xTestData, yTestData)
harData <- rbind(trainData, testData)

##**************************************************************************
## 2. Extracts only the measurements on the mean and standard deviation
## for each measurement.
##**************************************************************************
# extracts only the measurements on the mean and standard deviation
xCols <- grepl("mean\\(\\)", features$V2) |  grepl("std\\(\\)", features$V2)
targetCols <- c(TRUE, xCols, TRUE)
targetData <- harData[, targetCols]

# provides column names
targetColNames <- c("Subject", features$V2[xCols], "Activity")
colnames(targetData) <- targetColNames

##**************************************************************************
## 3. Uses descriptive activity names to name the activities in the data set
##**************************************************************************
targetData$Activity <- factor(targetData$Activity, labels=activityLabels$V2)

##**************************************************************************
## 4. Appropriately labels the data set with descriptive variable names.
##**************************************************************************
# obtains column names
targetNames <- colnames(targetData)

# replaces column names
targetNames <- sub("mean\\(\\)", "Mean", targetNames)
targetNames <- sub("std\\(\\)", "StandardDeviation", targetNames)
targetNames <- sub("^t", "Time-", targetNames)
targetNames <- sub("^f", "Frequency-", targetNames)

# resets column names
colnames(targetData) <- targetNames

##**************************************************************************
## 5. From the data set in step 4, creates a second, independent tidy data
## set with the average of each variable for each activity and each subject.
##**************************************************************************
# obtains the average of each variable for each activity and each subject
melted <- melt(targetData, id.vars=c("Activity", "Subject"))
grouped <- group_by(melted, Activity, Subject, variable)
# if you prefer a narrow format
# narrowData <- summarise(grouped, Mean=mean(value))
wideData <- dcast(grouped, Activity + Subject ~ variable, mean)

# writes a tidy data file
write.table(wideData, file="./HAR_result.txt", row.name=FALSE) 
