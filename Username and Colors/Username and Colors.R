library("readr")
dataframe <- read_csv("insert_csv_file")

# 20 Most Frequent Chatters
usernames <- dataframe[, 2]
count_chat <- table(usernames)
sorted_chat_number <- rev(sort(count_chat))
head(sorted_chat_number, 20)

# Mean Chat Messages
mean_chat <- mean(count_chat)
mean_chat

# Unique Chatters
unique_usernames <- unique(usernames)
nrow(unique_usernames)

# 20 Most Used Colors
color <- dataframe[, 3]
sorted_color <- sort(table(color), decreasing = TRUE)
larger_color <- head(sorted_color, 20)
larger_color

pie(c(larger_color, nrow(usernames) - sum(larger_color)), labels = c(names(larger_color), "Other"), col = c(names(larger_color), "grey"), main = "Frequency of Username Colors Appearing in Chat")

# Unique Colors
unique_color <- table(unique(color))
sum(unique_color)