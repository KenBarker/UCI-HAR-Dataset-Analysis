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

##These signals were used to estimate variables of the feature vector for each pattern:  
###.X/Y/Z is used to denote 3-axial signals in the X, Y and Z directions and Mag is used to denote the magnitude of the vector
- t.BodyAcc.[function].[X/Y/Z/Mag]
- t.GravityAcc.[function].[X/Y/Z/Mag]
- t.BodyAccJerk.[function].[X/Y/Z/Mag]
- t.BodyGyro.[function].[X/Y/Z/Mag]
- t.BodyGyroJerk.[function].[X/Y/Z/Mag]
- f.BodyAcc.[function].[X/Y/Z/Mag]
- f.BodyAccJerk.[function].[X/Y/Z/Mag]
- f.BodyGyro.[function].[X/Y/Z/Mag]
- f.BodyGyroJerk.[function].[Mag]

##The functions used to manipulate the set of variables that were estimated from these signals are: 
- mean(): Mean value
- std(): Standard deviation
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
