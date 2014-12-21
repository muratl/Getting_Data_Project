# Getting and Cleaning Data - Course Project

## Introduction
This repository contains the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.

## Raw data
Raw data used comes from THuman Activity Recognition Using Smartphones(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files
* A file "codeBook.md" describes the variables, the data, and any transformations or work that was performed to clean up the data.

* A script called run_analysis.R which will merge the test and training sets together in 5 steps:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* Prerequisites for this script:

  1. the UCI HAR Dataset must be extracted and..
  2. the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"
