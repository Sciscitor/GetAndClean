###############################################################################
###############################################################################
##
##              Course Project for Getting & Cleaning Data
##              R Script
##
###############################################################################
###############################################################################

##
## Upload the dplyr library since we'll need this
## 

library(dplyr)

##
## Download the file with the data and unzip it
##

if(!file.exists("./get_data")){dir.create("./get_data")}
data_file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(data_file, "./get_data/activity.zip", mode="wb")
unzip("./get_data/activity.zip", exdir="./get_data")

##
## Now we uploda all the datasets we're going to need.  These include test data
## train data and the descriptive data sets for the columns and activities
##

##  Load all the test data into X_test, Y_test, subject_test
X_test <- read.table("./get_data/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./get_data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./get_data/UCI HAR Dataset/test/subject_test.txt")

##  Load all the train data into X_train, Y_train, subject_train
X_train <- read.table("./get_data/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./get_data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./get_data/UCI HAR Dataset/train/subject_train.txt")

##  Load the features and activity_labels
features <- read.table("./get_data/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./get_data/UCI HAR Dataset/activity_labels.txt")

##
## Next we look at assembling our pieces of data into a single set, with 
## good labelling.  
##

## We append the features list as column names, to ensure that our varibles
## are correctly named
colnames(X_test) <- features[,2]
colnames(X_train) <- features[,2]

## Then correlate our subjects with the activities and variables associated
## with them, before binding the test and train data
All_test <- cbind(subject_test,Y_test,X_test)
All_train <- cbind(subject_train,Y_train,X_train)
All_sam <- rbind(All_test,All_train)

## We also name the two first columns, containing the subjects and activities
names(All_sam)[2] <- "Activity_Label"
names(All_sam)[1] <- "Subject"

## Finally, we merge the activity labels into the data set 
All_sam <- merge(All_sam, activity_labels, by.x = 'Activity_Label', by.y = 'V1')
All_sam$Activity_Label <- All_sam$V2
All_sam$V2 <- NULL

##
## In this final section we discard the data we're not interested in and 
## produce a final, tidy data set
##

## We only keep columns that have "mean" or "std" within them - note that this 
## includes angles and mean frequencies which could be dropped if required
All_sam <- select(All_sam,contains("Subject"),contains("Activity_Label"),
                  contains("mean"),contains("std"))

## We then aggregate the data to keep only the average values for each 
## Subject / Activity pairing, then order the data and rename the columns to 
## reflect that these are now averages
Final_Data <- aggregate(All_sam[3:88],
                        by = All_sam[c("Subject","Activity_Label")],FUN=mean)
Final_Data <- arrange(Final_Data,Subject,Activity_Label)
names(Final_Data)[3:88] <- paste('Avg',colnames(Final_Data[3:88]))

## Finally, we write out our data to a file for submission
write.table(Final_Data,"./get_data/Final_Data.txt",row.name=FALSE)