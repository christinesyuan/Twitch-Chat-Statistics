This project is intended to provide twitch streamers (or curious viewers) statistics of what is sent in their chat. The "Time" section provides a function to convert the CSV time values into a 00:00:00 format and graphs the distribution of messages throughout their stream. "Username and Colors" tallies the number of messages each user has sent, the average amount of messages users send, how many unique users participated, the most common colors of usernames, and how many unique colors there are. "Messages" splits each message into individual words; streamers can view the most sent words or find how many times a specified word was sent. 

Using www.twitchchatdownloader.com, you can obtain a CSV file of a VOD's chat, which we import into R as a data frame. 

Troubleshooting:
If experiencing trouble with your CSV file, your CSV file may contain messages with a comma or quotation marks. 
  If messages contain a comma, enclose the field with quotes.
    field,2 -> "field,2" 
  For quotes within a message, use double quotes "" instead of single quotes. 
    "Hi" -> ""Hi""

Non-ASCII letters (Chinese characters, unicode symbols) don't translate to LATEX if using R. One-offs like usernames can be manually edited. For repeated instances, knitting to HTML can bypass the error. 
