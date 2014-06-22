The raw data to produce this data set was obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data collected from the accelerometers from the Samsung Galaxy S smartphone from an experiment
where 30 test persons (variable: person) did 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) several times.

====================================================================================================================
Important: This dataset contains the mean on the measures by activity and person.
The measures were all normalized and between [-1,1].
====================================================================================================================

The dataset tidy.txt contains the following 68 variables:

activity                  person                    tBodyAcc.mean.X           tBodyAcc.mean.Y          
tBodyAcc.mean.Z           tBodyAcc.std.X            tBodyAcc.std.Y            tBodyAcc.std.Z           
tGravityAcc.mean.X        tGravityAcc.mean.Y        tGravityAcc.mean.Z        tGravityAcc.std.X        
tGravityAcc.std.Y         tGravityAcc.std.Z         tBodyAccJerk.mean.X       tBodyAccJerk.mean.Y      
tBodyAccJerk.mean.Z       tBodyAccJerk.std.X        tBodyAccJerk.std.Y        tBodyAccJerk.std.Z       
tBodyGyro.mean.X          tBodyGyro.mean.Y          tBodyGyro.mean.Z          tBodyGyro.std.X          
tBodyGyro.std.Y           tBodyGyro.std.Z           tBodyGyroJerk.mean.X      tBodyGyroJerk.mean.Y     
tBodyGyroJerk.mean.Z      tBodyGyroJerk.std.X       tBodyGyroJerk.std.Y       tBodyGyroJerk.std.Z      
tBodyAccMag.mean          tBodyAccMag.std           tGravityAccMag.mean       tGravityAccMag.std       
tBodyAccJerkMag.mean      tBodyAccJerkMag.std       tBodyGyroMag.mean         tBodyGyroMag.std         
tBodyGyroJerkMag.mean     tBodyGyroJerkMag.std      fBodyAcc.mean.X           fBodyAcc.mean.Y          
fBodyAcc.mean.Z           fBodyAcc.std.X            fBodyAcc.std.Y            fBodyAcc.std.Z           
fBodyAccJerk.mean.X       fBodyAccJerk.mean.Y       fBodyAccJerk.mean.Z       fBodyAccJerk.std.X       
fBodyAccJerk.std.Y        fBodyAccJerk.std.Z        fBodyGyro.mean.X          fBodyGyro.mean.Y         
fBodyGyro.mean.Z          fBodyGyro.std.X           fBodyGyro.std.Y           fBodyGyro.std.Z          
fBodyAccMag.mean          fBodyAccMag.std           fBodyBodyAccJerkMag.mean  fBodyBodyAccJerkMag.std  
fBodyBodyGyroMag.mean     fBodyBodyGyroMag.std      fBodyBodyGyroJerkMag.mean fBodyBodyGyroJerkMag.std


Pre-/ Postfixes:

t = time
f = frequency domain signals

.XYZ' is used to denote 3.axial signals in the X, Y and Z directions.

mean = average
std = standard deviation

Further explanations to variable meanings:

BodyAcc = body acceleration
GravityAcc = gravity acceleration
Jerk = jerk signals from accelerometer / gyroscope
Mag = magnitude of 3-dimensional signals

