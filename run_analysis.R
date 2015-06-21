# Include libraries
library(plyr)
library(data.table)

# Define static variables
DATASET_PATH <- "UCI HAR Dataset"
SEP = "/"

# Load all data
X_train <- read.table(paste(DATASET_PATH, "/train/X_train.txt", sep=SEP), quote="\"", stringsAsFactors=FALSE)
X_test <- read.table(paste(DATASET_PATH, "/test/X_test.txt", sep=SEP), quote="\"", stringsAsFactors=FALSE)
subject_train <- read.table(paste(DATASET_PATH, "/train/subject_train.txt", sep=SEP), quote="\"", stringsAsFactors=FALSE)
subject_test <- read.table(paste(DATASET_PATH, "/test/subject_test.txt", sep=SEP), quote="\"", stringsAsFactors=FALSE)
y_train <- read.table(paste(DATASET_PATH, "/train/y_train.txt", sep=SEP), quote="\"", stringsAsFactors=FALSE)
y_test <- read.table(paste(DATASET_PATH, "/test/y_test.txt", sep=SEP), quote="\"", stringsAsFactors=FALSE)
activity_labels <- read.table(paste(DATASET_PATH, "/activity_labels.txt", sep=SEP), quote="\"", stringsAsFactors=FALSE)
features <- read.table(paste(DATASET_PATH, "/features.txt", sep=SEP), quote="\"", stringsAsFactors=FALSE)

# Add header & merge train set
names(X_train) <- features$V2
y_activity_train <- join(y_train, activity_labels, by="V1", type="left")
names(y_activity_train) <- c("activity_id", "activity")
names(subject_train) <- c("subject")
X_train_all <- cbind(subject_train, y_activity_train, X_train)

# Add header & merge test set
names(X_test) <- features$V2
y_activity_test <- join(y_test, activity_labels, by="V1", type="left")
names(y_activity_test) <- c("activity_id", "activity")
names(subject_test) <- c("subject")
X_test_all <- cbind(subject_test, y_activity_test, X_test)

# Merge train & test sets
data <- rbind(X_train_all, X_test_all)

# Keep only mean, std, subject & activity columns
mean_col <- grep('mean()', names(data), value = TRUE, fixed = TRUE)
std_col <- grep('std()', names(data), value = TRUE, fixed = TRUE)
data <- data[c("subject", "activity", mean_col, std_col)]

# Correct the names of the columns
names(data) <- gsub("()", "", names(data), fixed=TRUE)
names(data) <- gsub("-", "", names(data), fixed=TRUE)

# Get the mean of all columns by its activity and subject
data <- data.table(data)
data_mean <- data[, j = list(
  tBodyAccmeanX = mean(tBodyAccmeanX),
  tBodyAccmeanY = mean(tBodyAccmeanY),
  tBodyAccmeanZ = mean(tBodyAccmeanZ),
  tGravityAccmeanX = mean(tGravityAccmeanX),
  tGravityAccmeanY = mean(tGravityAccmeanY),
  tGravityAccmeanZ = mean(tGravityAccmeanZ),
  tBodyAccJerkmeanX = mean(tBodyAccJerkmeanX),
  tBodyAccJerkmeanY = mean(tBodyAccJerkmeanY),
  tBodyAccJerkmeanZ = mean(tBodyAccJerkmeanZ),
  tBodyGyromeanX = mean(tBodyGyromeanX),
  tBodyGyromeanY = mean(tBodyGyromeanY),
  tBodyGyromeanZ = mean(tBodyGyromeanZ),
  tBodyGyroJerkmeanX = mean(tBodyGyroJerkmeanX),
  tBodyGyroJerkmeanY = mean(tBodyGyroJerkmeanY),
  tBodyGyroJerkmeanZ = mean(tBodyGyroJerkmeanZ),
  tBodyAccMagmean = mean(tBodyAccMagmean),
  tGravityAccMagmean = mean(tGravityAccMagmean),
  tBodyAccJerkMagmean = mean(tBodyAccJerkMagmean),
  tBodyGyroMagmean = mean(tBodyGyroMagmean),
  tBodyGyroJerkMagmean = mean(tBodyGyroJerkMagmean),
  fBodyAccmeanX = mean(fBodyAccmeanX),
  fBodyAccmeanY = mean(fBodyAccmeanY),
  fBodyAccmeanZ = mean(fBodyAccmeanZ),
  fBodyAccJerkmeanX = mean(fBodyAccJerkmeanX),
  fBodyAccJerkmeanY = mean(fBodyAccJerkmeanY),
  fBodyAccJerkmeanZ = mean(fBodyAccJerkmeanZ),
  fBodyGyromeanX = mean(fBodyGyromeanX),
  fBodyGyromeanY = mean(fBodyGyromeanY),
  fBodyGyromeanZ = mean(fBodyGyromeanZ),
  fBodyAccMagmean = mean(fBodyAccMagmean),
  fBodyBodyAccJerkMagmean = mean(fBodyBodyAccJerkMagmean),
  fBodyBodyGyroMagmean = mean(fBodyBodyGyroMagmean),
  fBodyBodyGyroJerkMagmean = mean(fBodyBodyGyroJerkMagmean),
  tBodyAccstdX = mean(tBodyAccstdX),
  tBodyAccstdY = mean(tBodyAccstdY),
  tBodyAccstdZ = mean(tBodyAccstdZ),
  tGravityAccstdX = mean(tGravityAccstdX),
  tGravityAccstdY = mean(tGravityAccstdY),
  tGravityAccstdZ = mean(tGravityAccstdZ),
  tBodyAccJerkstdX = mean(tBodyAccJerkstdX),
  tBodyAccJerkstdY = mean(tBodyAccJerkstdY),
  tBodyAccJerkstdZ = mean(tBodyAccJerkstdZ),
  tBodyGyrostdX = mean(tBodyGyrostdX),
  tBodyGyrostdY = mean(tBodyGyrostdY),
  tBodyGyrostdZ = mean(tBodyGyrostdZ),
  tBodyGyroJerkstdX = mean(tBodyGyroJerkstdX),
  tBodyGyroJerkstdY = mean(tBodyGyroJerkstdY),
  tBodyGyroJerkstdZ = mean(tBodyGyroJerkstdZ),
  tBodyAccMagstd = mean(tBodyAccMagstd),
  tGravityAccMagstd = mean(tGravityAccMagstd),
  tBodyAccJerkMagstd = mean(tBodyAccJerkMagstd),
  tBodyGyroMagstd = mean(tBodyGyroMagstd),
  tBodyGyroJerkMagstd = mean(tBodyGyroJerkMagstd),
  fBodyAccstdX = mean(fBodyAccstdX),
  fBodyAccstdY = mean(fBodyAccstdY),
  fBodyAccstdZ = mean(fBodyAccstdZ),
  fBodyAccJerkstdX = mean(fBodyAccJerkstdX),
  fBodyAccJerkstdY = mean(fBodyAccJerkstdY),
  fBodyAccJerkstdZ = mean(fBodyAccJerkstdZ),
  fBodyGyrostdX = mean(fBodyGyrostdX),
  fBodyGyrostdY = mean(fBodyGyrostdY),
  fBodyGyrostdZ = mean(fBodyGyrostdZ),
  fBodyAccMagstd = mean(fBodyAccMagstd),
  fBodyBodyAccJerkMagstd = mean(fBodyBodyAccJerkMagstd),
  fBodyBodyGyroMagstd = mean(fBodyBodyGyroMagstd),
  fBodyBodyGyroJerkMagstd = mean(fBodyBodyGyroJerkMagstd)
), by = list(subject, activity)]

# Order the new set by its subject in ascending order
setorder(data_mean, subject)

# Write the data to the file named “data_mean.txt”
write.table(data_mean, file="data_mean.txt", row.name=FALSE)
