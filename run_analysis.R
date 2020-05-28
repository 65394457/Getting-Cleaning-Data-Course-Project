## step 1: merge training & test set into one set
#
# there are 3 data sets in train and in test (subject, X, y)
# combine the 6 separate files into 3 files

trainingSubjects <- read.table("./train/subject_train.txt", header=FALSE)
xTraining <- read.table("./train/X_train.txt", header=FALSE)
yTraining <- read.table("./train/y_train.txt", header=FALSE)
testingSubjects <- read.table("./test/subject_test.txt", header=FALSE)
xTesting <- read.table("./test/X_test.txt", header=FALSE)
yTesting <- read.table("./test/y_test.txt", header=FALSE)

subjectData <- rbind(trainingSubjects, testingSubjects)
xData <- merge(xTraining, xTesting, all=TRUE)
yData <- rbind(yTraining, yTesting)

## step 2: extract mean & standard deviation for each measurement
#
# read the feature labels, find indexes of where -mean or -std is mentioned
# features gives (8*3 + 9)= 33 measurements so should be 66 indexes
# extract only these columns from xData

features <- read.table("features.txt", header=FALSE)
indexes <- grep("(mean|std)\\(\\)", features[ , 2])
extractedxData <- xData[ , indexes]

## step 3: use descriptive activity names to name the activities
#
# read in the activity labels & map to corresponding yData numbers

activities <- read.table("activity_labels.txt", header=FALSE)
yData[ ,1] <- activities[yData[ ,1], 2]

## step 4: label the data set with descriptive names
#
# label all of the columns in 3 datasets using lowerCamelCase convention

names(subjectData)[1] <- "subjectID"

labels <- as.character(features[indexes, 2])
labels <- gsub("^t","time",labels)
labels <- gsub("^f","frequencyDomainSignal",labels)
labels <- gsub("-mean","Mean",labels)
labels <- gsub("-std","StandardDeviation",labels)
labels <- gsub("Acc","Acceleration",labels)
labels <- gsub("Gyro","Gyroscope",labels)
labels <- gsub("Mag","Magnitude",labels)

names(extractedxData) <- labels

names(yData)[1] <- "activityName"

## Step 5: create second tidy data set with average of each variable for each activity and subject
#
# Group entire dataset by activity and subject
# aggregate function in R same as SQL group by

allData <- cbind(subjectData, yData, extractedxData)
allData2 <- aggregate(allData[ , -c(1,2)], by=list(allData$subjectID, allData$activityName), FUN=mean)

write.table(allData2, file = "tidyDataSet.txt", row.name=FALSE)