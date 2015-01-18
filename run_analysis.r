X_test<-read.table("test/X_test.txt")
X_train<-read.table("train/X_train.txt")
X_full<-rbind(X_test,X_train)
features<-read.table("features.txt")
m<-grep("mean", features[,2], ignore.case=T)
s<-grep("std", features[,2], ignore.case=T)
X_list<-append(m,s)
X_list<-sort(X_list)
X_trimmed<-X_full[,X_list]
#at this point I have the combined list, cut down to the columns I want
names(X_trimmed)<-features[X_list,2]
#at this point I have the combined list, cut down and with the names correct.  I still need to make the names cleaner.

subject_test<-read.table("test/subject_test.txt")
subject_train<-read.table("train/subject_train.txt")
subject_full<-rbind(subject_test,subject_train)

X_trimmed<-cbind(subject_full, X_trimmed)

Y_test<-read.table("test/Y_test.txt")
Y_train<-read.table("train/Y_train.txt")
Y_full<-rbind(Y_test,Y_train)

X_trimmed<-cbind(Y_full, X_trimmed)

activityLabels<-read.table("activity_labels.txt")

X_trimmed[1:nrow(X_trimmed),1]<-as.character(activityLabels[X_trimmed[1:nrow(X_trimmed),1],2])

varnames<-c("Activity"
            ,"Subject"
            ,"TimeDomainBodyAccelerationMeanX"
            ,"TimeDomainBodyAccelerationMeanY"
            ,"TimeDomainBodyAccelerationMeanZ"
            ,"TimeDomainBodyAccelerationStdX"
            ,"TimeDomainBodyAccelerationStdY"
            ,"TimeDomainBodyAccelerationStdZ"
            ,"TimeDomainGravityAccelerationMeanX"
            ,"TimeDomainGravityAccelerationMeanY"
            ,"TimeDomainGravityAccelerationMeanZ"
            ,"TimeDomainGravityAccelerationStdX"
            ,"TimeDomainGravityAccelerationStdY"
            ,"TimeDomainGravityAccelerationStdZ"
            ,"TimeDomainBodyAccelerationJerkMeanX"
            ,"TimeDomainBodyAccelerationJerkMeanY"
            ,"TimeDomainBodyAccelerationJerkMeanZ"
            ,"TimeDomainBodyAccelerationJerkStdX"
            ,"TimeDomainBodyAccelerationJerkStdY"
            ,"TimeDomainBodyAccelerationJerkStdZ"
            ,"TimeDomainBodyGyroMeanX"
            ,"TimeDomainBodyGyroMeanY"
            ,"TimeDomainBodyGyroMeanZ"
            ,"TimeDomainBodyGyroStdX"
            ,"TimeDomainBodyGyroStdY"
            ,"TimeDomainBodyGyroStdZ"
            ,"TimeDomainBodyGyroJerkMeanX"
            ,"TimeDomainBodyGyroJerkMeanY"
            ,"TimeDomainBodyGyroJerkMeanZ"
            ,"TimeDomainBodyGyroJerkStdX"
            ,"TimeDomainBodyGyroJerkStdY"
            ,"TimeDomainBodyGyroJerkStdZ"
            ,"TimeDomainBodyAccelerationMagMean"
            ,"TimeDomainBodyAccelerationMagStd"
            ,"TimeDomainGravityAccelerationMagMean"
            ,"TimeDomainGravityAccelerationMagStd"
            ,"TimeDomainBodyAccelerationJerkMagMean"
            ,"TimeDomainBodyAccelerationJerkMagStd"
            ,"TimeDomainBodyGyroMagMean"
            ,"TimeDomainBodyGyroMagStd"
            ,"TimeDomainBodyGyroJerkMagMean"
            ,"TimeDomainBodyGyroJerkMagStd"
            ,"FrequencyDomainBodyAccelerationMeanX"
            ,"FrequencyDomainBodyAccelerationMeanY"
            ,"FrequencyDomainBodyAccelerationMeanZ"
            ,"FrequencyDomainBodyAccelerationStdX"
            ,"FrequencyDomainBodyAccelerationStdY"
            ,"FrequencyDomainBodyAccelerationStdZ"
            ,"FrequencyDomainBodyAccelerationMeanFreqX"
            ,"FrequencyDomainBodyAccelerationMeanFreqY"
            ,"FrequencyDomainBodyAccelerationMeanFreqZ"
            ,"FrequencyDomainBodyAccelerationJerkMeanX"
            ,"FrequencyDomainBodyAccelerationJerkMeanY"
            ,"FrequencyDomainBodyAccelerationJerkMeanZ"
            ,"FrequencyDomainBodyAccelerationJerkStdX"
            ,"FrequencyDomainBodyAccelerationJerkStdY"
            ,"FrequencyDomainBodyAccelerationJerkStdZ"
            ,"FrequencyDomainBodyAccelerationJerkMeanFreqX"
            ,"FrequencyDomainBodyAccelerationJerkMeanFreqY"
            ,"FrequencyDomainBodyAccelerationJerkMeanFreqZ"
            ,"FrequencyDomainBodyGyroMeanX"
            ,"FrequencyDomainBodyGyroMeanY"
            ,"FrequencyDomainBodyGyroMeanZ"
            ,"FrequencyDomainBodyGyroStdX"
            ,"FrequencyDomainBodyGyroStdY"
            ,"FrequencyDomainBodyGyroStdZ"
            ,"FrequencyDomainBodyGyroMeanFreqX"
            ,"FrequencyDomainBodyGyroMeanFreqY"
            ,"FrequencyDomainBodyGyroMeanFreqZ"
            ,"FrequencyDomainBodyAccelerationMagMean"
            ,"FrequencyDomainBodyAccelerationMagStd"
            ,"FrequencyDomainBodyAccelerationMagMeanFreq"
            ,"FrequencyDomainBodyBodyAccelerationJerkMagMean"
            ,"FrequencyDomainBodyBodyAccelerationJerkMagStd"
            ,"FrequencyDomainBodyBodyAccelerationJerkMagMeanFreq"
            ,"FrequencyDomainBodyBodyGyroMagMean"
            ,"FrequencyDomainBodyBodyGyroMagStd"
            ,"FrequencyDomainBodyBodyGyroMagMeanFreq"
            ,"FrequencyDomainBodyBodyGyroJerkMagMean"
            ,"FrequencyDomainBodyBodyGyroJerkMagStd"
            ,"FrequencyDomainBodyBodyGyroJerkMagMeanFreq"
            ,"angleTimeDomainBodyAccelerationMeangravity"
            ,"angleTimeDomainBodyAccelerationJerkMeangravityMean"
            ,"angleTimeDomainBodyGyroMeangravityMean"
            ,"angleTimeDomainBodyGyroJerkMeangravityMean"
            ,"angleXgravityMean"
            ,"angleYgravityMean"
            ,"angleZgravityMean")

names(X_trimmed)<-varnames

subj<-unique(X_trimmed[,2]) #this captures each subject
subj<-sort(subj)
act<-unique(X_trimmed[,1]) #this captures each activity
act<-sort(act)

MiniList<-data.frame()
storedList<-data.frame()
for(j in act){
  for(i in subj){
    storedList<-X_trimmed[X_trimmed$Subject == i & X_trimmed$Activity == j,]
    storedList$Activity<-NULL
    columnAverages<-colMeans(storedList)
    columnAverages<-c(j,columnAverages)
    MiniList<-rbind(MiniList, as.numeric(columnAverages))
    MiniList[nrow(MiniList),1]<-j
    storedList<-NULL
    storedList<-data.frame()
  }
  names(MiniList)<-names(X_trimmed)
}

write.table(MiniList, "MiniList.txt", row.name=FALSE)
