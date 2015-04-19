# Getting and Cleaning Data : Course Project  
## README file  
Clarence Jun Khiang Tan  
April 2015  

In this project, I collect, work with, and clean a dataset as part of the _Getting and Cleaning 
Data_ course from Johns Hopkins University on Coursera.  

## Brief Data Description
I use the [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the [UCI Machine Learning Repository] (http://archive.ics.uci.edu/ml/index.html). The raw data in zip format can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Script
The main script `run_analysis.R` does the following to the raw data:  
- Downloads and loads the data into R
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in the preceding step , creates a second, independent tidy data set with the average of each variable for each activity and each subject and outputs the tidy data set to `tidy.txt`


## Steps to obtain tidy data set from raw data
1. Open R and set your working directory.
2. Save `run_analysis.R` into the working directory and source it. The tidy data set will be written into `tidy.txt`.  


More information about the study design and variables can be found in the `Codebook.md` file.