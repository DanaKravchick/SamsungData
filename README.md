##**Analysis of Samsung Galaxy activity experiment** 

This code takes [input](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) from the Samsung Galaxy [exercise experiment](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and combines the data for the training and testing subjects to one data frame. 

The code assigns names to the different variables measured by the Samsung Galaxy accelerometers and give descriptive labels to the activity types. 

Lastly, the code groups the data by subjects and activity types to create 180 groups. The code then calculates the mean of all the measurements per each of the groups. 

This summary dataset is the final [output](https://s3.amazonaws.com/coursera-uploads/peer-review/71100cbf5de89cab5e8a8baf721567a6/Mean_activity_results) of the code.  
