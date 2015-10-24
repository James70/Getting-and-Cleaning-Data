Getting-and-Cleaning-Data - Course Project

# How the R processing script works
####################################
Here is the approach I took:
Step 1:
	Bind the Subject column and the Activity column to the Measurement dataset for TRAINING
Step 2: 
	Bind the Subject column and the Activity column to the Measurement dataset for TRAINING
Step 3: 
	Append the TRAINING dataset to the TEST dataset
Step 4:
	Remove the measurement column data that are NOT standard deviation or mean
Step 5:
	Substitute factors for ACTIVITY TYPE with the actual name of the activity
	example: all rows with "2" in the activity field are replaced with "WALKING UPSTAIRS"
Step 6:
	Create an aggregated matrix of averages by Subject and Activity
	This gives us one row with the aggregated averages for each subject for all 6 activites,
	thus producing 30 (subjects) x 6 (activites) = 180 rows in the summarized tidy dataset.

# Special notes or techniques use of particular interest
########################################################
1. Please note that I created a second copy of the final dataset, formatted for fixed column width.
   To do this I used the write.fwf() function which is not in the default library set so you must 
   ensure to install the "gdata" package from CRAN in your R Studio.
   
2. I chose to simply edit a copy of the "features.txt" file in order to define only the columns
   which were standard deviation or mean measurement data. The processing scripts reads this file
   to determine which measurements to exclude in the final tidy dataset. The processing script also
   uses the same file (mymeasures.txt) to assign meaningful column labels to the final dataset.    



# CODEBOOK FOR FINAL TIDY DATASET
# This is my codebook which identifies the columns in the test and training datasets to extract
# in order to obtain the mean and standard deviation of all the measurements.
#
# std()  denotes a standard deviation measurement
# mean() denotes a mean measurement
# 
# In the final tidy dataset, only the Measurement Description column is used (as the label for a column).
# There are 57 total measurement columns preceded by 1 Subject column and 1 Activity column in the final dataset.
#  
# The measurement descriptions were taken from "features.txt" which describes all the column meanings for both the
# TEST dataset and the TRAINING dataset. The in depth technical explanations for each "Measurement Description" label
# can be found in the "features_info.txt" file provided with the UCI HAR Dataset. 
##################################################################################################################
Col Measurement Description (short)
=== ===============================
1	Subject
2	Activity
3	tBodyAcc-mean()-X
4	tBodyAcc-mean()-Y
5	tBodyAcc-mean()-Z
6	tBodyAcc-std()-X
7	tBodyAcc-std()-Y
8	tBodyAcc-std()-Z
9	tGravityAcc-mean()-X
10	tGravityAcc-mean()-Y
11	tGravityAcc-mean()-Z
12	tGravityAcc-std()-X
13	tGravityAcc-std()-Y
14	tGravityAcc-std()-Z
15	tBodyAccJerk-mean()-X
16	tBodyAccJerk-mean()-Y
17	tBodyAccJerk-mean()-Z
18	tBodyAccJerk-std()-X
19	tBodyAccJerk-std()-Y
20	tBodyAccJerk-std()-Z
21	tBodyGyro-mean()-X
22	tBodyGyro-mean()-Y
23	tBodyGyro-mean()-Z
24	tBodyGyro-std()-X
25	tBodyGyro-std()-Y
26	tBodyGyro-std()-Z
27	tBodyAccMag-mean()
28	tBodyAccMag-std()
29	tBodyAccJerkMag-mean()
30	tBodyAccJerkMag-std()
31	tBodyGyroJerkMag-mean()
32	tBodyGyroJerkMag-std()
33	fBodyAcc-mean()-X
34	fBodyAcc-mean()-Y
35	fBodyAcc-mean()-Z
36	fBodyAcc-std()-X
37	fBodyAcc-std()-Y
38	fBodyAcc-std()-Z
39	fBodyAccJerk-mean()-X
40	fBodyAccJerk-mean()-Y
41	fBodyAccJerk-mean()-Z
42	fBodyAccJerk-std()-X
43	fBodyAccJerk-std()-Y
44	fBodyAccJerk-std()-Z
45	fBodyGyro-mean()-X
46	fBodyGyro-mean()-Y
47	fBodyGyro-mean()-Z
48	fBodyGyro-std()-X
49	fBodyGyro-std()-Y
50	fBodyGyro-std()-Z
51	fBodyAccMag-mean()
52	fBodyAccMag-std()
53	fBodyBodyAccJerkMag-mean()
54	fBodyBodyAccJerkMag-std()
55	fBodyBodyGyroMag-mean()
56	fBodyBodyGyroMag-std()
57	angle(X,gravityMean)
58	angle(Y,gravityMean)
59	angle(Z,gravityMean)

