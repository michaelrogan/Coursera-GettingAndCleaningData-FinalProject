Baseline Data Set Information:
<bR><BR>Data Set Information:<BR><BR>

Taken from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones<BR>
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. M<BR>
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing
a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label
the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected
for generating the training data and 30% the test data. <BR><BR>

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in <BR>
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and 
gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff 
frequency was used. From each window, a vector of features was obtained by calculating variables from the time and 
frequency domain."
<BR><BR>

Taken from the features_info.txt file:
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered 
using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, 
the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
<BR><BR>
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated
using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). <BR><BR>

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).<BR><BR> 

These signals were used to estimate variables of the feature vector for each pattern:  <BR>
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."<BR>
tBodyAcc-XYZ<BR>
tGravityAcc-XYZ<BR>
tBodyAccJerk-XYZ<BR>
tBodyGyro-XYZ<BR>
tBodyGyroJerk-XYZ<BR>
tBodyAccMag<BR>
tGravityAccMag<BR>
tBodyAccJerkMag<BR>
tBodyGyroMag<BR>
tBodyGyroJerkMag<BR>
fBodyAcc-XYZ<BR>
fBodyAccJerk-XYZ<BR>
fBodyGyro-XYZ<BR>
fBodyAccMag<BR>
fBodyAccJerkMag<BR>
fBodyGyroMag<BR>
fBodyGyroJerkMag<BR>
<BR>
The set of variables that were estimated from these signals were varied but in our tidy set we isolded: <BR>
<BR>
*Mean value<BR>
*Standard deviation
<BR><BR>

Additional vectors obtained by averaging the signals in a signal window sample.<BR> These are used on the angle() variable:
<BR><BR>
gravityMean<BR>
tBodyAccMean<BR>
tBodyAccJerkMean<BR>
tBodyGyroMean<BR>
tBodyGyroJerkMean<BR><BR>

Here are the data sets in the final data set created (names extraction).<BR>
"1" "Subjects"<BR>
"2" "Activities"<BR>
"3" "timeBodyAccelerometer.mean...X"<BR>
"4" "timeBodyAccelerometer.mean...Y"<BR>
"5" "timeBodyAccelerometer.mean...Z"<BR>
"6" "timeBodyAccelerometer.StandardDeviation...X"<BR>
"7" "timeBodyAccelerometer.StandardDeviation...Y"<BR>
"8" "timeBodyAccelerometer.StandardDeviation...Z"<BR>
"9" "timeGravityAccelerometer.mean...X"<BR>
"10" "timeGravityAccelerometer.mean...Y"<BR>
"11" "timeGravityAccelerometer.mean...Z"<BR>
"12" "timeGravityAccelerometer.StandardDeviation...X"<BR>
"13" "timeGravityAccelerometer.StandardDeviation...Y"<BR>
"14" "timeGravityAccelerometer.StandardDeviation...Z"<BR>
"15" "timeBodyAccelerometerJerk.mean...X"<BR>
"16" "timeBodyAccelerometerJerk.mean...Y"<BR>
"17" "timeBodyAccelerometerJerk.mean...Z"<BR>
"18" "timeBodyAccelerometerJerk.StandardDeviation...X"<BR>
"19" "timeBodyAccelerometerJerk.StandardDeviation...Y"<BR>
"20" "timeBodyAccelerometerJerk.StandardDeviation...Z"<BR>
"21" "timeBodyGyroscope.mean...X"<BR>
"22" "timeBodyGyroscope.mean...Y"<BR>
"23" "timeBodyGyroscope.mean...Z"<BR>
"24" "timeBodyGyroscope.StandardDeviation...X"<BR>
"25" "timeBodyGyroscope.StandardDeviation...Y"<BR>
"26" "timeBodyGyroscope.StandardDeviation...Z"<BR>
"27" "timeBodyGyroscopeJerk.mean...X"<BR>
"28" "timeBodyGyroscopeJerk.mean...Y"<BR>
"29" "timeBodyGyroscopeJerk.mean...Z"<BR>
"30" "timeBodyGyroscopeJerk.StandardDeviation...X"<BR>
"31" "timeBodyGyroscopeJerk.StandardDeviation...Y"<BR>
"32" "timeBodyGyroscopeJerk.StandardDeviation...Z"<BR>
"33" "timeBodyAccelerometerMagnitude.mean.."<BR>
"34" "timeBodyAccelerometerMagnitude.StandardDeviation.."<BR>
"35" "timeGravityAccelerometerMagnitude.mean.."<BR>
"36" "timeGravityAccelerometerMagnitude.StandardDeviation.."<BR>
"37" "timeBodyAccelerometerJerkMagnitude.mean.."<BR>
"38" "timeBodyAccelerometerJerkMagnitude.StandardDeviation.."<BR>
"39" "timeBodyGyroscopeMagnitude.mean.."<BR>
"40" "timeBodyGyroscopeMagnitude.StandardDeviation.."<BR>
"41" "timeBodyGyroscopeJerkMagnitude.mean.."<BR>
"42" "timeBodyGyroscopeJerkMagnitude.StandardDeviation.."<BR>
"43" "frequencyBodyAccelerometer.mean...X"<BR>
"44" "frequencyBodyAccelerometer.mean...Y"<BR>
"45" "frequencyBodyAccelerometer.mean...Z"<BR>
"46" "frequencyBodyAccelerometer.StandardDeviation...X"<BR>
"47" "frequencyBodyAccelerometer.StandardDeviation...Y"<BR>
"48" "frequencyBodyAccelerometer.StandardDeviation...Z"<BR>
"49" "frequencyBodyAccelerometerJerk.mean...X"<BR>
"50" "frequencyBodyAccelerometerJerk.mean...Y"<BR>
"51" "frequencyBodyAccelerometerJerk.mean...Z"<BR>
"52" "frequencyBodyAccelerometerJerk.StandardDeviation...X"<BR>
"53" "frequencyBodyAccelerometerJerk.StandardDeviation...Y"<BR>
"54" "frequencyBodyAccelerometerJerk.StandardDeviation...Z"<BR>
"55" "frequencyBodyGyroscope.mean...X"<BR>
"56" "frequencyBodyGyroscope.mean...Y"<BR>
"57" "frequencyBodyGyroscope.mean...Z"<BR>
"58" "frequencyBodyGyroscope.StandardDeviation...X"<BR>
"59" "frequencyBodyGyroscope.StandardDeviation...Y"<BR>
"60" "frequencyBodyGyroscope.StandardDeviation...Z"<BR>
"61" "frequencyBodyAccelerometerMagnitude.mean.."<BR>
"62" "frequencyBodyAccelerometerMagnitude.StandardDeviation.."<BR>
"63" "frequencyBodyAccelerometerJerkMagnitude.mean.."<BR>
"64" "frequencyBodyAccelerometerJerkMagnitude.StandardDeviation.."<BR>
"65" "frequencyBodyGyroscopeMagnitude.mean.."<BR>
"66" "frequencyBodyGyroscopeMagnitude.StandardDeviation.."<BR>
"67" "frequencyBodyGyroscopeJerkMagnitude.mean.."<BR>
"68" "frequencyBodyGyroscopeJerkMagnitude.StandardDeviation.."<BR>
