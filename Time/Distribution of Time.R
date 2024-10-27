# Designed to be replicable with your own CSV files! 

library("readr")
dataframe <- read_csv("insert_csv_file")
library("ggplot2")

time_convert <- function(x) {
  minutes <- x %/% 60
  seconds <- x %% 60
  if (minutes > 60) { 
    hours <- minutes %/% 60
    minutes <- minutes %% 60
  }
  else {
    hours = "00"
  }
  if (minutes < 10) {
    minutes <- paste("0", minutes, sep = "")
  }
  if (seconds < 10) {
    seconds <- paste("0", seconds, sep = "")
  }
  display <- paste(hours, minutes, seconds, sep = ":")
  display
}


ggplot(dataframe, aes(x = time)) + geom_histogram(bins = 24, color = "black", fill = "lightblue") + xlab("Time") + ylab("Frequency") + labs(title = "Distribution of Messages over Time") + theme_minimal()

ggplot(dataframe, aes(x = time)) + geom_density(alpha = 0.3, fill = "red") + xlab("Time") + ylab("Density") + labs(title = "Density of Messages over Time") + theme_minimal()
# to convert time into hourly form, you can use "+ scale_x_continuous(label = seq(0, insert_max_hour), breaks = seq(0, insert_max_time, 3600))"
