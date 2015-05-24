# GETTING AND CLEANING DATA PROJECT
#
# Function GetTidyDataSet
#
# Parameters: 
#   1. the directory (default is the working directory)
# containing the contents of the UCI HAR Dataset folder
# (the "train" folder, the "test" folder, README.txt, features.txt etc.)
# which zip can be downloaded here https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# 2. the outputFileName (default is NULL)
# should you alo want to write the tidy data set returned by the GetTidyDataSet function to a table, specify the fileName
# and it will be stored in your working directory
#
# Returns
#   The tidy data set following the instructions of the coursera GETTING AND CLEANING DATA PROJECT

GetTidyDataSet<- function(directory = getwd(), outputFile = NULL){
  #stores the current working directory
  currentwd<-getwd()
  
  #sets the working directory to the directory containing the data
  setwd(directory)
  
  #reading the train data set
  subjectTrain<-read.table("./train/subject_train.txt")
  XTrain<-read.table("./train/X_train.txt")
  YTrain<-read.table("./train/y_train.txt")
  #dim(subjectTrain)   #7352 experiments * 1 subject identifier
  #dim(XTrain)         #7352 experiments * 561 observed features
  #dim(YTrain)         #7352 experiments * 1 activity identifier
  
  #reading the test data set
  subjectTest<-read.table("./test/subject_test.txt")
  XTest<-read.table("./test/X_test.txt")
  YTest<-read.table("./test/y_test.txt")
  #dim(subjectTest)    #2947 experiments * 1 subject identifier
  #dim(XTest)          #2947 experiments * 561 observed features
  #dim(YTest)          #2947 experiments * 1 activity identifier
  
  #Step1: merging the train and test data sets
  subjectData<-rbind(subjectTrain,subjectTest)
  XData<-rbind(XTrain,XTest)
  YData<-rbind(YTrain,YTest)
  #dim(subjectData)    #10299 = (7352 + 2947) experiments * 1 subject identifier
  #dim(XData)          #10299 = (7352 + 2947) experiments * 561 observed features
  #dim(YData)          #10299 = (7352 + 2947) experiments * 1 activity identifier
  
  #reading the features index/labels mapping 
  features<-read.table("features.txt", stringsAsFactors = FALSE)
  #reading activity identifier/labels mapping
  activityLabels<-read.table("activity_labels.txt", stringsAsFactors = FALSE)
  
  #setting syntactically valid names to XData, constructed from the features labels via make.names
  #STEP4
  names(XData)<-make.names(features[[2]],unique=TRUE)
  
  
  #loading dplyr library (http://cran.r-project.org/web/packages/dplyr/index.html)
  library(dplyr)
  
  #STEP2: we store in meanOrStdData the columns which name contain mean or std (we ignore upper/lower case)
  #we use the regular expression mean|std ("mean or std") and ignore the case
  meanOrStdData=select(XData, matches("mean|std", ignore.case = TRUE))
  #dim(meanOrStdData)       #10299 experiments * 86 columns containing mean or std (ignore case) in their column name
  
  #we create a data frame activityData with one column "Activity" which is the YData in label form.
  #we achieve this by joining the experiments activity identifiers in YData with the corresponding label from the activityLabels mapping, 
  #and by keeping only the activity labels in a "Activity" column
  activityData<-left_join(YData, activityLabels, by="V1")%>%select(Activity = V2)
  #str(activityData)       #10299 obs of the Activity variable (the activity label)
  
  #we give a sensible column name to the subjectData data frame containing the subject of each experiment
  names(subjectData)<-c("Subject")
  
  #STEP3: we create a clean data frame, with the subject, activity label and
  cleanMeanOrStdData<-cbind(subjectData,activityData, meanOrStdData)
  #dim(cleanMeanOrStdData)  #10299 experiments * 88 columns (subject id, activity label, 86 mean or std measured features)
  
  #STEP5
  #we create the meanPerActivityAndSubject tidy data set, as we group by subject and activity, 
  # and summarise each feature by calculating its mean
  meanPerActivityAndSubject=cleanMeanOrStdData%>%group_by(Subject,Activity)%>%summarise_each(funs(mean))
  #dim(meanPerActivityAndSubject) #180 rows * 88 columns
  #the 180 rows correspond to the 30 people (subjects) * 6 activites
  
  #we set the working directory back to its original value
  setwd(currentwd)
  #if specified, we write the meanPerActivityAndSubject to a outputFile file
  #in the user's working directory
  if(!is.null(outputFile)){
    write.table(meanPerActivityAndSubject, file=outputFile, row.name=FALSE)
  }
  return(meanPerActivityAndSubject)
}

