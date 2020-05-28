
# Getting & Cleaning Data Course Project README

## Project Goal

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the data for the project:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and    each subject.


## Procedure

1. Download the data for the project using link above. Unzip and save the UCI HAR Dataset to a folder on your local drive.
2. Move the run_analysis.R file into the parent folder of the UCI HAR Dataset.
3. Open RStudio and set this parent folder as your working directory using `setwd()` command.
4. Run the .R file using `source("run_analysis.R")` command.
5. A new text file called `tidyDataSet.txt` will be created in your working directory.


## Notes

`run_analysis.R` requires `data.table` package to be installed. If you do not have this already installed please do so prior to running the file using the `install.packages("data.table")` command.

