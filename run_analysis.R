# tested under Win 7 - 32 bit

# set working directory
# setwd(#YOUR PATH HERE#)

#to do fast pivoting for second dataset
require(data.table)

#download and unzip the file to directory chosen above
if(!file.exists('UCI HAR Dataset')){
	url = "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(url, destfile = 'dataset.zip')
	unzip('dataset.zip')
}


#Load the X, subject and y datasets and binding them together
X_1 = read.table("UCI HAR Dataset/train/X_train.txt")
X_2 = read.table("UCI HAR Dataset/test/X_test.txt")
X = rbind(X_1, X_2)
rm(X_1,X_2)

y_1 = read.table("UCI HAR Dataset/train/y_train.txt")
y_2 = read.table("UCI HAR Dataset/test/y_test.txt")
y = rbind(y_1, y_2)
rm(y_1, y_2)

subj_1 = read.table("UCI HAR Dataset/train/subject_train.txt")
subj_2 = read.table("UCI HAR Dataset/test/subject_test.txt")
subj = rbind(subj_1, subj_2)
rm(subj_1, subj_2)
names(subj) = "subject"


# Load features & select only required once
features = read.table("UCI HAR Dataset/features.txt")
selected_features_ind = grep("mean\\(\\)|std\\(\\)",features$V2)

#update data
X = X[, selected_features_ind]
names(X) = features[selected_features_ind, 2]
#remove parentheses & expand names
names(X) = gsub("\\(|\\)", "", names(X))
names(X) = gsub("^t", "time-", names(X))
names(X) = gsub("^f", "freq-", names(X))
rm(features, selected_features_ind) 

#activity labels
activities = read.table("UCI HAR Dataset/activity_labels.txt")
y[,1] = activities[y[,1],2]
names(y) = "activities"
rm(activities)

#bind and save
clean_dataset_1 <- cbind(subj, y, X)
write.table(clean_dataset_1, "tidy_data.txt")
rm(X,y,subj)


#create second dataset
clean_dataset_temp = data.table(clean_dataset_1)
keys = names(clean_dataset_temp)[1:2]
setkeyv(clean_dataset_temp, keys)
clean_dataset_2 = clean_dataset_temp[, lapply(.SD, mean), by=key(clean_dataset_temp)]
write.table(clean_dataset_2, "tidy_data_aggr.txt")    
