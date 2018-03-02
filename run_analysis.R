##Read activity and feateruse tables
activ_t <- read.table('activity_labels.txt')
colnames(activ_t) <- c('ActivityId','ActivityType')
feat_t <- read.table('features.txt')

## Cleaning of new dataset names in feat_t datasets
feat_tb<- gsub('-mean', 'Mean',feat_t[,2])
feat_tb<- gsub('-std', 'Std', feat_t[,2])
feat_tb<- gsub('[()-]', '', feat_t[ ,2])



##Read train datasets
train <- read.table('train/X_train.txt')
train_subject <- read.table('train/subject_train.txt')
train_activities <- read.table('train/y_train.txt')

##Give coloumn names
colnames(train) <- feat_tb 
colnames(train_activities) <-"ActivityId"
colnames(train_subject) <- "SubjectId"

train_full <- cbind(  train_activities, train_subject, train)

##Read test datasets and merge in one dataset
test <- read.table('test/X_test.txt')
test_subject <- read.table('test/subject_test.txt')
test_activities <- read.table('test/y_test.txt')

##Give coloumn names
colnames(test) <- feat_tb
colnames(test_activities) <-"ActivityId"
colnames(test_subject) <- "SubjectId"

test_full<- cbind(  test_activities, test_subject,test)

##Merge train and test data set

final_data <- rbind(test_full, train_full)

##Extract only mean and std in names
col_names_all <- colnames(final_data)


std_mean_names <- (grepl('ActivityId', col_names_all)|
              grepl('SubjectId', col_names_all) |
              grepl('mean..', col_names_all)|
              grepl('std..', col_names_all) )




##Extract only mean and std variables
all_named_data <- final_data[, std_mean_names == TRUE]
 


##Merge with activity labels
merged_data <- merge( activ_t, all_named_data, by = 'ActivityId', all.y= TRUE)

## Creating a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <-  merged_data %>%
              group_by(ActivityId, SubjectId) %>%
              summarise_each(funs(mean))
##Writing tidy dataset in txt file
write.table(tidy_data, 'tidy_data.txt', row.names = FALSE)
