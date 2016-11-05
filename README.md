#Human Activity Recognition Using Smartphones Dataset
Version 1.0

##Attribution:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
- activityrecognition@smartlab.ws
- www.smartlab.ws

##About:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed 
six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy 
S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial 
angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained 
dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data 
and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width 
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and 
body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational 
force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each 
window, a vector of features was obtained by calculating variables from the time and frequency domain. 
*See 'features_codebook.md' for more details.*

##Details:
###For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

###The datasets utilized the following files:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

###The following files are available for the train and test data. Their descriptions are equivalent:
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is 
	  from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard 
	  gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 
	  'total_acc_z_train.txt' files for the Y and Z axis.
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the 
    total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window 
    sample. The units are radians/second. 

###Two datasets have been derived from the data sets that are described above:
-  merge.dat ('merge_data.csv', can be read in using read.csv(FILE_NAME)): a set of all mean, standard deviation, and 
    frequency mean calculations for X, Y and Z components and magnitude for time and frequency measurements. The data is 
	  merged in such a way that the test data is the "top" portion of the new data set and the training data is the "bottom"
	  portion of the new set. This distinction becomes unimportant once the table is ordered (ascending) and grouped by subject 
	  and activity, resulting in a 10299 x 81 table.
-  merge.means ('merge_means.csv', can be read in using read.csv(FILE_NAME)): a summary of the aformentioned data
	  set such that each action record is averaged for each subject and activity, resultings in a 180 x 81 table of means

###The following describes the column name logic:
-  [t/f].[function].[mean/std/meanFreq].[X/Y/Z/Mag]
-  t: time components
-  f: frequency components
-  BodyAcc: acceleration of the subject's body
-  GravityAcc: acceleration of gravity on the subject's body
-  BodyAccJerk: jerk the subject's body undergoes from acceleration
-  BodyGyro: gyroscopic motion of the subject's body
-  BodyGyroJerk: jerk the subject's body undergoes from gyroscopic motion
-  mean: the mean value of data collected on participating subjects
-  std: the standard deviation value of data collected on participating subjects
-  meanFreq: the mean of frequency values associated to the data collected on participating subjects
-  X: motion along the x-axis
-  Y: motion along the y-axis
-  Z: motion along the z-axis
-  Mag: the magnitude of a given calculation (eg. vector and magnitude)
*See features_codebook for more information*

##Additional Information:
Two additional columns have been added to the beginning of the dataset for subject and activity. These columns are named 
"Subject" and "Activity", respectively. The Subject column displays the subject identifiers (eg. 1, 2, 3) and the Activity 
column displays the associated activity (text value).

Data is "clusted" by action in the column header. For example, columns 3, 4, 5 and 6 are t.BodyAcc.mean.X, t.BodyAcc.mean.Y, 
t.BodyAcc.mean.Z and t.BodyAcc.mean.Mag, respectively.

####Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
