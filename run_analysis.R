loadData <- function(){
  labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("id", "label"))
  features <- read.table("UCI HAR Dataset/features.txt", col.names=c("index", "name"))
  
  joinSets <- function(X, Y, subject) {
    label <- merge(Y, labels, by.x="labelId", by.y="id")$label
    cbind(X, label, subject)
  }

  testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
  testX <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=features$name)
  testY <- read.table("UCI HAR Dataset/test/y_test.txt", col.names="labelId")
  
  trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")
  trainX <- read.table("UCI HAR Dataset/train/X_train.txt", col.names=features$name)
  trainY <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="labelId")
  
  test <- joinSets(testX, testY, testSubject)
  train <- joinSets(trainX, trainY, trainSubject)
  rbind(test, train)
}

filter <- function(x) {
  stdAndMean <- x[, grep("mean|std", names(x))]
  cbind(x[, c("subject", "label")], stdAndMean)
}

computeAverage <- function(x) {
  aggregate(x[, !names(x) %in% c("subject", "label")], by=list(subject=x$subject, label=x$label), FUN=mean)
}

writeFile <- function(x, filename) {
  write.table(x, filename, row.names = FALSE)
}

tidy <- computeAverage(filter(loadData()))
writeFile(tidy, "tidy.txt")
