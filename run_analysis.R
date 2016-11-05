##Manipulates multiple data sets generating a set that contains all means, 
##      standard deviations and frequency means for X, Y, Z and magnitude 
##      components. The second produced data set is a summary of the first, 
##      grouped by a subject identifier and activity and arranged in ascending
##      order. The first data set in 10299 x 81 and the second is 180 x 81.
run_analysis <- function(path = "./Assignments/UCI HAR Dataset/")
{
        ##Imports the dplyr library
        library(dplyr)
        
        ##Read in data from files
        test.dat   <- read.table( paste(path, "test/X_test.txt", sep = "") )
        test.act   <- read.table( paste(path, "test/y_test.txt", sep = "") )
        test.sub   <- read.table( paste(path, "test/subject_test.txt", 
                                        sep = "") )
        
        train.dat  <- read.table( paste(path, "train/X_train.txt", sep = "") )
        train.act  <- read.table( paste(path, "train/y_train.txt", sep = "") )
        train.sub  <- read.table( paste(path, "train/subject_train.txt", 
                                        sep = "") )
        
        labels.col <- read.table( paste(path, "features.txt", sep = ""), 
                                  stringsAsFactors = FALSE )
        labels.act <- read.table( paste(path, "activity_labels.txt", sep = ""), 
                                  stringsAsFactors = FALSE )
        
        ##Creates vectors with the values of the columns to be kept for all
        ##      mean and standard deviation calculations
        select.mean  <- c(1:3, 201, 41:43, 214, 81:83, 227, 121:123, 240, 
                          161:163, 253, 266:268, 503, 345:347, 516, 424:426, 
                          529, 542)
        select.sdev  <- c(4:6, 202, 44:46, 215, 84:86, 228, 124:126, 241, 
                          164:166, 254, 269:271, 504, 348:350, 517, 427:429, 
                          530, 543)
        select.meanF <- c(294:296, 513, 373:375, 526, 452:454, 539, 552)
        select.all   <- c(select.mean, select.sdev, select.meanF)
        rm(select.mean, select.sdev, select.meanF)
        
        ##Builds a list of appropriate title headers
        merge.col <- labels.col[select.all,2]
        merge.col <- gsub( "(Body)Body", "\\1", 
                           gsub( "^([ft]{1})", "\\1.", 
                                 gsub( "[()]", "", 
                                       gsub( "-", ".", merge.col ) ) ) )
        merge.col <- gsub( "([.]mean)$", ".mean.Mag", 
                           gsub( "([.]std)$", ".std.Mag", 
                                 gsub( "([.]meanFreq)$", ".meanFreq.Mag", 
                                       gsub( "Mag", "", merge.col ) ) ) )
        merge.col <- c("Subject", "Activity", merge.col)
        rm(labels.col)
        
        ##Merges the test and train data sets into one and sets the column 
        ##      names to the values in the list above
        merge.dat <- cbind( rbind( test.sub, train.sub ),
                            rbind( test.act, train.act ),
                            rbind( test.dat, train.dat )[select.all] )
        colnames(merge.dat) <- merge.col
        merge.dat <- merge( merge.dat, labels.act, by.x = "Activity", 
                            by.y = "V1") %>% select(Subject, V2, 
                            t.BodyAcc.mean.X:f.BodyGyroJerk.meanFreq.Mag)
        colnames(merge.dat)[2] <- "Activity"
        merge.dat <- merge.dat %>% arrange(Subject, Activity) %>% 
                                   group_by(Subject, Activity)
        rm(test.sub, test.act, test.dat, train.sub, train.act, train.dat, 
           labels.act, merge.col, select.all)
        
        ##Groups and summarizes the by subject (people) and activity
        merge.means <- summarize( merge.dat, 
                        t.BodyAcc.mean.X = mean(t.BodyAcc.mean.X),
                        t.BodyAcc.mean.Y = mean(t.BodyAcc.mean.Y),
                        t.BodyAcc.mean.Z = mean(t.BodyAcc.mean.Z),
                        t.BodyAcc.mean.Mag = mean(t.BodyAcc.mean.Mag),
                        t.GravityAcc.mean.X = mean(t.GravityAcc.mean.X),
                        t.GravityAcc.mean.Y = mean(t.GravityAcc.mean.Y),
                        t.GravityAcc.mean.Z = mean(t.GravityAcc.mean.Z),
                        t.GravityAcc.mean.Mag = mean(t.GravityAcc.mean.Mag),
                        t.BodyAccJerk.mean.X = mean(t.BodyAccJerk.mean.X),
                        t.BodyAccJerk.mean.Y = mean(t.BodyAccJerk.mean.Y),
                        t.BodyAccJerk.mean.Z = mean(t.BodyAccJerk.mean.Z),
                        t.BodyAccJerk.mean.Mag = mean(t.BodyAccJerk.mean.Mag),
                        t.BodyGyro.mean.X = mean(t.BodyGyro.mean.X),
                        t.BodyGyro.mean.Y = mean(t.BodyGyro.mean.Y),
                        t.BodyGyro.mean.Z = mean(t.BodyGyro.mean.Z),
                        t.BodyGyro.mean.Mag = mean(t.BodyGyro.mean.Mag),
                        t.BodyGyroJerk.mean.X = mean(t.BodyGyroJerk.mean.X),
                        t.BodyGyroJerk.mean.Y = mean(t.BodyGyroJerk.mean.Y),
                        t.BodyGyroJerk.mean.Z = mean(t.BodyGyroJerk.mean.Z),
                        t.BodyGyroJerk.mean.Mag = mean(t.BodyGyroJerk.mean.Mag),
                        f.BodyAcc.mean.X = mean(f.BodyAcc.mean.X),
                        f.BodyAcc.mean.Y = mean(f.BodyAcc.mean.Y),
                        f.BodyAcc.mean.Z = mean(f.BodyAcc.mean.Z),
                        f.BodyAcc.mean.Mag = mean(f.BodyAcc.mean.Mag),
                        f.BodyAccJerk.mean.X = mean(f.BodyAccJerk.mean.X),
                        f.BodyAccJerk.mean.Y = mean(f.BodyAccJerk.mean.Y),
                        f.BodyAccJerk.mean.Z = mean(f.BodyAccJerk.mean.Z),
                        f.BodyAccJerk.mean.Mag = mean(f.BodyAccJerk.mean.Mag),
                        f.BodyGyro.mean.X = mean(f.BodyGyro.mean.X),
                        f.BodyGyro.mean.Y = mean(f.BodyGyro.mean.Y),
                        f.BodyGyro.mean.Z = mean(f.BodyGyro.mean.Z),
                        f.BodyGyro.mean.Mag = mean(f.BodyGyro.mean.Mag),
                        f.BodyGyroJerk.mean.Mag = mean(f.BodyGyroJerk.mean.Mag),
                        t.BodyAcc.std.X = mean(t.BodyAcc.std.X),
                        t.BodyAcc.std.Y = mean(t.BodyAcc.std.Y),
                        t.BodyAcc.std.Z = mean(t.BodyAcc.std.Z),
                        t.BodyAcc.std.Mag = mean(t.BodyAcc.std.Mag),
                        t.GravityAcc.std.X = mean(t.GravityAcc.std.X),
                        t.GravityAcc.std.Y = mean(t.GravityAcc.std.Y),
                        t.GravityAcc.std.Z = mean(t.GravityAcc.std.Z),
                        t.GravityAcc.std.Mag = mean(t.GravityAcc.std.Mag),
                        t.BodyAccJerk.std.X = mean(t.BodyAccJerk.std.X),
                        t.BodyAccJerk.std.Y = mean(t.BodyAccJerk.std.Y),
                        t.BodyAccJerk.std.Z = mean(t.BodyAccJerk.std.Z),
                        t.BodyAccJerk.std.Mag = mean(t.BodyAccJerk.std.Mag),
                        t.BodyGyro.std.X = mean(t.BodyGyro.std.X),
                        t.BodyGyro.std.Y = mean(t.BodyGyro.std.Y),
                        t.BodyGyro.std.Z = mean(t.BodyGyro.std.Z),
                        t.BodyGyro.std.Mag = mean(t.BodyGyro.std.Mag),
                        t.BodyGyroJerk.std.X = mean(t.BodyGyroJerk.std.X),
                        t.BodyGyroJerk.std.Y = mean(t.BodyGyroJerk.std.Y),
                        t.BodyGyroJerk.std.Z = mean(t.BodyGyroJerk.std.Z),
                        t.BodyGyroJerk.std.Mag = mean(t.BodyGyroJerk.std.Mag),
                        f.BodyAcc.std.X = mean(f.BodyAcc.std.X),
                        f.BodyAcc.std.Y = mean(f.BodyAcc.std.Y),
                        f.BodyAcc.std.Z = mean(f.BodyAcc.std.Z),
                        f.BodyAcc.std.Mag = mean(f.BodyAcc.std.Mag),
                        f.BodyAccJerk.std.X = mean(f.BodyAccJerk.std.X),
                        f.BodyAccJerk.std.Y = mean(f.BodyAccJerk.std.Y),
                        f.BodyAccJerk.std.Z = mean(f.BodyAccJerk.std.Z),
                        f.BodyAccJerk.std.Mag = mean(f.BodyAccJerk.std.Mag),
                        f.BodyGyro.std.X = mean(f.BodyGyro.std.X),
                        f.BodyGyro.std.Y = mean(f.BodyGyro.std.Y),
                        f.BodyGyro.std.Z = mean(f.BodyGyro.std.Z),
                        f.BodyGyro.std.Mag = mean(f.BodyGyro.std.Mag),
                        f.BodyGyroJerk.std.Mag = mean(f.BodyGyroJerk.std.Mag),
                        f.BodyAcc.meanFreq.X = mean(f.BodyAcc.meanFreq.X),
                        f.BodyAcc.meanFreq.Y = mean(f.BodyAcc.meanFreq.Y),
                        f.BodyAcc.meanFreq.Z = mean(f.BodyAcc.meanFreq.Z),
                        f.BodyAcc.meanFreq.Mag = mean(f.BodyAcc.meanFreq.Mag),
                        f.BodyAccJerk.meanFreq.X = 
                                mean(f.BodyAccJerk.meanFreq.X),
                        f.BodyAccJerk.meanFreq.Y = 
                                mean(f.BodyAccJerk.meanFreq.Y),
                        f.BodyAccJerk.meanFreq.Z = 
                                mean(f.BodyAccJerk.meanFreq.Z),
                        f.BodyAccJerk.meanFreq.Mag = 
                                mean(f.BodyAccJerk.meanFreq.Mag),
                        f.BodyGyro.meanFreq.X = mean(f.BodyGyro.meanFreq.X),
                        f.BodyGyro.meanFreq.Y = mean(f.BodyGyro.meanFreq.Y),
                        f.BodyGyro.meanFreq.Z = mean(f.BodyGyro.meanFreq.Z),
                        f.BodyGyro.meanFreq.Mag = mean(f.BodyGyro.meanFreq.Mag),
                        f.BodyGyroJerk.meanFreq.Mag = 
                                mean(f.BodyGyroJerk.meanFreq.Mag) )
        
        ##Writes results to file (.csv)
        write.csv( merge.dat, paste(path, "merge_data.csv", sep = ""), 
                   row.names = FALSE )
        write.csv( merge.means, paste(path, "merge_means.csv", sep = ""), 
                   row.names = FALSE )
        
        ##Writes results to file (.txt)
        write.table( merge.dat, paste(path, "merge_data.txt", sep = ""), 
                     row.names = FALSE )
        write.table( merge.means, paste(path, "merge_means.txt", sep = ""), 
                     row.names = FALSE )
}