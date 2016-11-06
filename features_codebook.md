#Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using 
a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the 
acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (t.BodyAccJerk.XYZ 
and t.BodyGyroJerk.XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
(t.BodyAcc.Mag, t.GravityAcc.Mag, t.BodyAccJerk.Mag, t.BodyGyro.Mag, t.BodyGyroJerk.Mag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing f.BodyAcc.XYZ, f.BodyAccJerk.XYZ, 
f.BodyGyro.XYZ, f.BodyAccJerk.Mag, f.BodyGyro.Mag, f.BodyGyroJerk.Mag. (Note the 'f' to indicate frequency domain signals).

##The following describes the column name logic:
-  [factors].[signal].[function].[dimension]

###Factors:
-  t: time components
-  f: frequency components

###Signals:
-  BodyAcc: acceleration of the subject's body
-  GravityAcc: acceleration of gravity on the subject's body
-  BodyAccJerk: jerk the subject's body undergoes from acceleration
-  BodyGyro: gyroscopic motion of the subject's body
-  BodyGyroJerk: jerk the subject's body undergoes from gyroscopic motion

###Functions:
-  mean: the mean value of data collected on participating subjects
-  std: the standard deviation value of data collected on participating subjects
-  meanFreq: the mean of frequency values associated to the data collected on participating subjects

###Dimensions:
-  X: motion along the x-axis
-  Y: motion along the y-axis
-  Z: motion along the z-axis
-  Mag: the magnitude of a given calculation (eg. vector and magnitude)
