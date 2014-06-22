#Human Activity Recognition Using Smartphones

### Course Project
### Getting and cleaning Data, Coursera
### Nick Burns, 2014

#-------------------------------------------------------------------------------
  
# Load required libraries

library(sqldf)
library(plyr)


#Set the working directory and extract the raw data
setwd("C:/DataSciToolkit/DataScienceToolkit/GetCleanData/CleaningData")
unzip("getdata-projectfiles-UCI HAR Dataset.zip")


#-------------------------------------------------------------------------------
  
  ## [1, 2] Merge the Test and Training datasets
  

# We need to combine 3 set of files to create the superset. The files are described below:
#   
#   **X_train.txt, X_test.txt  (OBSERVATIONS) **  
#   These files hold the actual observations. There are 7352 observations, each of which is made up of 561 feature values.
# The feature values are described in the file, **features.txt**, and are ordered as presented in this file.
# 
# **y_train.txt, y_test.txt  (ACTIVITIES)  **    
#   The observations were recorded while the subjects were performing certain activities. These activities are described
# in the file, **activity_labels.txt**. For each observation in **X_train.txt, X_test.txt**, there is a corresponding
# integer value, {1, 2, .., 6}, in **y_train.txt, y_test.txt**. These integer values map an activity name to each 
# observation.
# 
# **subject_train.txt, subject_test.txt  (SUBJECTS)  **  
#   Like the mapping of ACTIVITIES to OBSERVATIONS, these subject files contain an series of 7352 integers that correspond
# to a given subject. In this study, the subjects are only identified by this unique and anonymous SubjectID which we will
# also use in the creation of our superset.
# 
# Below, the OBSERVATIONS, ACTIVITIES and SubJECTS are mapped onto one another to produce a superset containing one row
# for each mapping of {SubjectID, ActivityName, OBSERVATIONS}.  
# NOTE: that the OBSERVATIONS ar themselves a vector of length *n*, and that each element will be named according to the name
# in the file, **features.txt**.  


# read in the feature labels and the observations
lbl_features <- read.table("./UCI HAR Dataset/features.txt")
observations <- rbind(  read.table("./UCI HAR Dataset/test/X_test.txt")
                        , read.table("./UCI HAR Dataset/train/X_train.txt") )

# read in the activity labels and the activities
lbl_activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activities   <- rbind(  read.table("./UCI HAR Dataset/test/y_test.txt")
                        , read.table("./UCI HAR Dataset/train/y_train.txt") )

# read in the subjectIDs
subjects <- rbind(  read.table("./UCI HAR Dataset/test/subject_test.txt")
                    , read.table("./UCI HAR Dataset/train/subject_train.txt") )


# subset the observations to only those features related to mean() and std()
# extract index of relevant features
names(lbl_features) <- c("featureID", "label")
names(lbl_activity) <- c("activityID", "label")

idx_features <- sqldf("SELECT featureID, label
                      FROM lbl_features
                      WHERE label LIKE '%mean()%'
                      OR label LIKE '%std()%'
                      ")
# subset the observations to only include those of interest 
# i.e. select all rows from observations, but only columns from idx_features
observations <- observations[, idx_features$featureID]

# finally, apply the feature names to observations
names(observations) <- idx_features$label


#Now that the OBSERVATIONS are suitably collated, we need to append the ACTIVITIES and SUBJECTS to create the superset
# first we will column bind the activities and subjects to the observations
superset <- data.frame(subjects, activities, observations)
names(superset) <- c("SubjectID", "Activity", names(observations))

# now we will replace the activity integers with their corresponding names
superset$Activity <- sqldf("  SELECT lblA.label
                           FROM superset as sup
                           JOIN lbl_activity as lblA
                           WHERE sup.Activity = lblA.activityID
                           ")

# Finally, create a new tidy dataset that is the average of each activity for each subject.
# for the sake of making this easy, I am going to recreate the superset, without the ActivityLabel
# I found when using the sqldf package, there was a datatype error where the Activity column was
# perceived as a data.frame() and therefore invalid.

rm(superset)
superset <- data.frame(subjects, activities, observations)
names(superset) <- c("SubjectID", "Activity", names(observations))

# now group the data by SubjectID and Activity and calculate the mean for all observations
tidy <- ddply(    superset
                  , c("SubjectID", "Activity")
                  , function(q) sapply(q[, c(3:68)], mean)
)

# Finally, for clarity I will replace the ActivityIDs with ActivityLabels once more
tmp <- sqldf("  SELECT lblA.label
                          FROM tidy as t
                            JOIN lbl_activity as lblA
                          WHERE t.Activity = lblA.activityID
                      ")

# have to mae an adjustment to parse the Activity labels to file properly
tidy$Activity <- as.character(tmp[[1]])

# and lastly, write out the results
write.table(tidy, "human_activity_data.txt")
