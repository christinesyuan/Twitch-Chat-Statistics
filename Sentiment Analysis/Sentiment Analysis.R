# Set Up 
library(readr)
library(tidytext)
library(textdata)
library(dplyr)
library(ggplot2)
library(ggnewscale)
dataframe <- read_csv("csv_file", show_col_types = FALSE)
messages <- dataframe[, 4]
unlisted_messages <- unlist(messages)
vector_split_messages <- unlist(strsplit(unlisted_messages, split = " "))
split_messages <- data.frame(vector_split_messages)
names(split_messages) <- "Word"

# Non-numeric Sentiment Analysis (nrc, loughran, bing)

# Custom Lexicon
choice_sentiment <- get_sentiments(lexicon = "your_choice") # options in this library are afinn (number value), nrc (largest character value dataset), bing, loughran
choice_lexicon <- data.frame("Word" = choice_sentiment$word, "Sentiment" = choice_sentiment$sentiment)
choice_lexicon <- choice_lexicon[choice_lexicon$Sentiment == "positive" | choice_lexicon$Sentiment == "negative", ]  # in this case, i don't want other values like "embarrassment" or "anger"

choice_twitch_words <- c("your choice words")
choice_twitch_words_sentiment <- c("your choice sentiment")
choice_twitch_lexicon <- data.frame("Word" = choice_twitch_words, "Sentiment" = choice_twitch_words_sentiment)

# Join with sentiment lexicon to assign words to sentiment
new_lexicon <- rbind(choice_lexicon, choice_twitch_lexicon) # your new lexicon
choice_sentiment <- split_messages %>%
  inner_join(new_lexicon, by = "Word") %>%
  count(Word, Sentiment, sort = TRUE) %>%
  ungroup()

filter_choice_sentiment <- choice_sentiment[choice_sentiment$n >= 100, ] # to lessen the words on the graph

# Plot
filter_choice_sentiment %>%
  ggplot(aes(x = factor(Word), y = n, fill = Sentiment)) +
  geom_col(position = "dodge", color = "black", linewidth = 0.2) +
  labs(title = "Your Sentiment Analysis", x = "Text ID", y = "Count") +
  scale_fill_manual(values = c("positive" = "green", "negative" = "red", "movement emote" = "orange", "laugh at" = "blue", "positive emote" = "pink", "negative emote" = "skyblue")) +
  theme_minimal() +
  theme(text = element_text(size = 7),
        axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0))

# Numeric Sentiment Analysis (afinn)

# Custom Lexicon
afinn_sentiment <- get_sentiments(lexicon = "afinn")
afinn_lexicon <- data.frame("Word" = afinn_sentiment$word, "Sentiment" = afinn_sentiment$value)

afinn_twitch_words <- c("your choice words")
afinn_twitch_words_sentiment <- c("sentiment values of your words")
afinn_twitch_lexicon <- data.frame("Word" = afinn_twitch_words, "Sentiment" = afinn_twitch_words_sentiment)

afinn_new_lexicon <- rbind(afinn_lexicon, afinn_twitch_lexicon)

# Join with sentiment lexicon to assign words to sentiment
afinn_sentiment <- split_messages %>%
  inner_join(afinn_new_lexicon, by = "Word") %>%
  count(Word, Sentiment, sort = TRUE) %>%
  ungroup()

filter_afinn_sentiment <- afinn_sentiment[afinn_sentiment$n >= 125, ] # filter
filter_afinn_sentiment$Sentiment[filter_afinn_sentiment$Word == "no"] <- -4

# Plot
filter_afinn_sentiment %>%
  ggplot(mapping = aes(x = Word, y = Sentiment, fill = n)) +
  geom_col(color = "black", linewidth = 0.2) +
  theme_minimal() +
  theme(text = element_text(size = 7),
        axis.text.x = element_text(angle = 90, hjust = 1, vjust = -0.2)) +
  scale_y_continuous(label = seq(-5, 5), breaks = seq(-5, 5)) +
  labs(title = "Afinn Sentiment Analysis", x = "Text ID", y = "Sentiment Value", fill = "Frequency") +
  scale_fill_gradient(low = "white", high = "purple") 
