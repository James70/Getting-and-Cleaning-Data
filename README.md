Getting-and-Cleaning-Data - Course Project

# How the R processing script works

Here is the approach I took:  
Step 1:  
	Bind the Subject column and the Activity column to the Measurement dataset for TRAINING dataset    
Step 2:   
	Bind the Subject column and the Activity column to the Measurement dataset for TRAINING datset   
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
  
1. Please note that I created a second copy of the final dataset, formatted for fixed column width.  
   To do this I used the write.fwf() function which is not in the default library set so you must   
   ensure to manually install the "gdata" package from CRAN in your R Studio in my script. The fixed
   width columns are definitely easier to read, however, be aware that the columns don't line up with
   the column labels.
   
2. I chose to simply edit a copy of the "features.txt" file in order to define only the columns  
   which were standard deviation or mean measurement data. The processing scripts reads this file  
   to determine which measurements to exclude in the final tidy dataset. The processing script also  
   uses the same file (mymeasures.txt) to assign meaningful column labels to the final dataset.      


