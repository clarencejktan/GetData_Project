# Getting and Cleaning Data : Course Project  
## README file  
Clarence Jun Khiang Tan  
April 2015  

In this project, I collect, work with, and clean a dataset as part of the _Getting and Cleaning 
Data_ course from Johns Hopkins University on Coursera.  

## Brief Data Description
I use the [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the [UCI Machine Learning Repository] (http://archive.ics.uci.edu/ml/index.html). 

_Most of the material describing the raw data is extracted from the Data Set website cited above, and the accompanying files in the zip archive. This information is reproduced both in the Readme file, and the Codebook. I acknowledge these sources and the study authors Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz._

The raw data in zip format can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

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


## Coursera Submission: Reading the tidy dataset into R
The tidy dataset output for this project can be found [here](https://s3.amazonaws.com/coursera-uploads/user-e97c02c967c6363744d99f64/973500/asst-3/ab4dbba0e68311e49fdea3d2b50763ef.txt). To read this text file into R and verify that it is indeed tidy, run the following code in R:
```r
address <- "https://s3.amazonaws.com/coursera-uploads/user-e97c02c967c6363744d99f64/973500/asst-3/ab4dbba0e68311e49fdea3d2b50763ef.txt"
address <- sub("^https", "http", address)
data <- read.table(url(address), header = TRUE)
View(data)
```