rm(list=ls())

#############################################################################
## 0) Download, Load data into R
#############################################################################
if(!file.exists("data.zip")){
        Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(Url, destfile = "data.zip", method = "curl")
        unzip("data.zip")
}


feature <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors=FALSE,header=FALSE)
activity <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE,header=FALSE)

train <- read.table("UCI HAR Dataset/train/X_train.txt",stringsAsFactors=FALSE,header=FALSE)
train[,562] <- read.table("UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=FALSE,header=FALSE) 
train[,563] <- read.table("UCI HAR Dataset/train/y_train.txt",stringsAsFactors=FALSE,header=FALSE)


test <- read.table("UCI HAR Dataset/test/X_test.txt",stringsAsFactors=FALSE,header=FALSE)
test[,562] <- read.table("UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=FALSE,header=FALSE)
test[,563] <- read.table("UCI HAR Dataset/test/y_test.txt",stringsAsFactors=FALSE,header=FALSE)

#############################################################################
## 1) Merge training and testing datasets, add names.
#############################################################################

comb <-rbind(train, test)
names(comb) <- c(feature[,2],"subject","activity")

#############################################################################
## 2) select mean, standard deviation, subject, activity, type columns
#############################################################################

cols <- c(grep("(mean|std)\\(\\)",names(comb),ignore.case = TRUE),562:563)
combmsd<- comb[,cols]

#############################################################################
## 3) Use descriptive activity names to name the activities in the data set
#############################################################################

## convert activity vector in combmsd data frame to factor, add activity labels
combmsd$activity <- factor(combmsd$activity, label = activity[,2])

#############################################################################
## 4) Label the data set with descriptive variable names
#############################################################################
names(combmsd) <- tolower(names(combmsd))
names(combmsd) <- gsub("\\-|\\(|\\)","", names(combmsd))
names(combmsd) <- gsub("^t","time", names(combmsd))
names(combmsd) <- gsub("^f","frequencydomain", names(combmsd))
names(combmsd) <- gsub("std","standarddeviation", names(combmsd))
names(combmsd) <- gsub("acc","accelerometer", names(combmsd))
names(combmsd) <- gsub("gyro","gyroscope", names(combmsd))
names(combmsd) <- gsub("mag","magnitude", names(combmsd))
names(combmsd) <- gsub("x$","xaxis", names(combmsd))
names(combmsd) <- gsub("y$","yaxis", names(combmsd))
names(combmsd) <- gsub("z$","zaxis", names(combmsd))
names(combmsd) <- gsub("activityaxis","activity", names(combmsd))

#############################################################################
## 5) Create a second, independent tidy data set with the average of each 
##    variable for each activity and each subject
#############################################################################

tidy <- aggregate(combmsd[,1:66], 
                  list(subject = combmsd$subject, activity = combmsd$activity), 
                  mean)
names(tidy)[3:68] <- paste("average", names(tidy)[3:68], sep="")

write.table(tidy, file = "tidy.txt", row.name = FALSE)
