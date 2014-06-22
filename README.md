CleaningData
============

Course Project for Getting and Cleaning Data, Coursera 2014


To run this analysis:
  1. make sure that the zip folder containing the UCI data is in the directory
  2. run_analysis.R

run_analysis.R will do the following:
  1. unzip the UCI data
  2. draw together all the data of interest into one data.frame
  3. calculate the required means by Activity and Subject
  4. write out the tidy dataset: human_activity_data.txt

You can read in the human_activity_data.txt from R, using: read.table("human_activity_data.txt")

A more thorough explanation and account of the process is given in the markdown file: analyse.md
