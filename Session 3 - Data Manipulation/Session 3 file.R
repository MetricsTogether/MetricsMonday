### Metrics Mondays R File! ###

## February 6 2023 ##
# Objectives: Learn about each of the types and classes of R data, learn about subsetting and manipulating columns
library(readxl)

# read in data
data <- read_excel(path="Session 2 - Data Ingest/June2022.xls",skip=5)

# looking at types of data in our file
sapply(data,class)

# we want numeric sentence months!
as.numeric(data$`Sentence Months`)

# To manipulate other types of data, you can use these!
# as.character()
# as.Date()

data$`Sentence Months`[3]

data$`Sentence Months` <- as.numeric(data$`Sentence Months`)

# something a little more complicated
unique(data$`Sentence Years`)

#create a column that looks at people serving a "life" sentence or and SDP sentence 
data$`Special Sentence` <- ifelse(data$`Sentence Years` %in% c("LIFE","SDP"),data$`Sentence Years`,NA)

data$`Sentence Years` <- as.numeric(data$`Sentence Years`)


# Creating a column to see how old these people are today

data$`Age Today` <- difftime(time1 = Sys.time(), time2 = data$`Date of Birth`,units = "days")
# I'm annoyed because this is difftime variable (wut?) AND it's days? Who does that?
data$`Age Today` <- as.numeric(data$`Age Today`)
data$`Age Today` <- data$`Age Today`/365

summary(data$`Age Today`)

hist(data$`Age Today`)
