# Data transformations
The data is downloaded from:<br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The raw dataset is described here:<br>
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Transformation steps
The following transformations were performed by the run_analysis.R script:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finally the clean dataset from step 5 is written down to the file clean_UCI_HAR.txt.

### Variables in dataset

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


**activity** - The type of activity. All variables are grouped and summarized by this

The below columns are columns from the original dataset with the mean around them.
[2] "tbodyacceleration_mean_x"                      
[3] "tbodyacceleration_mean_y"                      
[4] "tbodyacceleration_mean_z"                      
[5] "tbodyacceleration_standarddeviation_x"         
[6] "tbodyacceleration_standarddeviation_y"         
[7] "tbodyacceleration_standarddeviation_z"         
[8] "tgravityacceleration_mean_x"                   
[9] "tgravityacceleration_mean_y"                   
[10] "tgravityacceleration_mean_z"                   
[11] "tgravityacceleration_standarddeviation_x"      
[12] "tgravityacceleration_standarddeviation_y"      
[13] "tgravityacceleration_standarddeviation_z"      
[14] "tbodyaccelerationjerk_mean_x"                  
[15] "tbodyaccelerationjerk_mean_y"                  
[16] "tbodyaccelerationjerk_mean_z"                  
[17] "tbodyaccelerationjerk_standarddeviation_x"     
[18] "tbodyaccelerationjerk_standarddeviation_y"     
[19] "tbodyaccelerationjerk_standarddeviation_z"     
[20] "tbodygyro_mean_x"                              
[21] "tbodygyro_mean_y"                              
[22] "tbodygyro_mean_z"                              
[23] "tbodygyro_standarddeviation_x"                 
[24] "tbodygyro_standarddeviation_y"                 
[25] "tbodygyro_standarddeviation_z"                 
[26] "tbodygyrojerk_mean_x"                          
[27] "tbodygyrojerk_mean_y"                          
[28] "tbodygyrojerk_mean_z"                          
[29] "tbodygyrojerk_standarddeviation_x"             
[30] "tbodygyrojerk_standarddeviation_y"             
[31] "tbodygyrojerk_standarddeviation_z"             
[32] "tbodyaccelerationmag_mean"                     
[33] "tbodyaccelerationmag_standarddeviation"        
[34] "tgravityaccelerationmag_mean"                  
[35] "tgravityaccelerationmag_standarddeviation"     
[36] "tbodyaccelerationjerkmag_mean"                 
[37] "tbodyaccelerationjerkmag_standarddeviation"    
[38] "tbodygyromag_mean"                             
[39] "tbodygyromag_standarddeviation"                
[40] "tbodygyrojerkmag_mean"                         
[41] "tbodygyrojerkmag_standarddeviation"            
[42] "fbodyacceleration_mean_x"                      
[43] "fbodyacceleration_mean_y"                      
[44] "fbodyacceleration_mean_z"                      
[45] "fbodyacceleration_standarddeviation_x"         
[46] "fbodyacceleration_standarddeviation_y"         
[47] "fbodyacceleration_standarddeviation_z"         
[48] "fbodyacceleration_meanfreq_x"                  
[49] "fbodyacceleration_meanfreq_y"                  
[50] "fbodyacceleration_meanfreq_z"                  
[51] "fbodyaccelerationjerk_mean_x"                  
[52] "fbodyaccelerationjerk_mean_y"                  
[53] "fbodyaccelerationjerk_mean_z"                  
[54] "fbodyaccelerationjerk_standarddeviation_x"     
[55] "fbodyaccelerationjerk_standarddeviation_y"     
[56] "fbodyaccelerationjerk_standarddeviation_z"     
[57] "fbodyaccelerationjerk_meanfreq_x"              
[58] "fbodyaccelerationjerk_meanfreq_y"              
[59] "fbodyaccelerationjerk_meanfreq_z"              
[60] "fbodygyro_mean_x"                              
[61] "fbodygyro_mean_y"                              
[62] "fbodygyro_mean_z"                              
[63] "fbodygyro_standarddeviation_x"                 
[64] "fbodygyro_standarddeviation_y"                 
[65] "fbodygyro_standarddeviation_z"                 
[66] "fbodygyro_meanfreq_x"                          
[67] "fbodygyro_meanfreq_y"                          
[68] "fbodygyro_meanfreq_z"                          
[69] "fbodyaccelerationmag_mean"                     
[70] "fbodyaccelerationmag_standarddeviation"        
[71] "fbodyaccelerationmag_meanfreq"                 
[72] "fbodybodyaccelerationjerkmag_mean"             
[73] "fbodybodyaccelerationjerkmag_standarddeviation"
[74] "fbodybodyaccelerationjerkmag_meanfreq"         
[75] "fbodybodygyromag_mean"                         
[76] "fbodybodygyromag_standarddeviation"            
[77] "fbodybodygyromag_meanfreq"                     
[78] "fbodybodygyrojerkmag_mean"                     
[79] "fbodybodygyrojerkmag_standarddeviation"        
[80] "fbodybodygyrojerkmag_meanfreq"  

