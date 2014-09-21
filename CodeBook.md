# Code book

## Origin of data

The data int this dataset is based on [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Processing
The data was transformed in the following way:

 1. learning and testing datasets were merged,
 2. measurements of the mean and standard deviation were extracted,
 3. columns with subject ID (named `subject`) and activity label (named `label`) were added,
 4. average of each variable for each activity and each subject were computed.

See description of variables in the original data set for details.

## Sources
 1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012