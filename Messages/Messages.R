library("readr")
dataframe <- read_csv("insert_csv_file", show_col_types = FALSE)

messages <- dataframe[, 4]
unlisted_messages <- unlist(messages)
split_messages <- unlist(strsplit(unlisted_messages, split = " "))
table_messages <- table(split_messages)
sorted_messages <- rev(sort(table_messages))
sorted_messages[seq(1, 30)] # however many you want to see

sum(split_messages == "whatever text you want")