As per the course project description:<BR>
The purpose of this project is to demonstrate one's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. <BR><BR>

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. This is where the data was obtained.<BR><BR>

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones <BR><BR>

The data from the project was a zip file from: <BR><BR>

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip <BR><BR>

run_analysis.R has step by step notes in the file, but the overall function and work flow is as follows:<BR><BR>

1) Obtained the data from the web to analyze<br>
2) Unzipped the file in order to get relevant files to analyze and merge<BR>
3) Taking the individual files and putting their data into tables (used read.table function)<br>
4) Merged mutual data sets using the rbind function<br>
5) Replaced some of the numeric data with it's relevant labels from supporting files (used merge, colnames, and selected new data set with just names)<br>
6) Assigned variable names to each data set for clarity using names function<br>
7) Combined new rbinded and labeled data using the cbind function<br>
8) Isolated Mean and Standard deviation by isolating data with the labels of "mean" and "std" in their field<br>
9) Combined that isolated data with other data<br>
10) Relabeled columns with more descriptive names using pattern and replacement function gsub along with names<br>
11) Created a tidy data set with averaging each variable using aggregate function<br>
12) Finally wrote the data to a file using write.table per assignment instructions.

