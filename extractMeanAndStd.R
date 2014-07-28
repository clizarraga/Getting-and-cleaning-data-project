
# Base on a data subset and the descriptors of each column determines wich one of them is related to the mean and the standar dev and subsets it

extractMeanAndStd <- function(data) 
{
    # Validations for the files to be used
    # Features Labels
    if(!file.exists('./UCI HAR Dataset/features.txt'))   stop('File "./UCI HAR Dataset/features.txt" was not found')    
    
    # Feching the data
    featuresInfo <- read.table('./UCI HAR Dataset/features.txt')
 
    # Adding the aditional columns "Subject.Id" + "Activity.Name" + "Activity.Id"
    #featuresInfo <- rbind(featuresInfo, c("Subject.Id","Activity.Name","Activity.Id"))
  
    # Regular Expression to find wich columns are related to the mean in the data set
    meanIndexes <- grep("mean\\(\\)+", featuresInfo[,2], perl=TRUE, value=FALSE)
    # Regular Expression to find wich columns are related to the standar dev in the data set
    stdIndexes <- grep("std\\(\\)+", featuresInfo[,2], perl=TRUE, value=FALSE)
    # Union of the index
    finalIndexes <- rbind(meanIndexes, stdIndexes)
    
    # Subsetting the columns that involves mean and std
    result <- subset(data, select=c(finalIndexes,562,563,564))
    
    # Return result
    result
}