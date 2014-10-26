# read all data into R objects

library(reshape2)
library(data.table)

#features.txt
features <- read.table("./UCI HAR Dataset/features.txt")

#activity_labels.txt

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#subject_train.txt

train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#X_train.txt; #Y_train.txt

train_xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")

#body_acc_x_train.txt; body_acc_y_train.txt; body_acc_z_train.txt

train_body_acc_x <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
train_body_acc_y <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
train_body_acc_z <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")

#body_gyro_x_train.txt; body_gyro_y_train.txt; body_gyro_z_train.txt

train_gyro_acc_x <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
train_gyro_acc_y <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
train_gyro_acc_z <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")

#total_acc_x_train.txt; total_acc_y_train.txt; total_acc_z_train.txt

train_total_acc_x <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
train_total_acc_y <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
train_total_acc_z <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

#subject_test.txt

test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#X_test.txt; Y_test.txt

test_xtrain <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_ytrain <- read.table("./UCI HAR Dataset/test/Y_test.txt")

#body_acc_x_test.txt; body_acc_y_test.txt; body_acc_z_test.txt

test_body_acc_x <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
test_body_acc_y <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
test_body_acc_z <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")

#body_gyro_x_train.txt; body_gyro_y_train.txt; body_gyro_z_train.txt

test_gyro_acc_x <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
test_gyro_acc_y <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
test_gyro_acc_z <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")

#total_acc_x_train.txt; total_acc_y_train.txt; total_acc_z_train.txt

test_total_acc_x <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
test_total_acc_y <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
test_total_acc_z <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

#combining data sets train

train_subjectData <- cbind(train_subject, train_ytrain, train_xtrain, train_body_acc_x, train_body_acc_y, train_body_acc_z, train_gyro_acc_x, train_gyro_acc_y, train_gyro_acc_z, train_total_acc_x, train_total_acc_y, train_total_acc_z)

#combining data sets test
test_subjectData <- cbind(test_subject, test_ytrain, test_xtrain, test_body_acc_x, test_body_acc_y, test_body_acc_z, test_gyro_acc_x, test_gyro_acc_y, test_gyro_acc_z, test_total_acc_x, test_total_acc_y, test_total_acc_z)

combine train and test data

dataWithoutLable <- rbind(train_subjectData, test_subjectData)



> setnames(dataWithoutLable, dataWithoutLable[1,1], "subject")
> setnames(dataWithoutLable, dataWithoutLable[1,2], "Activity")

write.table(dataWithoutLable, "tidyData.txt")