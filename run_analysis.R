# 1. Merges the training and the test sets to create one data set.
base_dir = "~/coursera/getting_cleaning_data/"
file_name = paste0(base_dir,"FUCI_HAR_Dataset.zip")
if (!file.exists(file_name)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", file_name)
}
data_dir_name = paste0(base_dir, "UCI\ HAR\ Dataset/")

if(!dir.exists(data_dir_name)) {
  unzip(file_name, exdir=base_dir)
}


train_X_file = paste0(data_dir_name, "train/X_train.txt")
test_X_file = paste0(data_dir_name, "test/X_test.txt")

train_y_file = paste0(data_dir_name, "train/y_train.txt")
test_y_file = paste0(data_dir_name, "test/y_test.txt")

test_df <- read.table(test_X_file, sep = "" , header = F, na.strings ="", stringsAsFactors= F)
train_df <- read.table(train_file, sep = "" , header = F, na.strings ="", stringsAsFactors= F)

# Add a column for the activity
test_y_df <- read.table(test_y_file, sep = "" , header = F, na.strings ="", stringsAsFactors= F)
test_df$Activity <- test_y_df$V1

train_y_df <- read.table(train_y_file, sep = "" , header = F, na.strings ="", stringsAsFactors= F)
train_df$Activity <- train_y_df$V1

merge_df <- merge(test_df, train_df, all=TRUE)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Get column names
feature_names_file <- paste0(data_dir_name, "features.txt")
names_df <- read.table(feature_names_file, sep=" ", header=F, stringsAsFactors= F)

names(merge_df) <- c(names_df$V2, "Activity_ID")

cols <- grep("-[Mm][Ee][Aa][Nn]|-[Ss][Tt][Dd]|Activity_ID", names(merge_df))
mean_std_df <- merge_df[, cols]
head(mean_std_df)

# 3. Uses descriptive activity names to name the activities in the data setc
activity_labels_file <- paste0(data_dir_name, "activity_labels.txt")
activity_labels_df <- read.table(activity_labels_file, sep=" ", header=F, stringsAsFactors= F)

names(activity_labels_df) <- c('Activity_ID', 'Activity_Label')

with_activity_df <- merge(mean_std_df, activity_labels_df, by = 'Activity_ID', all.x = TRUE, all.y = FALSE) %>% 
  select(-Activity_ID) %>% rename(Activity = Activity_Label)

# 4. Appropriately labels the data set with descriptive variable names.
# Replace - with _ and remove brackets, make lowercase
new_names <- tolower(gsub("\\(\\)","", gsub("-", "_", names(with_activity_df))))

# Replace std with standarddeviation and acc with acceleration
new_names <- gsub("acc","acceleration",gsub("std", "standarddeviation", new_names))
names(with_activity_df) <- new_names


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
summarized_df <- as.data.frame(with_activity_df %>% group_by(activity) %>% summarise_all(list(mean)))

output_file <- paste0(base_dir, "clean_UCI_HAR.txt")
# Write out the data
write.table(summarized_df, output_file, row.names = FALSE)
