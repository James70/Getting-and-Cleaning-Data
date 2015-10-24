# Project: script name = run_analysis.R
#########################################

# Step 1: This section builds the full TRAINING table 
file1 <- "./UCI HAR Dataset/train/X_train.txt"
file2 <- "./UCI HAR Dataset/train/y_train.txt"
file3 <- "./UCI HAR Dataset/train/subject_train.txt"

x_train <- read.table(file1)  #x denotes the data set
y_train <- read.table(file2)  #y denotes the ACTIVITY code 1:6
s_train <- read.table(file3)  #s denotes the SUBJECT number 1:30

# bind the SUBJECT column and ACTIVITY column to build complete training table
complete_train <-cbind(s_train, y_train, x_train )


# Step 2: This section builds the full TEST table 
rm(file1); rm(file2); rm(file3)
file1 <- "./UCI HAR Dataset/test/X_test.txt"
file2 <- "./UCI HAR Dataset/test/y_test.txt"
file3 <- "./UCI HAR Dataset/test/subject_test.txt"

x_test <- read.table(file1)  #x denotes the data set
y_test <- read.table(file2)  #y denotes the ACTIVITY code 1:6
s_test <- read.table(file3)  #s denotes the SUBJECT number 1:30

# bind the SUBJECT column and ACTIVITY column with the TEST measurement table 
complete_test <-cbind(s_test, y_test, x_test )

# Step 3: append the full TEST data set to the full TRAINING data set using rbind()
s <- rbind( complete_train, complete_test)

# Step 4: relabel columns 1 and 2 to reflect Subject and Activity variables
colnames(s)[1] <- 'Subject'
colnames(s)[2] <- 'Activity'

# Step 5: pull out only the measurement columns for mean and standard deviation
measures <- data.frame() 
measures <- s[,1:2]
# Note: these column ranges are documented in "mymeasures.txt", but originally obtained (and edited) from "features.txt"
measures <- cbind( measures, s[,3:8], s[,41:46], s[,81:86],s[,121:126], s[,201:202], s[,227:228], s[,253:254])
measures <- cbind( measures, s[,266:271], s[,345:350], s[,424:429], s[,503:504], s[,516:517], s[,529:530], s[,559:561]) 

# Step 6: appropriately label the variables with description names of each mean or standard deviation measurement
# Note: the first section of "mymeasures.txt" contains the proper variable names for all mean and std columns
measure_names_table <- read.table("./mymeasures.txt", skip = 7)
measure_names <- measure_names_table[,2]
colnames(measures)[3:59] <- as.character(measure_names)

# Step 7: substitute factors for ACTIVITY TYPE with the actual name of the activity
activity_table <- read.table("./UCI HAR Dataset/activity_labels.txt")
     # CONSOLE TEST: head( activity_table[ match( measures$Activity, activity_table[,1]),2] ,40)
measures$Activity <- activity_table[ match( measures$Activity, activity_table[,1]),2]
     # DEBUGGING PURPOSES & VALIDATION: write.table(measures,"./measures.csv", row.names = FALSE, sep = ",")


#Step 8: (final step) Compute average of each variable for every ACTIVITY TYPE and SUBJECT
#Note:    This final step provides the final tidy data set we are asked for in Step 5 of the Project requirements
     # CONSOLE TEST: lapply(measures[2,3:4], mean)
# create an aggregated matrix of averages by Subject and Activity
aggr <- aggregate(.~ Subject + Activity, measures, mean)  # This works! confirmed

# submit to GitHub in the requested format
write.table(aggr, file = "myFinalTidyDataset.txt", row.names = FALSE )

# provide a fixed width version of the file for easier readability
# CRAN package 'gdata' must be installed for fixed width write.fwf to work
library(gdata)
file.fw = "myFinalTidyDataset_fw.txt"

# Note: the column labels don't align well with the column data, but they are all there
write.fwf(aggr, file=file.fw, width= c('7','18', rep(13,each=57)), colnames=TRUE, justify = 'right')

