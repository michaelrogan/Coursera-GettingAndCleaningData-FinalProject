## Final Course Project for Coursera Getting & Cleaning Data
## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
## Step 1: Obtain the Data in order to be able to analyze
## Utilized programming as done in the “Downloading a file from the web” section
## of the “Downloading Files” lecture in Week 1

if(!file.exists("data")){dir.create("data")}
fileUrl <- “https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip”
library(RCurl)
download.file(fileUrl,destfile="./data/ProjectData.zip",method="curl")

## Step 2: Extract the Zipped Files
## Used Guidance from: https://stat.ethz.ch/R-manual/R-devel/library/utils/html/unzip.html

setwd(“data”)  ## moves to my new data directory
unzip(zipfile="ProjectData.zip", exdir=".") ## unzips all files

## Outside of Programming review files and being to understand contents for analysis to continue program
## The files reside in “UCI HAR Dataset” folder

## The files extracted and stored are:
## -----
## Main Folder/ 
## "activity_labels.txt"                         
## "features.txt"                                
## "features_info.txt"                           
## "features.txt"                                
## "README.txt”
## ----- 
## within folder “test/”    
## “subject_test.txt”                       
## “X_test.txt”                             
## “y_test.txt”
## -----
## ignored “test/Inertial Signals”                                            
## -----
## within folder “train/”
## “subject_train.txt"                     
## "X_train.txt"                           
## "y_train.txt"
## -----
## ignored subfolder “test/Inertial Signals”                                            

#per the unzipped README File the main data is:
## The dataset includes the following files:
##'features_info.txt': Shows information about the variables used on the feature vector.
##'features.txt': List of all features.
## 'activity_labels.txt': Links the class labels with their activity name.
## 'train/X_train.txt': Training set.
## 'train/y_train.txt': Training labels.
## 'test/X_test.txt': Test set.
## 'test/y_test.txt': Test labels
##The following files are available for the train and test data. Their descriptions are equivalent. 
##- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its ##range is from 1 to 30. 
##- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in ## standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the ##'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
##- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
##- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Step 3: Put the Data into Tables
setwd("UCI HAR Dataset")
dataFeatures <- read.table("./features.txt")
dataActivities <- read.table("./activity_labels.txt")
dataLabelsTest  <- read.table("./test/y_test.txt")
dataLabelsTrain <- read.table("./train/y_train.txt")
dataTestSet <- read.table("./test/X_test.txt")
dataTrainSet <- read.table("./train/X_train.txt")
dataSubjectTest <- read.table("./test/subject_test.txt")
dataSubjectTrain <- read.table("./train/subject_train.txt")

##-----
## Outside of program for Project purposes, do analysis of each table to further 
##understand contents

##-----
##  Step 4: Merge Mutual Data.  As similar sets, can bind by rows
## Using this time to add descriptive Activity names as well

dataLabelsAll <- rbind(dataLabelsTest, dataLabelsTrain)
dataLabelsAll <- merge(dataLabelsAll, dataActivities, by.x = "V1", by.y = "V1") ## to associate the appropriate activitie name
colnames(dataLabelsAll) <- c("V1","Activities") ## assign column names for selection
library(dplr)
dataLabelsAll <- select(dataLabelsAll, Activities) ##isolates the Activities Column


dataSetsAll<- rbind(dataTestSet, dataTrainSet)
dataSubjectAll<- rbind(dataSubjectTest, dataSubjectTrain)

##-----
## Step 5: Assign variable names for clarity when merging to combine total set
names(dataSubjectAll) <- c("Subject")
dataSetsNames <- read.table("features.txt")
names(dataSetsAll) <- dataSetsNames$V2

## Step 6: Combine all data

CombinedDataAll <- cbind(dataSetsAll, dataSubjectAll, dataLabelsAll)

## Step 7: Find only data with “mean” or “std” contained within it
IsolateMeanStd <-dataSetsNames$V2[grep("mean|std", dataSetsNames$V2)] ##Finds the Column Names listed in the original features file that only contain “mean” or “std”

IsolateMeanStd <- as.character(IsolateMeanStd)
Activities <- CombinedDataAll$Activities
Subjects <- CombinedDataAll$Subject
MeansAndDevs <- CombinedDataAll[,IsolateMeanStd]
SubsettedData <- cbind(MeansAndDevs, Subjects, Activities)

##Step 8: Change labels to have descriptive variable names
names(SubsettedData)<-gsub("^t", "time", names(SubsettedData))
names(SubsettedData)<-gsub("Gyro", "Gyroscope", names(SubsettedData))
names(SubsettedData)<-gsub("^f", "frequency", names(SubsettedData))
names(SubsettedData)<-gsub("Acc", "Accelerometer", names(SubsettedData))
names(SubsettedData)<-gsub("Mag", "Magnitude", names(SubsettedData))
names(SubsettedData)<-gsub("BodyBody", "Body", names(SubsettedData))
names(SubsettedData)<-gsub("mean()", "mean", names(SubsettedData))
names(SubsettedData)<-gsub("std()", "StandardDeviation", names(SubsettedData))
names(SubsettedData)<-gsub("meanFreq()", "mean", names(SubsettedData))

## Step 9: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr)
TidyData <- aggregate(. ~Subjects + Activities, SubsettedData, mean)
TidyData <-TidyData[order(TidyData$Subjects,TidyData$Activities),]
write.table(TidyData, file = "TidyData.txt")
