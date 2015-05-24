#Getting and Cleaning Data Course Project!

##The Script (R)
* The script starts by reading the test file and the train files.
* Turns them into a data frame with rbind and cbind.
* Gets the feature list from the file and after subsetting to the mean and standard deviation, it subsets the dataset accordingly.
* Takes the activity labels and changes the meaningless numbers to the corresponding activities.
* Make a tidy dataset taking only the desired values.
* Writing out the tidy data.