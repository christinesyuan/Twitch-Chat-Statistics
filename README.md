This project is intended to provide twitch streamers (or curious viewers) statistics and sentiment analysis of what is sent in their chat. The "Time" section provides a function to convert the CSV time values into a 00:00:00 format and graphs the distribution of messages throughout their stream. "Username and Colors" tallies the number of messages each user has sent, the average amount of messages users send, how many unique users participated, the most common colors of usernames, and how many unique colors there are. "Messages" splits each message into individual words; streamers can view the most sent words or find how many times a specified word was sent. "Sentiment Analysis" uses tidytext's lexicons and a custom-made lexicon to graph the sentiment of the most sent words in a streamer's chat. Non-numeric and numeric plots are available, depending on the type of lexicon used. 

Each folder has a R file, which is designed for users to input their own data. An example R Markdown and PDF file are available as a sample. The first sample data is a Twitch VOD by streamer setsuko. The game played is Teamfight Tactics, the video is 11.5 hours long, and it contains 20,312 messages. The second sample data (used in sentiment analysis) is by streamer k3soju, another Teamfight Tactics streamer. The video is 17 hours long and contains 63,308 messages.

Troubleshooting:
If experiencing trouble with your CSV file, your CSV file may contain messages with a comma or quotation marks. 
- If messages contain a comma, enclose the field with quotes. (field,2 -> "field,2")
- For quotes within a message, use double quotes "" instead of single quotes. ("Hi" -> ""Hi"")

Non-ASCII letters (Chinese characters, unicode symbols) don't translate to LATEX if using R. One-offs like usernames can be manually edited. For repeated instances, knitting to HTML can bypass the error. 
