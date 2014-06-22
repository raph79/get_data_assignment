## Assumption: Data downloaded and unzipped and you are in the main folder of the data.

## url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## local_name <- "HAR.zip"
## download.file(url=url,dest=local_name)
## unzip(local_name)
## current_wd <- getwd()
## wd <- file.path(current_wd,"UCI HAR Dataset")

## Task 1:  Merge the training and the test sets to create one data set.

## Preparations: Get paths of the working directories

wd <- getwd()

wd_train <- file.path(wd,"train")
wd_test  <- file.path(wd, "test")

## Read in variable names

setwd(wd)

features <- read.table("features.txt")

## Read, label and concatenate train data

setwd(wd_train)

X_train <- read.table("X_train.txt")
colnames(X_train) <- features$V2

y_train <- read.table("y_train.txt")
colnames(y_train) <- "activity_id"

subject_train <- read.table("subject_train.txt")
colnames(subject_train) <- "person"

train <- cbind(X_train, y_train, subject_train)

## Read and concatenate test data

setwd(wd_test)

X_test <- read.table("X_test.txt")
colnames(X_test) <- features$V2

y_test <- read.table("y_test.txt")
colnames(y_test) <- "activity_id"

subject_test <- read.table("subject_test.txt")
colnames(subject_test) <- "person"

test <- cbind(X_test, y_test, subject_test)

## Append train and test

traintest <- rbind(train, test)

## Task 2: Extract only the measurements on the mean and standard deviation for each measurement.


## Label which variables match "-mean", "-std" and "-meanFreq"

features$means <- grepl("-mean", features$V2)
features$std <- grepl("-std", features$V2)
features$meanFreq <- grepl("-meanFreq", features$V2)

## List of needed variables: Either contain "-mean" or "-std" but not "-meanFreq"

columnset <- subset(features, (features$means==TRUE | features$std==TRUE) & features$meanFreq==FALSE)

## From dataset from #1 just extract the variables defined above plus the last two columns

traintest2 <- traintest[,c(columnset$V1, 562:563)]


## Task 3: 3  Use descriptive activity names to name the activities in the data set

## Read labels

setwd(wd)
activity_labels <- read.table("activity_labels.txt")
colnames(activity_labels) <- c("activity_id", "activity")

## Merge labels with activity codes

traintest3 <- merge(traintest2, activity_labels, by.x="activity_id", by.y="activity_id", all=TRUE)

## Drop leading column with activity codes

traintest4 <- traintest3[,c(2:69)]


## Task 4: Appropriately label the data set with descriptive variable names.

## Remove brackets in variable names
names(traintest4) <- gsub("\\(\\)", "", names(traintest4))

## Remove hyphens by dots in variable names
names(traintest4) <- gsub("-", ".", names(traintest4))


## Task 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Change order of coulums to have activity and person at the beginning

traintest5 <- traintest4[,c(68,67,1:66)]

## Get the means of all measure variables by activity and subject (here called person) using aggregate function
tidyData <- aggregate(traintest5[,3:68], by=list(traintest5$activity, traintest5$person), FUN=mean)

## Replace group names by original variable names
names(tidyData) <- gsub("Group.1", "activity", names(tidyData))
names(tidyData) <- gsub("Group.2", "person", names(tidyData))

## Write data into txt file
write.table(tidyData, file = "tidy.txt", append = FALSE,row.names=F,col.names=T, quote=F,sep="\t")