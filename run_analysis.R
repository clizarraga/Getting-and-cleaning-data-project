library(data.table)

source('./mergeTraingAndTestData.R')
source('./extractMeanAndStd.R')
source('./avgByActivityAndSubject.R')

run_analysis <- function()
{
  
    print('Fetching and Merging the data ... can take a while ...')
    # Requirement 1 and 4 of this project
    mergeData <- mergeTraingAndTestData()
    
    print('Subsetting data ... ')
    # Requirement 2 and 3 of this project
    meanAndStdData <- extractMeanAndStd(mergeData)
    
    print('Calculating the average for the subject and the activity ...')
    # Requirement 1 and 4 of this project
    finalResult <- avgByActivityAndSubject(meanAndStdData)
    
    print('Writing the data to a txt file ...')
    # Saving the final data in a txt
    write.table(finalResult, "result.txt")
  
}