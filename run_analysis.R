# 1. Merges the training and the test sets to create one data set.
file_name = "~/coursera/getting_cleaning_data/FUCI_HAR_Dataset.zip"
if (!file.exists(file_name)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", file_name)
}
data_dir_name = "~/coursera/getting_cleaning_data/UCI\ HAR\ Dataset/"
train_file = paste0(data_dir_name, "train/X_train.txt")
test_file = paste0(data_dir_name, "test/X_test.txt")

test_df <- read.table(test_file, sep = "" , header = F, na.strings ="", stringsAsFactors= F)
train_df <- read.table(train_file, sep = "" , header = F, na.strings ="", stringsAsFactors= F)

merge_df <- merge(test_df, train_df, all=TRUE)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Get column names
feature_names_file <- paste0(data_dir_name, "features.txt")
names_df <- read.table(feature_names_file, sep=" ", header=F, stringsAsFactors= F)

names(merge_df) <- names_df$V2
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.