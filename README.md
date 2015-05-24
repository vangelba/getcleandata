README
--


The run_analysis.R script's purpose is to create a clean data set based on original data coming from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

and via steps described in the Project assignment for the Getting and Cleaning Data course offered on Coursera
https://www.coursera.org/course/getdata

The steps given are that the run_analysis.R:

1)Merges the training and the test sets to create one data set.

2)Extracts only the measurements on the mean and standard deviation for each measurement.

3)Uses descriptive activity names to name the activities in the data set

4)Appropriately labels the data set with descriptive variable names. 

5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



Before going through the steps and how they are performed, lets focus on reading the raw data

We assume the data is in unzipped in the working directory (the test and train folders are in the working directory).
Alternatively we can pass the root directory containing them to the function via the optional argument.
We can also give a file name to store the tidy data set to the user's working directory (and hence it is ready to be uploaded to coursera, which is part of the exercise)

```{r}
  GetTidyDataSet<- function(directory = getwd(), outputFile = NULL){
  #stores the current working directory
  currentwd<-getwd()
  
  #sets the working directory to the directory containing the data
  setwd(directory)
```
 
 Now we are in the right directory and can read the data
```{r}
  
  #reading the train data set
  subjectTrain<-read.table("./train/subject_train.txt")
  XTrain<-read.table("./train/X_train.txt")
  YTrain<-read.table("./train/y_train.txt")
  dim(subjectTrain)   #7352 experiments * 1 subject identifier
  dim(XTrain)         #7352 experiments * 561 observed features
  dim(YTrain)         #7352 experiments * 1 activity identifier
  
  #reading the test data set
  subjectTest<-read.table("./test/subject_test.txt")
  XTest<-read.table("./test/X_test.txt")
  YTest<-read.table("./test/y_test.txt")
  dim(subjectTest)    #2947 experiments * 1 subject identifier
  dim(XTest)          #2947 experiments * 561 observed features
  dim(YTest)          #2947 experiments * 1 activity identifier
```

subjectTrain and subjectData reference the subject corresponding to each experiment.
YTrain and YData reference the activity integer id corresponding to experiment.
XTrain and XData contain the measurements for the 561 features for each experiment.
Experiments are stored in rows, features in columns.
We check that we indeed have the 70-30% split of the experiments between train and test data.

We can now safely bind the Train and Test experiments by row => STEP 1) completed.
It is very important though that we bind them with the same order (Train and Test or Test and Train) for all three new tables.
```{r}
  #Step1: merging the train and test data sets
  subjectData<-rbind(subjectTrain,subjectTest)
  XData<-rbind(XTrain,XTest)
  YData<-rbind(YTrain,YTest)
  #dim(subjectData)    #10299 = (7352 + 2947) experiments * 1 subject identifier
  #dim(XData)          #10299 = (7352 + 2947) experiments * 561 observed features
  #dim(YData)          #10299 = (7352 + 2947) experiments * 1 activity identifier
```
  
  
  We now read the features mapping which will let us give good names to the columns (XData has non human readable columns).
  We also read the activity mapping between the activity integer and actual human readable activity label.
  This prepares STEP 3) and STEP 4)
```{r}
  #reading the features index/labels mapping 
  features<-read.table("features.txt", stringsAsFactors = FALSE)
  #reading activity identifier/labels mapping
  activityLabels<-read.table("activity_labels.txt", stringsAsFactors = FALSE)
```
  
  
  We can now set the column names to the merged data set => STEP 4) completed
  It is important to use make.names as this lets us created unique column names which is crucial for manipulating the data, and filtering with the columns. We had to do it because the labels provided were not unique (which can be checked by comparing length(unique(features[[2]])) and length(features[[2]])) )
```{r}
  #setting syntactically valid names to XData, constructed from the features labels via make.names
  #STEP4
  names(XData)<-make.names(features[[2]],unique=TRUE)
```
	
	
	Based on these unique column labels, we can work using dplyr and complete STEP 2)
	We use the select function and provide a regular expression via the matches option.
	The mean|std regular expression while ignoring case makes sure we get only columns which contain mean or std in their name.
```{r}
  #loading dplyr library (http://cran.r-project.org/web/packages/dplyr/index.html)
  library(dplyr)
  
  #STEP2: we store in meanOrStdData the columns which name contain mean or std (we ignore upper/lower case)
  #we use the regular expression mean|std ("mean or std") and ignore the case
  meanOrStdData=select(XData, matches("mean|std", ignore.case = TRUE))
  dim(meanOrStdData)       #10299 experiments * 86 columns containing mean or std (ignore case) in their column name 
```
  
  Now we can use the activity labels, and we create activityData which is basically the YData using the corresponding activity label. We had to join two tables to do that.
  We also give a sensible column name to the subject data.
```{r}
  #we create a data frame activityData with one column "Activity" which is the YData in label form.
  #we achieve this by joining the experiments activity identifiers in YData with the corresponding label from the activityLabels mapping, 
  #and by keeping only the activity labels in a "Activity" column
  activityData<-left_join(YData, activityLabels, by="V1")%>%select(Activity = V2)
  str(activityData)       #10299 obs of the Activity variable (the activity label)
 
  #we give a sensible column name to the subjectData data frame containing the subject of each experiment
  names(subjectData)<-c("Subject")
```
  Completing STEP 3) is now straight forward.
  We bind the data by column and get cleanMeanOrStdData, which is all the train and test data, for features involving mean and std, with appropriate labels, and as each line is an experiment for a subject and activity, the clean data principle is applied, and we specify the subject id and activity label.
So for each observation (or experiment), we have a line, and it has all the data we need to describe this unique observation in a readable and clear format.
```{r}
  #STEP3: we create a clean data frame, with the subject, activity label and
  cleanMeanOrStdData<-cbind(subjectData,activityData, meanOrStdData)
  #dim(cleanMeanOrStdData)  #10299 experiments * 88 columns (subject id, activity label, 86 mean or std measured features)
```
  
  Finally, using dplyr, we group by subject and activity, and summarize each column by applying the mean function.
  We hence complete STEP 5).
  We check that we indeed have 180 rows, which are the 180 possible pairs possible given that the data was constructed by involving 30 subjects performing the 6 activities each.
```{r}
  #STEP5
  #we create the meanPerActivityAndSubject tidy data set, as we group by subject and activity, 
  # and summarise each feature by calculating its mean
  meanPerActivityAndSubject=cleanMeanOrStdData%>%group_by(Subject,Activity)%>%summarise_each(funs(mean))
  #dim(meanPerActivityAndSubject) #180 rows * 88 columns
  #the 180 rows correspond to the 30 people (subjects) * 6 activites
```
  
  We can now return the tidy data set of STEP 5), but we have also the option of going back to the initial working directory of the user who called our function and store the tidy data set in a file if an outputfile was specified, which is what is used if you need to upload it to Coursera to complete the project!
```{r}
  #we set the working directory back to its original value
  setwd(currentwd)
  #if specified, we write the meanPerActivityAndSubject to a outputFile file
  #in the user's working directory
  if(!is.null(outputFile)){
    write.table(meanPerActivityAndSubject, file=outputFile, row.name=FALSE)
  }
  return(meanPerActivityAndSubject)
```
  
References:
---
https://www.coursera.org/course/getdata
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  






