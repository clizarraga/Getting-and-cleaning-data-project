Getting-and-cleaning-data-project
=================================

The main objective of this project is to clean and process data to produce information than can be analysed later.

In this case we have this data 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

That must be extracted in the same directory where all the .R files are, to make it work properly.

The instructions are: You should create one R script called run_analysis.R that does the following. 

    * Merges the training and the test sets to create one data set.
    * Extracts only the measurements on the mean and standard deviation for each measurement. 
    * Uses descriptive activity names to name the activities in the data set
    * Appropriately labels the data set with descriptive variable names. 
    * Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

This repo contains all the information necessary to extract, merge, subset and calculate the average by subject and activity.

To make the steps more readable, I split the requirements in functions and created a master script that calls every function in a given order.

Contains the following files:

1. Codebook.md: Contains all the information (names of variables, a quick explanation of what they are, type of the variable) regarding the metric provided in the result.txt file

2. mergeTraingAndTestData.R: This function extracts all data from the testing files, training files, activity labels (provided in the original data set) and combines them into a unique data frame for further analysis. 

3. extractMeanAndStd.R: This function takes the result of the data calculated in the "mergeTraingAndTestData" function and subset it based on the ones that are related to the mean and the standard dev. It makes the selection based on the features.txt file (provided in the original data set)set.

4. avgByActivityAndSubject.R: This function takes the result of the data calculated in the "extractMeanAndStd" function and groups the data by Subject and Activity to calculate the average for those concepts.

5. run_analysis.R: This function is linked to the other three files in order to coordinate all three steps to run in the correct order and write the final output in a file called result.txt.

6. result.txt: This file contains the results of all the operations performed so far that concludes the result of this project
