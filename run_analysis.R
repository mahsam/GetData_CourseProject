library(data.table)

# unzip data and load the data files into data tables
unzip("getdata-projectfiles-UCI HAR Dataset.zip")

# load activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# load test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# load train data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# find all the columns of the measurements on the mean and standard deviation
# in order to do this, we find all the columns which contains the words
# 'mean()' and 'std()'. Based on features_info.txt mean() and std() return
# mean and std for each measurement. measure_cols has the indexes for the
# mean and std columns.
measure_cols <- grep("mean\\(\\)|std\\(\\)", features[[2]])

# for better performance, we merge the train and test data files only with
# the columns we need. data_set variable is the merged data frame with the
# mean and std columns for each measurement and it's not final yet.
data_set <- rbind(X_train[,measure_cols], X_test[,measure_cols])

# merge the y_train and y_test activity files. It only contains one column
# and make it a factor column. Then we update the integer values with the
# activity labels from activity_labels.
y_set <- rbind(y_train, y_test)
y_set[,1] <- factor(y_set[,1])
levels(y_set[,1]) <- activity_labels[[2]]

# merge the subject_train and subject_test data
subject_set <- rbind(subject_train, subject_test)

# merge the subject and activity data with features data. Subject and Activity
# are the new columns in this data set.
# so data_set stores the final merged data we're looking for.
data_set <- cbind(data_set, Subject=subject_set[[1]])
data_set <- cbind(data_set, Activity=y_set[[1]])

# now, we need to update the column headers with descriptive names.
# remove special characters from column headers. In order to that first,
# we replace the 'mean()' and 'std()' with words 'Mean' and 'Std'.
# second, we remove all the special characters from the column names.
# third, we replace 'Body' with empty string (since all these measurements
# related to Body, we don't need to repeat it in all column header). With all
# the steps above, in my opinion, the column headers are descriptive, short, clean
# and human readalbe and shows what measurement they are related to.
# my opinion makes the column headers shorter, cleaner and more readable.
measure_names <- gsub("mean\\(\\)", "Mean", features[measure_cols,2])
measure_names <- gsub("std\\(\\)", "Std", measure_names)
measure_names <- gsub("\\-", "", measure_names)
measure_names <- gsub("BodyBody", "Body", measure_names)
measure_names <- c(measure_names, "Subject", "Activity")

# set the column names in data_set
colnames(data_set) <- measure_names

# average data set for each subject and activity
# in this data set, the combination of subject and activity is 
# unique (30*6=180 rows). Each column (excluding Subject and Activity) represents
# the mean value of the measurement for that specific subject and activity.
data_set<-data_set[order(data_set$Subject, data_set$Activity),]
data_set<-data.table(data_set)
avgdt<-data_set[, lapply(.SD, mean), by=list(data_set$Subject, data_set$Activity), .SDcols=c(1:66)]
setnames(avgdt, 1:2, c("Subject","Activity"))

# write the tidy data set into a text file which is ordered by Subject and Activity
write.table(avgdt, "AvgMeanStdMeasurementsHARDataSet.txt", row.name=FALSE)
