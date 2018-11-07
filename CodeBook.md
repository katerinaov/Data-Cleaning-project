The data set that this code book pertains to is located in the tidy_data.txt file of this repository.

See the README.md file of this repository for background information on this data set.

The structure of the data set is described in the Data section, its variables are listed in the Variables section, and the transformations that were carried out to obtain the data set based on the source data are presented in the Transformations section.

#Data
The tidy_data.txt data file is a text file, containing space-separated values.

The first row contains the names of the variables, which are listed and described in the Variables section, and the following rows contain the values of these variables.

#Variables
Each row contains, for a given subject and activity, 79 averaged signal measurements.

Identifiers
subject
Subject identifier, integer, ranges from 1 to 30.

activity
Activity identifier, string with 6 possible values:

- WALKING: subject was walking
- WALKING_UPSTAIRS: subject was walking upstairs
- WALKING_DOWNSTAIRS: subject was walking downstairs
- SITTING: subject was sitting
- STANDING: subject was standing
- LAYING: subject was laying

#Transformations:
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are the data for the project:

1) The training and test sets were merged to create one data set.
2) The measurements on the mean and standard deviation (i.e. signals containing the strings mean and std) were extracted for each measurement, and the others were discarded.
3) The activity and features identifiers  were replaced with descriptive activity names
4) The variable names were replaced with descriptive variable names (e.g. tBodyAcc-mean()-X was expanded to timeDomainBodyAccelerometerMeanX), using the following set of rules:
Special characters (i.e. (, ), and -) were removed
5)From the data set in step 4, the final data set was created with the average of each variable for each activity and each subject.
