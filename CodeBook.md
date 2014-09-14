---
title: "Code Book"

---

#Data Source

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Read Files

I started with reading of the following files :
Train Data X,Y and subjects
Test Data X,Y and subjects
Activites Labels

#Renaming Variable to prepare for Merging

* Title the variable in subject_train.txt and subject_test.txt --> "subject_no" 
* Title the variable in data_train_y.txt and data_test_y.txt --> "act_no" 
* Title the two variables in features.txt --> "feature_no" and "feature_name"
* Title the two variables in activities_label.txt --> "act_no" and "act_description"

#Merging

* Use Cbind to combine train_x, train_y,subjects
* Use Rbinf to combine teain and test data

#Name variables of Merged Data

Extract traget variables from fatures file to exclude only Means and standered deviation
 

