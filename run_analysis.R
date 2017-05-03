# Use working directory Samsung data
setwd("~/Samsung_data")

# Read measurment types to features file 
features<-read.table("./UCI HAR Dataset/features.txt")

# Read train text files

Train_subjects<-read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "Subjects")

Training_activity<-read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "Activity_type", colClasses = "character")

Training_measurments<-read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$V2)


# Combine train files to one data table
train_df<-cbind(Train_subjects, Training_activity, Training_measurments)


# Read test text files 

Test_subjects<-read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "Subjects")

Testing_activity<-read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "Activity_type")

Testing_measurments<-read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$V2)

# Add experiment group variable to label measurments as test 

#test_group<-rep("test", 2947)

# Combine test files to one data table 

test_df<-cbind(Test_subjects, Testing_Activity, Testing_measurments)

# Merge testing and training data sets using bind rows

Activity_experiment_df<-rbind.data.frame(train_df, test_df)

# Select only measurments of mean and standard deviation

Activity_experiment_df<- select(Activity_experiment_df, Subjects, Activity_type, contains("mean"), contains("std"))
print(Activity_experiment_df)

# Replace activities annotation with activity names
# TODO: Find a way to replace element annotations in one command

Activity_experiment_df$Activity_type<-gsub("1","WALKING", Activity_experiment_df$Activity_type)
Activity_experiment_df$Activity_type<-gsub("2","WALKING_UPSTAIRS", Activity_experiment_df$Activity_type)
Activity_experiment_df$Activity_type<-gsub("3","WALKING_DOWNSTAIRS", Activity_experiment_df$Activity_type)
Activity_experiment_df$Activity_type<-gsub("4","SITTING", Activity_experiment_df$Activity_type)
Activity_experiment_df$Activity_type<-gsub("5","STANDING", Activity_experiment_df$Activity_type)
Activity_experiment_df$Activity_type<-gsub("6", "LAYING", Activity_experiment_df$Activity_type)


# Change to tbl_df file
Activity_experiment_df<-tbl_df(Activity_experiment_df)

# Group the Activity_experiment_df by variables Subjects and Activity type 
Grouped_experiment_results<-group_by(Activity_experiment_df, Subjects, Activity_type)

# Creates a secondary independent data frame that summarizes the mean of the 
# observations per subject per activity type

Mean_experiment_results<-summarise_each(Grouped_experiment_results, funs(mean))

print(Mean_experiment_results)

write.table(Mean_experiment_results, "./TidyData", row.name=FALSE)

