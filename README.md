This tidy data for an experimets carried out with 30 people with six
activities .There is run_analysis.R file in this file:
first I read the of the raw data .There are two sets of data one for test and one for train.Just mean and std variables are chosen from each data sets for different people and different activites,and merged togther. The next step, is labling the merged data frame with discriptive names. Then the data frame is grouped by different people and the average value of each variable for each different activity is calculated and saved in tidy.txt file.
The activity in this data frame are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
Other varaibles are sensors signal (accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz).Two varables of linear acceleration and angular velocity are derived in time and frequencey for "Jerk" signals.
The varaibles that were estimated from these signals are mean(), and std().# GettingandCleaningDataProject
