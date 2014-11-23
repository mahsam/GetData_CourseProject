# Transformed Human Activity Recognition Using Smartphones Dataset

## Information provided by:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws


## Purpose
Create a tidy dataset based on the mean and standard deviation variables in the Human Activity Recognition Using Smartphones dataset.

## Introduction
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

The features selected come from the accelerometer and gyroscope 3-axial raw signals tBodyAcc-XYZ and tBodyGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate the Mean (mean value) and Std (standard deviation) of the feature vector for each pattern. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Then we compute the mean of these mean and standard deviation measurements for each volunteer and each activity.

## Feature Selection
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

## Specifications
The collected data is from where 70% of the volunteers was selected for generating the training data and 30% the test data. Then, for each volunteer (total 30 volunteers) and each activity (total 6 activities), we computed the mean of the mean and standard deviation variables.

- The Features which the mean calculated for them are normalized and bounded within [-1,1].
- Each record is provided:

	1) An identifier of the subject who carried out the experiment.

	2) Its activity label. 

	3) The mean for 66-feature vector with time and frequency domain variables (the features are the mean and standard deviation measurements).

- The acceleration signal from the smartphone accelerometer X, Y and Z axis in standard gravity units 'g'. 
- The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
