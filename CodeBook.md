### Data Set
The data set for this project is the **Human Activity Recognition Using Smartphones Dataset**, which can be obtained from the website
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .

Among the data set, this project uses the following files as input:

* train/subject_train.txt : List of subjects who performed the activity in Training set.
* train/X_train.txt : Training set.
* train/y_train.txt : Training labels.
* test/subject_test.txt : List of subjects who performed the activity in Test set.
* test/X_test.txt : Test set.
* test/y_test.txt : Test labels.
* features.txt  : List of all features.
* activity_labels.txt : Links the class labels with their activity name.

### Variables
Although there are 561 time and frequency domain feature variables in the data set, this project uses only 66 features of the following 17 types:

1. tBodyAcc-[mean() or std()]-[X, Y or Z] : body acceleration signals
2. tGravityAcc-[mean() or std()]-[X, Y or Z] : gravity acceleration signals
3. tBodyAccJerk-[mean() or std()]-[X, Y or Z] : body acceleration Jerk signals
4. tBodyGyro-[mean() or std()]-[X, Y or Z] : body gyroscope signals
5. tBodyGyroJerk-[mean() or std()]-[X, Y or Z] : body gyroscope Jerk signals
6. tBodyAccMag-[mean() or std()] : the magnitude of body acceleration signals
7. tGravityAccMag-[mean() or std()] : the magnitude of body acceleration signals
8. tBodyAccJerkMag-[mean() or std()] : the magnitude of body acceleration Jerk signals
9. tBodyGyroMag-[mean() or std()] : the magnitude of body gyroscope signals
10. tBodyGyroJerkMag-[mean() or std()] : the magnitude of body gyroscope Jerk signals
11. fBodyAcc-[mean() or std()]-[X, Y or Z] : body acceleration signals
12. fBodyAccJerk-[mean() or std()]-[X, Y or Z] : body acceleration Jerk signals
13. fBodyGyro-[mean() or std()]-[X, Y or Z] : body gyroscope signals
14. fBodyAccMag-[mean() or std()] : the magnitude of body acceleration signals
15. fBodyAccJerkMag-[mean() or std()] : the magnitude of body acceleration signals
16. fBodyGyroMag-[mean() or std()] : the magnitude of body gyroscope signals
17. fBodyGyroJerkMag-[mean() or std()] : the magnitude of body gyroscope Jerk signals

where

* t : the time domain signals (unit: sec)
* f : the frequency domain signals when a Fast Fourier Transform (FFT) was applied (unit: Hz)
* mean(): Mean value
* std(): Standard deviation
* X, Y or Z : 3-axial signals

See the following files in the data set for more details:

* features_info.txt
* features.txt
* activity_labels.txt

### Transformations/work
The R script `run_analysis.R` creates a independent tidy data set with the average of each variable for each activity and each subject. See the **Introduction** section of `README.md` of this project for more details.
