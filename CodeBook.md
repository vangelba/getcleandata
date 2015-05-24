---
title: "CodeBook"
---

Subject  : int                           
Subject identifier for the person who performed the activity for each window sample. Its range is from 1 to 30 and identifies a person in a group of 30 volunteers within an age bracket of 19-48 years
  
Activity  : chr  
Activity performed by the subject (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

tBodyAcc.mean...X                   : num
tBodyAcc.mean...Y                   : num 
tBodyAcc.mean...Z                   : num 
Mean per (Subject,Activity) pair of the time body acceleration signal's mean over a signal window sample along the X,Y,Z axis 

tBodyAcc.std...X                    : num
tBodyAcc.std...Y                    : num
tBodyAcc.std...Z                    : num  
Mean per (Subject,Activity) pair of the time body acceleration signal's standard deviation over a signal window sample along the X,Y,Z axis


tGravityAcc.mean...X                : num
tGravityAcc.mean...Y                : num 
tGravityAcc.mean...Z                : num  
Mean per (Subject,Activity) pair of the time gravity acceleration signal's mean over a signal window sample along the X,Y,Z axis

tGravityAcc.std...X                 : num  
tGravityAcc.std...Y                 : num  
tGravityAcc.std...Z                 : num  
Mean per (Subject,Activity) pair of the time gravity acceleration signal's standard deviation over a signal window sample along the X,Y,Z axis

tBodyAccJerk.mean...X               : num  
tBodyAccJerk.mean...Y               : num
tBodyAccJerk.mean...Z               : num  
Mean per (Subject,Activity) pair of the time body acceleration Jerk signal's mean over a signal window sample along the X,Y,Z axis

tBodyAccJerk.std...X                : num  
tBodyAccJerk.std...Y                : num  
tBodyAccJerk.std...Z                : num  
Mean per (Subject,Activity) pair of the time body acceleration Jerk signal's standard deviation over a signal window sample along the X,Y,Z axis

tBodyGyro.mean...X                  : num  
tBodyGyro.mean...Y                  : num  
tBodyGyro.mean...Z                  : num  
Mean per (Subject,Activity) pair of the time body angular velocity signal's mean over a signal window sample along the X,Y,Z axis

tBodyGyro.std...X                   : num  
tBodyGyro.std...Y                   : num  
tBodyGyro.std...Z                   : num  
Mean per (Subject,Activity) pair of the time body angular velocity signal's standard deviation over a signal window sample along the X,Y,Z axis

tBodyGyroJerk.mean...X              : num  
tBodyGyroJerk.mean...Y              : num  
tBodyGyroJerk.mean...Z              : num 
Mean per (Subject,Activity) pair of the time body angular velocity Jerk signal's mean over a signal window sample along the X,Y,Z axis 

tBodyGyroJerk.std...X               : num  
tBodyGyroJerk.std...Y               : num  
tBodyGyroJerk.std...Z               : num  
Mean per (Subject,Activity) pair of the time body angular velocity Jerk signal's standard deviation over a signal window sample along the X,Y,Z axis 

tBodyAccMag.mean..                  : num  
Mean per (Subject,Activity) pair of the time body acceleration signal's three dimensional magnitude (using Euclidean norm) mean over a signal window sample 

tBodyAccMag.std..                   : num  
Mean per (Subject,Activity) pair of the time body acceleration signal's three dimensional magnitude (using Euclidean norm) standard deviation over a signal window sample 

tGravityAccMag.mean..               : num  
Mean per (Subject,Activity) pair of the time gravity acceleration signal's three dimensional magnitude (using Euclidean norm) mean over a signal window sample 
tGravityAccMag.std..                : num  
Mean per (Subject,Activity) pair of the time gravity acceleration signal's three dimensional magnitude (using Euclidean norm) standard deviation over a signal window sample 

tBodyAccJerkMag.mean..              : num  
Mean per (Subject,Activity) pair of the time body acceleration Jerk signal's three dimensional magnitude (using Euclidean norm) mean over a signal window sample 

tBodyAccJerkMag.std..               : num  
Mean per (Subject,Activity) pair of the time body acceleration Jerk signal's three dimensional magnitude (using Euclidean norm) standard deviation over a signal window sample 

tBodyGyroMag.mean..                 : num  
Mean per (Subject,Activity) pair of the time body angular velocity signal's three dimensional magnitude (using Euclidean norm) mean over a signal window sample 

tBodyGyroMag.std..                  : num  
Mean per (Subject,Activity) pair of the time body angular velocity signal's three dimensional magnitude (using Euclidean norm) standard deviation over a signal window sample 

tBodyGyroJerkMag.mean..             : num  
Mean per (Subject,Activity) pair of the time body angular velocity Jerk signal's three dimensional magnitude (using Euclidean norm) mean over a signal window sample 

tBodyGyroJerkMag.std..              : num  
Mean per (Subject,Activity) pair of the time body angular velocity Jerk signal's three dimensional magnitude (using Euclidean norm) standard deviation over a signal window sample 

fBodyAcc.mean...X                   : num  
fBodyAcc.mean...Y                   : num  
fBodyAcc.mean...Z                   : num  
Mean per (Subject,Activity) pair of the body acceleration frequency signal's mean over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT).

fBodyAcc.std...X                    : num  
fBodyAcc.std...Y                    : num  
fBodyAcc.std...Z                    : num  
Mean per (Subject,Activity) pair of the body acceleration frequency signal's standard deviation over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT). 

fBodyAcc.meanFreq...X               : num  
fBodyAcc.meanFreq...Y               : num  
fBodyAcc.meanFreq...Z               : num  
Mean per (Subject,Activity) pair of the body acceleration frequency signal's mean frequency over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT), and the mean frequency with a weighted average of the signal's frequency components.


fBodyAccJerk.mean...X               : num  
fBodyAccJerk.mean...Y               : num  
fBodyAccJerk.mean...Z               : num  
Mean per (Subject,Activity) pair of the body acceleration frequency Jerk signal's mean over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT).

fBodyAccJerk.std...X                : num  
fBodyAccJerk.std...Y                : num  
fBodyAccJerk.std...Z                : num  
Mean per (Subject,Activity) pair of the body acceleration frequency Jerk signal's standard deviation over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT). 

fBodyAccJerk.meanFreq...X           : num  
fBodyAccJerk.meanFreq...Y           : num  
fBodyAccJerk.meanFreq...Z           : num  
Mean per (Subject,Activity) pair of the body acceleration frequency Jerk signal's mean frequency over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT), and the mean frequency with a weighted average of the signal's frequency components.

fBodyGyro.mean...X                  : num  
fBodyGyro.mean...Y                  : num  
fBodyGyro.mean...Z                  : num  
Mean per (Subject,Activity) pair of the body angular velocity frequency signal's mean over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT).

fBodyGyro.std...X                   : num  
fBodyGyro.std...Y                   : num  
fBodyGyro.std...Z                   : num  
Mean per (Subject,Activity) pair of the body angular velocity frequency signal's standard deviation over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT).

fBodyGyro.meanFreq...X              : num  
fBodyGyro.meanFreq...Y              : num  
fBodyGyro.meanFreq...Z              : num  
Mean per (Subject,Activity) pair of the body angular velocity frequency signal's mean frequency over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT), and the mean frequency with a weighted average of the signal's frequency components.

fBodyAccMag.mean..                  : num  
Mean per (Subject,Activity) pair of the body acceleration frequency signal's three dimensional magnitude (using Euclidean norm) mean over a signal window sample. The frequency signals were obtained by Fast Fourier Transform (FFT).


fBodyAccMag.std..                   : num  
Mean per (Subject,Activity) pair of the body acceleration frequency signal's three dimensional magnitude (using Euclidean norm) standard deviation over a signal window sample. The frequency signals were obtained by Fast Fourier Transform (FFT).

fBodyAccMag.meanFreq..              : num  
Mean per (Subject,Activity) pair of the body acceleration frequency  signal's three dimensional magnitude (using Euclidean norm) mean frequency over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT), and the mean frequency with a weighted average of the signal's frequency components.

fBodyBodyAccJerkMag.mean..          : num  
Mean per (Subject,Activity) pair of the body acceleration frequency Jerk signal's magnitude mean over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT), and magnitude is the Euclidean magnitude. 

fBodyBodyAccJerkMag.std..           : num  
Mean per (Subject,Activity) pair of the body acceleration frequency Jerk signal's magnitude standard deviation over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT), and magnitude is the Euclidean magnitude. 

fBodyBodyAccJerkMag.meanFreq..      : num  
Mean per (Subject,Activity) pair of the body acceleration frequency Jerk signal's magnitude mean frequency over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT), magnitude is the Euclidean magnitude, and mean frequency is the weighted average of the frequency components.

fBodyBodyGyroMag.mean..             : num  
Mean per (Subject,Activity) pair of the body angular velocity frequency signal's three dimensional magnitude (using Euclidean norm) mean over a signal window sample. The frequency signals were obtained by Fast Fourier Transform (FFT).

fBodyBodyGyroMag.std..              : num  
Mean per (Subject,Activity) pair of the body angular velocity frequency signal's three dimensional magnitude (using Euclidean norm) standard deviation over a signal window sample. The frequency signals were obtained by Fast Fourier Transform (FFT).

fBodyBodyGyroMag.meanFreq..         : num  
Mean per (Subject,Activity) pair of the body angular velocity frequency signal's magnitude mean frequency over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT), magnitude is the Euclidean magnitude, and mean frequency is the weighted average of the frequency components.

fBodyBodyGyroJerkMag.mean..         : num  
Mean per (Subject,Activity) pair of the body angular velocity frequency Jerk signal's magnitude mean over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT), and magnitude is the Euclidean magnitude. 

fBodyBodyGyroJerkMag.std..          : num  
Mean per (Subject,Activity) pair of the body angular velocity frequency Jerk signal's magnitude standard deviation over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT), and magnitude is the Euclidean magnitude. 

fBodyBodyGyroJerkMag.meanFreq..     : num  
Mean per (Subject,Activity) pair of the body angular velocity frequency  Jerk signal's three dimensional magnitude (using Euclidean norm) mean frequency over a signal window sample along the X,Y,Z axis. The frequency signals were obtained by Fast Fourier Transform (FFT), and the mean frequency with a weighted average of the signal's frequency components.

angle.tBodyAccMean.gravity.         : num  
Mean per (Subject,Activity) pair of the angle between the body acceleration and gravity time signals.

angle.tBodyAccJerkMean..gravityMean.: num  
Mean per (Subject,Activity) pair of the angle between the body acceleration Jerk mean time signal and gravity mean time signal.

angle.tBodyGyroMean.gravityMean.    : num  
Mean per (Subject,Activity) pair of the angle between the body angular velocity mean time signal and gravity mean time signal.

angle.tBodyGyroJerkMean.gravityMean.: num  
Mean per (Subject,Activity) pair of the angle between the body angular velocity mean time Jerk signal and gravity mean time signal.

angle.X.gravityMean.                : num  
angle.Y.gravityMean.                : num  
angle.Z.gravityMean.                : num  
Mean per (Subject,Activity) pair of the angle between the X,Y,Z axis and the mean gravity