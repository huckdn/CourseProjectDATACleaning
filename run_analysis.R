## Test section part
testParticipants <- read.table("test/subject_test.txt")
testCategories <- read.table("test/y_test.txt")
testRawData <- read.table("test/X_test.txt")

colnames(testParticipants) <- "Participant"
colnames(testCategories) <- "Category"

fusedTest <- cbind(testParticipants,testCategories,testRawData)
###############################################################

##Train section part
trainParticipants <- read.table("train/subject_train.txt")
trainCategories <- read.table("train/y_train.txt")
trainRawData <- read.table("train/X_train.txt")

colnames(trainParticipants) <- "Participant"
colnames(trainCategories) <- "Category"

fusedTrain <- cbind(trainParticipants,trainCategories,trainRawData)
##################################################################

allFused <- rbind(fusedTest, fusedTrain)

##Feautres part
tableFeatures <- read.table("features.txt",stringsAsFactors=F,strip.white=T)
##selecting just the standard deviation and the mean.
selectedFeatures <- tableFeatures[grep("std()|mean\\()",tableFeatures$V2),]

##get activity labels
activityLabels <- read.table("activity_labels.txt",stringsAsFactors=F)

##skip the participants and the category
allFusedWithLabels <- allFused[,c(1,2,selectedFeatures$V1+2)]

allFusedWithLabels$Category <- activityLabels[allFusedWithLabels$Category,2]

##making observations about participants in each different category.
tidyDataSet <- aggregate(allFusedWithLabels[,3:ncol(allFusedWithLabels)],by=list(participant = allFusedWithLabels$Participant, 
                                                                                 category = allFusedWithLabels$Category),mean)

write.table(file = "tidyDataSet.txt" row.name=FALSE, x = tidyDataSet)

