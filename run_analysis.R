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
        
        ##Summarizes the dataset by subject (people) and activity
        merge.means <- merge.dat %>% summarize_each( funs(mean) )
        
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
