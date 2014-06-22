#Human Activity Recognition Using Smartphones

### Course Project
### Getting and cleaning Data, Coursera
### Nick Burns, 2014

-------------------------------------------------------------------------------

## Background

The purpose of this project is to extract and clean a raw dataset, producing
a tidy dataset for further analysis. The final, tidy dataset (human_activity_data.txt) is described below:

## Human Activity Data

The final dataset, human_activity_data.txt, is made up of 180 observations each with 68 variables.
The observations are of 30 subjects and are a summary of the data collected by Reyes-Ortiz, Anguita, Ghio and Oneto (described below).

The structure of human_activity_data.txt is given below:


```r
human_activity_data <- read.table("human_activity_data.txt")

str(human_activity_data)
```

```
## 'data.frame':	180 obs. of  68 variables:
##  $ SubjectID                  : int  1 1 1 1 1 1 2 2 2 2 ...
##  $ Activity                   : Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1 4 6 5 2 ...
##  $ tBodyAcc.mean...X          : num  0.277 0.255 0.289 0.261 0.279 ...
##  $ tBodyAcc.mean...Y          : num  -0.01738 -0.02395 -0.00992 -0.00131 -0.01614 ...
##  $ tBodyAcc.mean...Z          : num  -0.1111 -0.0973 -0.1076 -0.1045 -0.1106 ...
##  $ tBodyAcc.std...X           : num  -0.284 -0.355 0.03 -0.977 -0.996 ...
##  $ tBodyAcc.std...Y           : num  0.11446 -0.00232 -0.03194 -0.92262 -0.97319 ...
##  $ tBodyAcc.std...Z           : num  -0.26 -0.0195 -0.2304 -0.9396 -0.9798 ...
##  $ tGravityAcc.mean...X       : num  0.935 0.893 0.932 0.832 0.943 ...
##  $ tGravityAcc.mean...Y       : num  -0.282 -0.362 -0.267 0.204 -0.273 ...
##  $ tGravityAcc.mean...Z       : num  -0.0681 -0.0754 -0.0621 0.332 0.0135 ...
##  $ tGravityAcc.std...X        : num  -0.977 -0.956 -0.951 -0.968 -0.994 ...
##  $ tGravityAcc.std...Y        : num  -0.971 -0.953 -0.937 -0.936 -0.981 ...
##  $ tGravityAcc.std...Z        : num  -0.948 -0.912 -0.896 -0.949 -0.976 ...
##  $ tBodyAccJerk.mean...X      : num  0.074 0.1014 0.0542 0.0775 0.0754 ...
##  $ tBodyAccJerk.mean...Y      : num  0.028272 0.019486 0.02965 -0.000619 0.007976 ...
##  $ tBodyAccJerk.mean...Z      : num  -0.00417 -0.04556 -0.01097 -0.00337 -0.00369 ...
##  $ tBodyAccJerk.std...X       : num  -0.1136 -0.4468 -0.0123 -0.9864 -0.9946 ...
##  $ tBodyAccJerk.std...Y       : num  0.067 -0.378 -0.102 -0.981 -0.986 ...
##  $ tBodyAccJerk.std...Z       : num  -0.503 -0.707 -0.346 -0.988 -0.992 ...
##  $ tBodyGyro.mean...X         : num  -0.0418 0.0505 -0.0351 -0.0454 -0.024 ...
##  $ tBodyGyro.mean...Y         : num  -0.0695 -0.1662 -0.0909 -0.0919 -0.0594 ...
##  $ tBodyGyro.mean...Z         : num  0.0849 0.0584 0.0901 0.0629 0.0748 ...
##  $ tBodyGyro.std...X          : num  -0.474 -0.545 -0.458 -0.977 -0.987 ...
##  $ tBodyGyro.std...Y          : num  -0.05461 0.00411 -0.12635 -0.96647 -0.98773 ...
##  $ tBodyGyro.std...Z          : num  -0.344 -0.507 -0.125 -0.941 -0.981 ...
##  $ tBodyGyroJerk.mean...X     : num  -0.09 -0.1222 -0.074 -0.0937 -0.0996 ...
##  $ tBodyGyroJerk.mean...Y     : num  -0.0398 -0.0421 -0.044 -0.0402 -0.0441 ...
##  $ tBodyGyroJerk.mean...Z     : num  -0.0461 -0.0407 -0.027 -0.0467 -0.049 ...
##  $ tBodyGyroJerk.std...X      : num  -0.207 -0.615 -0.487 -0.992 -0.993 ...
##  $ tBodyGyroJerk.std...Y      : num  -0.304 -0.602 -0.239 -0.99 -0.995 ...
##  $ tBodyGyroJerk.std...Z      : num  -0.404 -0.606 -0.269 -0.988 -0.992 ...
##  $ tBodyAccMag.mean..         : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...
##  $ tBodyAccMag.std..          : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...
##  $ tGravityAccMag.mean..      : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...
##  $ tGravityAccMag.std..       : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...
##  $ tBodyAccJerkMag.mean..     : num  -0.1414 -0.4665 -0.0894 -0.9874 -0.9924 ...
##  $ tBodyAccJerkMag.std..      : num  -0.0745 -0.479 -0.0258 -0.9841 -0.9931 ...
##  $ tBodyGyroMag.mean..        : num  -0.161 -0.1267 -0.0757 -0.9309 -0.9765 ...
##  $ tBodyGyroMag.std..         : num  -0.187 -0.149 -0.226 -0.935 -0.979 ...
##  $ tBodyGyroJerkMag.mean..    : num  -0.299 -0.595 -0.295 -0.992 -0.995 ...
##  $ tBodyGyroJerkMag.std..     : num  -0.325 -0.649 -0.307 -0.988 -0.995 ...
##  $ fBodyAcc.mean...X          : num  -0.2028 -0.4043 0.0382 -0.9796 -0.9952 ...
##  $ fBodyAcc.mean...Y          : num  0.08971 -0.19098 0.00155 -0.94408 -0.97707 ...
##  $ fBodyAcc.mean...Z          : num  -0.332 -0.433 -0.226 -0.959 -0.985 ...
##  $ fBodyAcc.std...X           : num  -0.3191 -0.3374 0.0243 -0.9764 -0.996 ...
##  $ fBodyAcc.std...Y           : num  0.056 0.0218 -0.113 -0.9173 -0.9723 ...
##  $ fBodyAcc.std...Z           : num  -0.28 0.086 -0.298 -0.934 -0.978 ...
##  $ fBodyAccJerk.mean...X      : num  -0.1705 -0.4799 -0.0277 -0.9866 -0.9946 ...
##  $ fBodyAccJerk.mean...Y      : num  -0.0352 -0.4134 -0.1287 -0.9816 -0.9854 ...
##  $ fBodyAccJerk.mean...Z      : num  -0.469 -0.685 -0.288 -0.986 -0.991 ...
##  $ fBodyAccJerk.std...X       : num  -0.1336 -0.4619 -0.0863 -0.9875 -0.9951 ...
##  $ fBodyAccJerk.std...Y       : num  0.107 -0.382 -0.135 -0.983 -0.987 ...
##  $ fBodyAccJerk.std...Z       : num  -0.535 -0.726 -0.402 -0.988 -0.992 ...
##  $ fBodyGyro.mean...X         : num  -0.339 -0.493 -0.352 -0.976 -0.986 ...
##  $ fBodyGyro.mean...Y         : num  -0.1031 -0.3195 -0.0557 -0.9758 -0.989 ...
##  $ fBodyGyro.mean...Z         : num  -0.2559 -0.4536 -0.0319 -0.9513 -0.9808 ...
##  $ fBodyGyro.std...X          : num  -0.517 -0.566 -0.495 -0.978 -0.987 ...
##  $ fBodyGyro.std...Y          : num  -0.0335 0.1515 -0.1814 -0.9623 -0.9871 ...
##  $ fBodyGyro.std...Z          : num  -0.437 -0.572 -0.238 -0.944 -0.982 ...
##  $ fBodyAccMag.mean..         : num  -0.1286 -0.3524 0.0966 -0.9478 -0.9854 ...
##  $ fBodyAccMag.std..          : num  -0.398 -0.416 -0.187 -0.928 -0.982 ...
##  $ fBodyBodyAccJerkMag.mean.. : num  -0.0571 -0.4427 0.0262 -0.9853 -0.9925 ...
##  $ fBodyBodyAccJerkMag.std..  : num  -0.103 -0.533 -0.104 -0.982 -0.993 ...
##  $ fBodyBodyGyroMag.mean..    : num  -0.199 -0.326 -0.186 -0.958 -0.985 ...
##  $ fBodyBodyGyroMag.std..     : num  -0.321 -0.183 -0.398 -0.932 -0.978 ...
##  $ fBodyBodyGyroJerkMag.mean..: num  -0.319 -0.635 -0.282 -0.99 -0.995 ...
##  $ fBodyBodyGyroJerkMag.std.. : num  -0.382 -0.694 -0.392 -0.987 -0.995 ...
```


The variables within human_activity_data.txt can be summarised:


```r
summary(human_activity_data)
```

```
##    SubjectID                  Activity  tBodyAcc.mean...X
##  Min.   : 1.0   LAYING            :30   Min.   :0.222    
##  1st Qu.: 8.0   SITTING           :30   1st Qu.:0.271    
##  Median :15.5   STANDING          :30   Median :0.277    
##  Mean   :15.5   WALKING           :30   Mean   :0.274    
##  3rd Qu.:23.0   WALKING_DOWNSTAIRS:30   3rd Qu.:0.280    
##  Max.   :30.0   WALKING_UPSTAIRS  :30   Max.   :0.301    
##  tBodyAcc.mean...Y  tBodyAcc.mean...Z tBodyAcc.std...X tBodyAcc.std...Y 
##  Min.   :-0.04051   Min.   :-0.1525   Min.   :-0.996   Min.   :-0.9902  
##  1st Qu.:-0.02002   1st Qu.:-0.1121   1st Qu.:-0.980   1st Qu.:-0.9421  
##  Median :-0.01726   Median :-0.1082   Median :-0.753   Median :-0.5090  
##  Mean   :-0.01788   Mean   :-0.1092   Mean   :-0.558   Mean   :-0.4605  
##  3rd Qu.:-0.01494   3rd Qu.:-0.1044   3rd Qu.:-0.198   3rd Qu.:-0.0308  
##  Max.   :-0.00131   Max.   :-0.0754   Max.   : 0.627   Max.   : 0.6169  
##  tBodyAcc.std...Z tGravityAcc.mean...X tGravityAcc.mean...Y
##  Min.   :-0.988   Min.   :-0.680       Min.   :-0.4799     
##  1st Qu.:-0.950   1st Qu.: 0.838       1st Qu.:-0.2332     
##  Median :-0.652   Median : 0.921       Median :-0.1278     
##  Mean   :-0.576   Mean   : 0.698       Mean   :-0.0162     
##  3rd Qu.:-0.231   3rd Qu.: 0.942       3rd Qu.: 0.0877     
##  Max.   : 0.609   Max.   : 0.975       Max.   : 0.9566     
##  tGravityAcc.mean...Z tGravityAcc.std...X tGravityAcc.std...Y
##  Min.   :-0.4951      Min.   :-0.997      Min.   :-0.994     
##  1st Qu.:-0.1173      1st Qu.:-0.983      1st Qu.:-0.971     
##  Median : 0.0238      Median :-0.970      Median :-0.959     
##  Mean   : 0.0741      Mean   :-0.964      Mean   :-0.952     
##  3rd Qu.: 0.1495      3rd Qu.:-0.951      3rd Qu.:-0.937     
##  Max.   : 0.9579      Max.   :-0.830      Max.   :-0.644     
##  tGravityAcc.std...Z tBodyAccJerk.mean...X tBodyAccJerk.mean...Y
##  Min.   :-0.991      Min.   :0.0427        Min.   :-0.03869     
##  1st Qu.:-0.961      1st Qu.:0.0740        1st Qu.: 0.00047     
##  Median :-0.945      Median :0.0764        Median : 0.00947     
##  Mean   :-0.936      Mean   :0.0795        Mean   : 0.00757     
##  3rd Qu.:-0.918      3rd Qu.:0.0833        3rd Qu.: 0.01340     
##  Max.   :-0.610      Max.   :0.1302        Max.   : 0.05682     
##  tBodyAccJerk.mean...Z tBodyAccJerk.std...X tBodyAccJerk.std...Y
##  Min.   :-0.06746      Min.   :-0.995       Min.   :-0.990      
##  1st Qu.:-0.01060      1st Qu.:-0.983       1st Qu.:-0.972      
##  Median :-0.00386      Median :-0.810       Median :-0.776      
##  Mean   :-0.00495      Mean   :-0.595       Mean   :-0.565      
##  3rd Qu.: 0.00196      3rd Qu.:-0.223       3rd Qu.:-0.148      
##  Max.   : 0.03805      Max.   : 0.544       Max.   : 0.355      
##  tBodyAccJerk.std...Z tBodyGyro.mean...X tBodyGyro.mean...Y
##  Min.   :-0.993       Min.   :-0.2058    Min.   :-0.2042   
##  1st Qu.:-0.983       1st Qu.:-0.0471    1st Qu.:-0.0896   
##  Median :-0.884       Median :-0.0287    Median :-0.0732   
##  Mean   :-0.736       Mean   :-0.0324    Mean   :-0.0743   
##  3rd Qu.:-0.512       3rd Qu.:-0.0168    3rd Qu.:-0.0611   
##  Max.   : 0.031       Max.   : 0.1927    Max.   : 0.0275   
##  tBodyGyro.mean...Z tBodyGyro.std...X tBodyGyro.std...Y tBodyGyro.std...Z
##  Min.   :-0.0724    Min.   :-0.994    Min.   :-0.994    Min.   :-0.986   
##  1st Qu.: 0.0747    1st Qu.:-0.974    1st Qu.:-0.963    1st Qu.:-0.961   
##  Median : 0.0851    Median :-0.789    Median :-0.802    Median :-0.801   
##  Mean   : 0.0874    Mean   :-0.692    Mean   :-0.653    Mean   :-0.616   
##  3rd Qu.: 0.1018    3rd Qu.:-0.441    3rd Qu.:-0.420    3rd Qu.:-0.311   
##  Max.   : 0.1791    Max.   : 0.268    Max.   : 0.476    Max.   : 0.565   
##  tBodyGyroJerk.mean...X tBodyGyroJerk.mean...Y tBodyGyroJerk.mean...Z
##  Min.   :-0.1572        Min.   :-0.0768        Min.   :-0.09250      
##  1st Qu.:-0.1032        1st Qu.:-0.0455        1st Qu.:-0.06172      
##  Median :-0.0987        Median :-0.0411        Median :-0.05343      
##  Mean   :-0.0961        Mean   :-0.0427        Mean   :-0.05480      
##  3rd Qu.:-0.0911        3rd Qu.:-0.0384        3rd Qu.:-0.04898      
##  Max.   :-0.0221        Max.   :-0.0132        Max.   :-0.00694      
##  tBodyGyroJerk.std...X tBodyGyroJerk.std...Y tBodyGyroJerk.std...Z
##  Min.   :-0.997        Min.   :-0.997        Min.   :-0.995       
##  1st Qu.:-0.980        1st Qu.:-0.983        1st Qu.:-0.985       
##  Median :-0.840        Median :-0.894        Median :-0.861       
##  Mean   :-0.704        Mean   :-0.764        Mean   :-0.710       
##  3rd Qu.:-0.463        3rd Qu.:-0.586        3rd Qu.:-0.474       
##  Max.   : 0.179        Max.   : 0.296        Max.   : 0.193       
##  tBodyAccMag.mean.. tBodyAccMag.std.. tGravityAccMag.mean..
##  Min.   :-0.9865    Min.   :-0.987    Min.   :-0.9865      
##  1st Qu.:-0.9573    1st Qu.:-0.943    1st Qu.:-0.9573      
##  Median :-0.4829    Median :-0.607    Median :-0.4829      
##  Mean   :-0.4973    Mean   :-0.544    Mean   :-0.4973      
##  3rd Qu.:-0.0919    3rd Qu.:-0.209    3rd Qu.:-0.0919      
##  Max.   : 0.6446    Max.   : 0.428    Max.   : 0.6446      
##  tGravityAccMag.std.. tBodyAccJerkMag.mean.. tBodyAccJerkMag.std..
##  Min.   :-0.987       Min.   :-0.993         Min.   :-0.995       
##  1st Qu.:-0.943       1st Qu.:-0.981         1st Qu.:-0.977       
##  Median :-0.607       Median :-0.817         Median :-0.801       
##  Mean   :-0.544       Mean   :-0.608         Mean   :-0.584       
##  3rd Qu.:-0.209       3rd Qu.:-0.246         3rd Qu.:-0.217       
##  Max.   : 0.428       Max.   : 0.434         Max.   : 0.451       
##  tBodyGyroMag.mean.. tBodyGyroMag.std.. tBodyGyroJerkMag.mean..
##  Min.   :-0.981      Min.   :-0.981     Min.   :-0.9973        
##  1st Qu.:-0.946      1st Qu.:-0.948     1st Qu.:-0.9852        
##  Median :-0.655      Median :-0.742     Median :-0.8648        
##  Mean   :-0.565      Mean   :-0.630     Mean   :-0.7364        
##  3rd Qu.:-0.216      3rd Qu.:-0.360     3rd Qu.:-0.5119        
##  Max.   : 0.418      Max.   : 0.300     Max.   : 0.0876        
##  tBodyGyroJerkMag.std.. fBodyAcc.mean...X fBodyAcc.mean...Y
##  Min.   :-0.998         Min.   :-0.995    Min.   :-0.9890  
##  1st Qu.:-0.981         1st Qu.:-0.979    1st Qu.:-0.9536  
##  Median :-0.881         Median :-0.769    Median :-0.5950  
##  Mean   :-0.755         Mean   :-0.576    Mean   :-0.4887  
##  3rd Qu.:-0.577         3rd Qu.:-0.217    3rd Qu.:-0.0634  
##  Max.   : 0.250         Max.   : 0.537    Max.   : 0.5242  
##  fBodyAcc.mean...Z fBodyAcc.std...X fBodyAcc.std...Y  fBodyAcc.std...Z
##  Min.   :-0.990    Min.   :-0.997   Min.   :-0.9907   Min.   :-0.987  
##  1st Qu.:-0.962    1st Qu.:-0.982   1st Qu.:-0.9404   1st Qu.:-0.946  
##  Median :-0.724    Median :-0.747   Median :-0.5134   Median :-0.644  
##  Mean   :-0.630    Mean   :-0.552   Mean   :-0.4815   Mean   :-0.582  
##  3rd Qu.:-0.318    3rd Qu.:-0.197   3rd Qu.:-0.0791   3rd Qu.:-0.266  
##  Max.   : 0.281    Max.   : 0.658   Max.   : 0.5602   Max.   : 0.687  
##  fBodyAccJerk.mean...X fBodyAccJerk.mean...Y fBodyAccJerk.mean...Z
##  Min.   :-0.995        Min.   :-0.989        Min.   :-0.992       
##  1st Qu.:-0.983        1st Qu.:-0.973        1st Qu.:-0.980       
##  Median :-0.813        Median :-0.782        Median :-0.871       
##  Mean   :-0.614        Mean   :-0.588        Mean   :-0.714       
##  3rd Qu.:-0.282        3rd Qu.:-0.196        3rd Qu.:-0.470       
##  Max.   : 0.474        Max.   : 0.277        Max.   : 0.158       
##  fBodyAccJerk.std...X fBodyAccJerk.std...Y fBodyAccJerk.std...Z
##  Min.   :-0.995       Min.   :-0.991       Min.   :-0.9931     
##  1st Qu.:-0.985       1st Qu.:-0.974       1st Qu.:-0.9837     
##  Median :-0.825       Median :-0.785       Median :-0.8951     
##  Mean   :-0.612       Mean   :-0.571       Mean   :-0.7565     
##  3rd Qu.:-0.247       3rd Qu.:-0.169       3rd Qu.:-0.5438     
##  Max.   : 0.477       Max.   : 0.350       Max.   :-0.0062     
##  fBodyGyro.mean...X fBodyGyro.mean...Y fBodyGyro.mean...Z
##  Min.   :-0.993     Min.   :-0.994     Min.   :-0.986    
##  1st Qu.:-0.970     1st Qu.:-0.970     1st Qu.:-0.962    
##  Median :-0.730     Median :-0.814     Median :-0.791    
##  Mean   :-0.637     Mean   :-0.677     Mean   :-0.604    
##  3rd Qu.:-0.339     3rd Qu.:-0.446     3rd Qu.:-0.264    
##  Max.   : 0.475     Max.   : 0.329     Max.   : 0.492    
##  fBodyGyro.std...X fBodyGyro.std...Y fBodyGyro.std...Z fBodyAccMag.mean..
##  Min.   :-0.995    Min.   :-0.994    Min.   :-0.987    Min.   :-0.987    
##  1st Qu.:-0.975    1st Qu.:-0.960    1st Qu.:-0.964    1st Qu.:-0.956    
##  Median :-0.809    Median :-0.796    Median :-0.822    Median :-0.670    
##  Mean   :-0.711    Mean   :-0.645    Mean   :-0.658    Mean   :-0.536    
##  3rd Qu.:-0.481    3rd Qu.:-0.415    3rd Qu.:-0.392    3rd Qu.:-0.162    
##  Max.   : 0.197    Max.   : 0.646    Max.   : 0.522    Max.   : 0.587    
##  fBodyAccMag.std.. fBodyBodyAccJerkMag.mean.. fBodyBodyAccJerkMag.std..
##  Min.   :-0.988    Min.   :-0.994             Min.   :-0.994           
##  1st Qu.:-0.945    1st Qu.:-0.977             1st Qu.:-0.975           
##  Median :-0.651    Median :-0.794             Median :-0.813           
##  Mean   :-0.621    Mean   :-0.576             Mean   :-0.599           
##  3rd Qu.:-0.365    3rd Qu.:-0.187             3rd Qu.:-0.267           
##  Max.   : 0.179    Max.   : 0.538             Max.   : 0.316           
##  fBodyBodyGyroMag.mean.. fBodyBodyGyroMag.std..
##  Min.   :-0.987          Min.   :-0.982        
##  1st Qu.:-0.962          1st Qu.:-0.949        
##  Median :-0.766          Median :-0.773        
##  Mean   :-0.667          Mean   :-0.672        
##  3rd Qu.:-0.409          3rd Qu.:-0.428        
##  Max.   : 0.204          Max.   : 0.237        
##  fBodyBodyGyroJerkMag.mean.. fBodyBodyGyroJerkMag.std..
##  Min.   :-0.998              Min.   :-0.998            
##  1st Qu.:-0.981              1st Qu.:-0.980            
##  Median :-0.878              Median :-0.894            
##  Mean   :-0.756              Mean   :-0.771            
##  3rd Qu.:-0.583              3rd Qu.:-0.608            
##  Max.   : 0.147              Max.   : 0.288
```

## Source Data
The raw data is from a study into Human Activity Recognition using Smartphones, which is part of an emerging field of
study into *wearable computing*. The raw dataset is from the **UCI Machine 
Learning Repository** (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones),
where a full description of the experiment and dataset are available. Below is a 
brief description of the raw dataset, as described by Reyes-Ortiz, Anguita, Ghio and Oneto
at the above website:

### Description of the Dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

(Reyes-Ortiz, Anguita, Ghio and Oneto. UCI Machine Learning Repository. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, (accessed 21 June 2014))



-------------------------------------------------------------------------------

## Preparation

Load required libraries

```r
library(sqldf)
library(plyr)
```

Set the working directory and extract the raw data

```r
setwd("C:/DataSciToolkit/DataScienceToolkit/GetCleanData/CleaningData")
unzip("getdata-projectfiles-UCI HAR Dataset.zip")
```

-------------------------------------------------------------------------------

## [1, 2] Merge the Test and Training datasets

The goal is to produce a single, tidy dataset with the average of each variable for each activity and each subject.
For the purposes of this assignment, we do not distinguish between the test and the training sets, so we will
combine these into one superset.

We need to combine 3 set of files to create the superset. The files are described below:

**X_train.txt, X_test.txt  (OBSERVATIONS) **  
These files hold the actual observations. There are 7352 observations, each of which is made up of 561 feature values.
The feature values are described in the file, **features.txt**, and are ordered as presented in this file.

**y_train.txt, y_test.txt  (ACTIVITIES)  **    
The observations were recorded while the subjects were performing certain activities. These activities are described
in the file, **activity_labels.txt**. For each observation in **X_train.txt, X_test.txt**, there is a corresponding
integer value, {1, 2, .., 6}, in **y_train.txt, y_test.txt**. These integer values map an activity name to each 
observation.

**subject_train.txt, subject_test.txt  (SUBJECTS)  **  
Like the mapping of ACTIVITIES to OBSERVATIONS, these subject files contain an series of 7352 integers that correspond
to a given subject. In this study, the subjects are only identified by this unique and anonymous SubjectID which we will
also use in the creation of our superset.

Below, the OBSERVATIONS, ACTIVITIES and SubJECTS are mapped onto one another to produce a superset containing one row
for each mapping of {SubjectID, ActivityName, OBSERVATIONS}.  
NOTE: that the OBSERVATIONS ar themselves a vector of length *n*, and that each element will be named according to the name
in the file, **features.txt**.  


```r
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
```

With the raw data read in, we now want to subset the observations to only those features related to mean() and std()

```r
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
```

Now that the OBSERVATIONS are suitably collated, we need to append the ACTIVITIES and SUBJECTS to create the superset


```r
# first we will column bind the activities and subjects to the observations
superset <- data.frame(subjects, activities, observations)
names(superset) <- c("SubjectID", "Activity", names(observations))

# now we will replace the activity integers with their corresponding names
superset$Activity <- sqldf("  SELECT lblA.label
                              FROM superset as sup
                                JOIN lbl_activity as lblA
                              WHERE sup.Activity = lblA.activityID
                          ")
```

Finally, we are to create a new tidy dataset that is the average of each activity for each subject.


```r
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
# I tried so many things before I found ddply. This is amazing, and quick!

# Finally, for clarity I will replace the ActivityIDs with ActivityLabels once more
tmp <- sqldf("  SELECT lblA.label
                FROM tidy as t
                  JOIN lbl_activity as lblA
                WHERE t.Activity = lblA.activityID
            ")

tidy$Activity <- as.character(tmp[[1]])

# and lastly, write out the results
write.table(tidy, "human_activity_data.txt")
```

I spent so long on this final part. Probably spent 4 hours on the whole assignment, with 3 of them being on this last question. It took me a very very long time to figure out how to calculate the averages across the columns. 
- colMeans returned a data frame that was oriented the wrong way. 
- Writing a sqldf query was not practical due to the field names and the numebr of them
- had some wierd issues with the ActivityNames, they made life difficult which is why I reverted to using the integers
- finally hit upon ddply.

I have been avoiding some of the higher-level libraries like plyr because I want to really wrap my head around the more basic building blocks of R. But in this case, it was dead easy - once I stumbled on it, I had the solution in 5 minutes. Have learned a valuable lesson: *don't be too stubborn!*. 
