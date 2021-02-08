# Installing/loading packages necessary for cleaning the data
install.packages("plyr")
install.packages("dplyr")
library(plyr)
library(dplyr)

# Gathering data from text files in the working directory
## Testing and training data for each sample
xtest <- read.table("X_test.txt")
xtrain <- read.table("X_train.txt")

## Testing and training labels for each sample (Activities 1-6 as described in the code book)
ytest <- read.table("y_test.txt")
ytrain <- read.table("y_train.txt")

## Subject id's for the 30 different subjects in the study
trainsubject <- read.table("subject_train.txt")
testsubject <- read.table("subject_test.txt")

# Setting column names to variable names that are readable and make sense
## Variable and activity names for the testing/training data
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

## Changing column names to the variable names in the features file
names(xtest) <- features[["V2"]]
names(xtrain) <- features[["V2"]]

## Changing column names for the subject id and activity columns
names(trainsubject) <- "subjectid"
names(testsubject) <- "subjectid"
names(ytrain) <- "activity"
names(ytest) <- "activity"

## Changing activity values from numbers to readable activity names
ytrain$activity <- mapvalues(ytrain$activity, from=activities$V1, to=activities$V2)
ytest$activity <- mapvalues(ytest$activity, from=activities$V1, to=activities$V2)

# Combining data into one dataframe
## Binding the subject id's to the training and test data
trainsubjectdata <- cbind(trainsubject, xtrain)
testsubjectdata <- cbind(testsubject, xtest)

## Binding variables data into one data frame and the label data into a second data frame
combinedx <- rbind(trainsubjectdata, testsubjectdata)
combinedy <- rbind(ytrain, ytest)

## Selecting only the columns that deal with the mean and standard deviations of each variable
limit <- grepl("mean\\(|std|subjectid", colnames(combinedx))
simplifiedx <- combinedx[limit]

## Combining variables data and labels data into one data frame
phonedata <- cbind(simplifiedx, combinedy)

# Grouping and then finding the mean of each variable
## First the data is grouped by subject id and activity. Then the mean is found of each variable by those groups.
## This will be the final, tidy data set.
phonedata <- phonedata %>% group_by(subjectid, activity) %>% summarise_all("mean")
