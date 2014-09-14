#Read Train Data X,Y and subjects
data_train_x<-read.table("UCI HAR Dataset/train/X_train.txt")
data_train_y<-read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train)<-c("subject_no")
names(data_train_y)<-c("act_no")

#Read Test Data X,Y and subjects
data_test_x<-read.table("UCI HAR Dataset/test/X_test.txt")
data_test_y<-read.table("UCI HAR Dataset/test/Y_test.txt")
names(data_test_y)<-c("act_no")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test)<-c("subject_no")

#Merge x,y and subjects for train and test data
train=cbind(data_train_x,data_train_y,subject_train)
test=cbind(data_test_x,data_test_y,subject_test)
all_data<-rbind(train,test)

#Read Activites Label
activities_label<- read.table("UCI HAR Dataset/activity_labels.txt")
names(activities_label)<-c("act_no","act_description")

#Assign activity labels with data 
all_data<-merge(all_data,activities_label,by="act_no",all.x = T,sort = F)

#Read Features
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
target_col <- grep(".*[Mm]ean.*|.*[Ss]td.*", features[,2])
features <- features[target_col,]
names(features)<-c("feature_no","feature_name")

# Extract Target features
target_col<-c(target_col,562,563,564)
all_data <- all_data[,c(target_col)]
names(all_data)[2:87]<-as.character(features[,2])
all_data[,1]<-NULL

# Mean for each variable
tidy<-aggregate(. ~ ( subject_no + act_description ) ,all_data,mean)


#fining Names of variables

names(tidy) <- gsub("\\(\\)", "", names(tidy)) 
names(tidy) <- gsub("mean", "Mean", names(tidy)) 
names(tidy) <- gsub("std", "Std", names(tidy)) 
names(tidy) <- gsub("-", "", names(tidy)) 


write.table(tidy,"tidy_data.txt",row.names=F)


