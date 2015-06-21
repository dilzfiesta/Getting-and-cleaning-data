Following steps were performed to transform and clean the data -
1. Include supporting libraries using the library() function.
	- plyr
	- data.table

2. Define static variables like dataset’s path and OS seperator.
 	
3. Load all the data in their respective variables listed below.
	- X_train
	- X_test
	- subject_train
	- subject_test
	- y_train
	- y_test
	- activity_labels
	- features
	
4. Add headers from features vector to the train & test sets

5. Merge vectors activity_label and subject_train with the train sets.

6. Merge vectors activity_label and subject_test with the test sets.

7. Merge train & test sets using rbind() function.

8. Keep only mean, std, subject & activity columns and remove the rest.

9. Transform the names of the columns to remove any special characters using grep() function.

10. Get the mean of all columns by its activity and subject by first converting the data frame to data table and then calculating mean of each variables except subject and activity.

8. Order the new tidy dataset by its subject in ascending order

9. Write the dataset to the file named “data_mean.txt”


How to execute the R file -
Simple execute the run_analysis.R to output the tidy dataset in the form of a txt file.
