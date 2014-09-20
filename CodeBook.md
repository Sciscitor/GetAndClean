Code Book
========================================================
Getting and Cleaning Data Course Project
--------------------------------------------------------

Data Source
-------------------------------------------------------

The source data for this project was obtained from the Human Activity Recognition 
Using Smartphones Dataset (Version 1.0). To quote from the original code book for
this data set, they document:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19>-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, >SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

Data Transformation
-------------------------------------------------------

That experimental data comprised a large number of variables and observations.  For our new dataset we only selected the variables within the original data that measured the mean or standard deviation of a value (including in this case the mean frequency values and the mean angles between vectors). The observations were summarised by calculating the average value of each selected variable for each subject / activity pairing.


Data Description
-------------------------------------------------------

The first variables within the data set are:

1. Subject - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
2. Activity Label - The activity the subject was carrying out.

The next set are the averages of the variables conserved within this analysis. We will describe those in bulk here, then call out specific values that we have kept below:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The variables in the actual dataset are the averages of those described above, and are listed here: 

Avg tBodyAcc-XYZ  
Avg tGravityAcc-XYZ  
Avg tBodyAccJerk-XYZ  
Avg tBodyGyro-XYZ  
Avg tBodyGyroJerk-XYZ 
Avg tBodyAccMag  
Avg tGravityAccMag  
Avg tBodyAccJerkMag  
Avg tBodyGyroMag  
Avg tBodyGyroJerkMag  
Avg fBodyAcc-XYZ  
Avg fBodyAccJerk-XYZ  
Avg fBodyGyro-XYZ  
Avg fBodyAccMag  
Avg fBodyAccJerkMag  
Avg fBodyGyroMag  
Avg fBodyGyroJerkMag  

The set of variables that were estimated from these signals are:   

mean(): Mean value  
std(): Standard deviation  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
angle(): Angle between two vectors. These include additional vectors obtained by averaging the windows in the window sample.  
        -gravityMean  
        -tBodyAccMean  
        -tBodyAccJerkMean  
        -tBodyGyroMean  
        -tBodyGyroJerkMean  


License:
========

As per the license with this data, use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012