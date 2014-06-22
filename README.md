run_analysis.R will produce a clean data set as described in the assignemt outline and below.

It was created with RStudio Version 0.98.501 ran on Win 8.1.

To run this script, no additional packages are neccessary.

The script assumes, that the data has been downloaded and you are in the first level of the data folder.
The steps to get there are also included in run_analysis.R but commented out.

The raw data was downloaded on Jun 21st 2014, 5:17pm CET from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This is a brief descripition what the script does and why I decided to do it this way:


# Task 1:

Reads in all 6 data sets, 3 of train group and 3 of test group. 

I decided to add the preliminary column names directly to the 6 raw data files beofre building the big data file.

Then the 6 data frames are put together to one large dataset.
First the 3 files of each groups are added by cbind, then the two resulting files are put together by rbind.

The resulting large dataframe is called traintest. 


# Task 2:

I decided to include only variables with -mean and -std but not -meanFreq.

To get those variables I used the grepl function to label the features dataset which variable contained
one or several of those strings and then created a subset dataframe columnset with only the variables that contain either -mean or -std but not -meanFreq. 

The dataframe columnset is then used to extract only the needed variables from the dataframe traintest, using the
variable number to subset the columns, and explicitly leaving in the columns 562 & 563 as they contain the person and activity the subset dataframe is called traintest2.


# Task 3:

The activity labels are read from the file activity_labels.txt and merged to traintest2 using the activity_id
resulting in traintest3.
The activity_id is then dropped (traintest4).

# Task 4:

I decided to remove the brackets from the variable names as they cause problems in R using the gsub function.
Also I replaced the hyphens with dots.

After some consideration I decided against making the variable names more descriptive as they 
already were, as the cost would have been to have really long variable names. 

For information on the variables please to the file codebook.md

# Task 5:

This step creates the final data set tidyData. It contains the means of all selected variables grouped by
the activity and person (or subject). For better readability I decided to move the grouping variables to the left.
I then created the tidy data set using the aggregate function on the measures variables.

The dataframe was saved as txt using the write.table function.

It can be opened in R using the read.table function:
tidy <- read.table("tidy.txt", col.names=T)


This data matches the prerequisites for tidy data, in particular:
- each variable in one column
- each observation (activity # person) in a different row
- variable names on top
- variable names are readable






