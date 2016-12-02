### Introduction
This repository is for my **Getting and Cleaning Data** Course Project.

It contains:

* README.md       : A readme file.
* CodeBook.md     : A code book file.
* run_analysis.R  : An R script file.

The R script does the followings:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Usage
First, download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Second, place the `run_analysis.R` file and an unzipped data folder in your working directory. Finally, open an R console and input

```
source("run_analysis.R")
```

The resulting output file will be placed in your working directory with the file name `HAR_result.txt`.

### Requirement
To run the R script, you must install the software R: https://www.r-project.org/ .

The following R packages are also required to install to run the `run_analysis.R` script:

* dplyr
* reshape2
