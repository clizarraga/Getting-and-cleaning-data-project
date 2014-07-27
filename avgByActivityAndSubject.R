

avgByActivityAndSubject <- function(data) 
{
  
  # Converting data.frame to data.table
  DT <- data.table(data)

  # Calculating the Average
  dataAvg <- DT[, lapply(.SD,mean), by=c("Subject.Id","Activity.Name")]  
    
  # Return result
  dataAvg
}