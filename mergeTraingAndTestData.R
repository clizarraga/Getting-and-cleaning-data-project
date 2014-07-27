
# precondition: Data must be in the same directory as the script and must preserve the names and file structure provided in the .zip file
# reference: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# aditional columns => activities, subject and type (Test or training)

mergeTraingAndTestData <- function() 
{
    # Validations for the files to be used
    # Test Data
    if(!file.exists('./UCI HAR Dataset/test/X_test.txt'))         stop('File "./UCI HAR Dataset/test/X_test.txt" was not found')
    if(!file.exists('./UCI HAR Dataset/test/y_test.txt'))         stop('File "./UCI HAR Dataset/test/y_test.txt" was not found')
    if(!file.exists('./UCI HAR Dataset/test/subject_test.txt'))   stop('File "./UCI HAR Dataset/test/subject_test.txt" was not found')
    # Training Data
    if(!file.exists('./UCI HAR Dataset/train/X_train.txt'))         stop('File "./UCI HAR Dataset/train/X_train.txt" was not found')
    if(!file.exists('./UCI HAR Dataset/train/y_train.txt'))         stop('File "./UCI HAR Dataset/train/y_train.txt" was not found')
    if(!file.exists('./UCI HAR Dataset/train/subject_train.txt'))   stop('File "./UCI HAR Dataset/train/subject_train.txt" was not found')
    # Activity Labels
    if(!file.exists('./UCI HAR Dataset/activity_labels.txt'))   stop('File "./UCI HAR Dataset/activity_labels.txt" was not found')    

    # Feching the data
    xTestData <- read.table('./UCI HAR Dataset/test/X_test.txt')
    yTestData <- read.table('./UCI HAR Dataset/test/y_test.txt')
    subjectTestInfo <- read.table('./UCI HAR Dataset/test/subject_test.txt')
    xTrainData <- read.table('./UCI HAR Dataset/train/X_train.txt')
    yTrainData <- read.table('./UCI HAR Dataset/train/y_train.txt')
    subjectTrainInfo <- read.table('./UCI HAR Dataset/train/subject_train.txt')
    activityLabelsInfo <- read.table('./UCI HAR Dataset/activity_labels.txt')
    
    #Creating the names fot the data frames
    colnames(subjectTestInfo) <- "Subject.Id"
    colnames(subjectTrainInfo) <- "Subject.Id"
    colnames(yTestData) <- "Activity.Id"
    colnames(yTrainData) <- "Activity.Id"
    colnames(activityLabelsInfo) <- c("Activity.Id", "Activity.Name")
        
    # Formating the test data (Adding the data "All Columns of Test Data", "Activity Id", "Subject Id" and "Type")
    # Test
    finalTestData <- cbind(xTestData, subjectTestInfo, yTestData)
    # Train
    finalTrainData <- cbind(xTrainData, subjectTrainInfo, yTrainData)
    
    # Union of both data sets
    unitedData <- rbind(finalTestData, finalTrainData)
    
    # Finally, find the activity name base on the activity id
    result <- merge(unitedData, activityLabelsInfo, by="Activity.Id")
    
    # Reordering the columns since the merge puts the "Activity.Id" first
    result <- subset(result, select=c(2:564,1))
    
    # Return the result
    result
}