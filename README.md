# GettingAndCleaningData
Final project for the Getting and Cleaning Data course from Johns Hopkins on Coursera
The goal of this project is to take data separated into test/train and labels data and combine them into one tidy dataframe using R.

## 1. Gathering of Data
The data for this project was obtained from accelerometers in the Samsung Galaxy S smartphone. The full description can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The data for the project is here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The data was loaded into dataframes in R using read_table(). The relevant data was the training/testing features(variables), the feature labels for making the column names more readable, the labels and their names for the activity being performed for each reading, and the subject id's.

## 2. Renaming Data
Using the feature labels to make the column names more descriptive, and the activity names to change the labels from numerical data to categorical data, the data were changed to make them more readable for a user.

## 3. Combining Data
The goal of the exercise is to combine all of the data into one dataframe to make it easier to use. First the subject id's were added to the data using cbind(), then the training/testing features and labels were combined using rbind() before finally putting it all together to make one dataframe with all of the features(inputs) and labels(outputs), once again using cbind().

## 4. Grouping and Calculating the Mean of Features
For the last step, the data were grouped by subject and activity. The mean was then calculated for each feature.
