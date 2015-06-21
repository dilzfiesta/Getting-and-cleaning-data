Different variable in the final set -
1. subject - ID of the subject used to perform this experiment (1 - 30)
2. activityAny of the below activities -
	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRS
	4 SITTING
	5 STANDING
	6 LAYING

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

3. tBodyAccmeanX
4. tBodyAccmeanY 
5. tBodyAccmeanZ 
6. tGravityAccmeanX
7. tGravityAccmeanY 
8. tGravityAccmeanZ 
9. tBodyAccJerkmeanX
10. tBodyAccJerkmeanY
11. tBodyAccJerkmeanZ
12. tBodyGyromeanX  
13. tBodyGyromeanY
14. tBodyGyromeanZ
15. tBodyGyroJerkmeanX
16. tBodyGyroJerkmeanY
17. tBodyGyroJerkmeanZ
18. tBodyAccMagmean 
19. tGravityAccMagmean
20. tBodyAccJerkMagmean
21. tBodyGyroMagmean
22. tBodyGyroJerkMagmean
23. fBodyAccmeanX 
24. fBodyAccmeanY
25. fBodyAccmeanZ 
26. fBodyAccJerkmeanX
27. fBodyAccJerkmeanY
28. fBodyAccJerkmeanZ
29. fBodyGyromeanX
30. fBodyGyromeanY  
31. fBodyGyromeanZ
32. fBodyAccMagmean  
33. fBodyBodyAccJerkMagmean
34. fBodyBodyGyroMagmean
35. fBodyBodyGyroJerkMagmean
36. tBodyAccstdX 
37. tBodyAccstdY  
38. tBodyAccstdZ  
39. tGravityAccstdX 
40. tGravityAccstdY  
41. tGravityAccstdZ  
42. tBodyAccJerkstdX
43. tBodyAccJerkstdY 
44. tBodyAccJerkstdZ 
45. tBodyGyrostdX
46. tBodyGyrostdY 
47. tBodyGyrostdZ 
48. tBodyGyroJerkstdX
49. tBodyGyroJerkstdY
50. tBodyGyroJerkstdZ
51. tBodyAccMagstd  
52. tGravityAccMagstd
53. tBodyAccJerkMagstd
54. tBodyGyroMagstd 
55. tBodyGyroJerkMagstd
56. fBodyAccstdX  
57. fBodyAccstdY 
58. fBodyAccstdZ  
59. fBodyAccJerkstdX 
60. fBodyAccJerkstdY
61. fBodyAccJerkstdZ 
62. fBodyGyrostdX 
63. fBodyGyrostdY
64. fBodyGyrostdZ 
65. fBodyAccMagstd
66. fBodyBodyAccJerkMagstd 
67. fBodyBodyGyroMagstd
68. fBodyBodyGyroJerkMagstd

The set of variables that were estimated from these signals are: 
1. mean: Mean value
2. std: Standard deviation


Following steps were performed to transform and clean the data -
1. Load all the data in their respective variables
2. Add headers from features.txt to the train & test sets
3. Merge activities and subjects to the train & test sets
4. Merge train & test sets
5. Keep only mean, std, subject & activity columns
6. Transform the names of the columns to remove any special characters
7. Get the mean of all columns by its activity and subject
8. Order the new set by its subject in ascending order
9. Write the data to the file named “data_mean.txt”
