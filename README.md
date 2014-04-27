The following dataset are sections of the dataset on human activity recognition using smartphones.

Detailed description of the dataset:
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

==================================================================

Files included:
* run_analysis.R - summarizes the data and produces 2 datasets: tidy_data and tidy_data_aggr (to run the file you will need to set your working directory to the location of run_analysis.R file (by changing commented line of code); Requires data.table package installed
* tidy_data.txt - aggregation of training and test datasets on human activity, includes only measurements of mean and standard deviation
* tidy_data_aggr.txt - tidy_data.txt pivoted to produce the average of each variable for each activity and each subject. 

==================================================================

Variable names:
* subject - indicates the number of the subject in the study (number between 1 and 30)
* activity - indicates activity of the subject when the measurements were taken
All measurement variables are normalized to be within [-1 ; 1] range
prefix "time-" or "freq-" indicates the domain of the measurement
postfix indicates the axis of the measurement if appropriate
main part includes the measurement and the statistical measure used (either mean or standard deviation)

More detailed description can be found in the original dataset

