features<-read.table("features.txt")
# find the feature with mean or std also save the lables for naming the coloumns later
idx<-grep("mean|std",as.character(features[,2]))
Table_Labels<-as.character(features[idx,2])

#reading data form test
test_x<-read.table("test/X_test.txt")
# selecting just mean and std
test_x<-test_x[,idx]


test_y<-read.table("test/y_test.txt")


subject_test<-read.table("test/subject_test.txt")


#binding all to one table for test data
test_table<-cbind(subject_test,test_y,test_x)




#reading data form test
train_x<-read.table("train/X_train.txt")
# selecting just mean and std
train_x<-train_x[,idx]


train_y<-read.table("train/y_train.txt")


subject_train<-read.table("train/subject_train.txt")


#binding all to one table for test data
train_table<-cbind(subject_train,train_y,train_x)



#mergeing two data to one table

Data_table<-rbind(train_table,test_table)

# naming the dataframe column
colnames(Data_table)[1]<-"subject"
colnames(Data_table)[2]<-"activity"
colnames(Data_table)[3:81]<-Table_Labels


#descriotive labling of activities
Data_table$activity[which(Data_table$activity==1)]="WALKING"
Data_table$activity[which(Data_table$activity==2)]="WALKING_UPSTAIRS"
Data_table$activity[which(Data_table$activity==3)]="WALKING_DOWNSTAIRS"
Data_table$activity[which(Data_table$activity==4)]="SITTING"
Data_table$activity[which(Data_table$activity==5)]="STANDING"
Data_table$activity[which(Data_table$activity==6)]="LAYING"


#remove duplicate column
Data_table <- Data_table[, !duplicated(colnames(Data_table))]

#the new data frame
library(dplyr)
x1<-group_by(Data_table,subject,activity)
New_Data_table<-summarise_each(x1,funs(mean))
write.table(New_Data_table,file="tidy.txt",row.name=FALSE)
