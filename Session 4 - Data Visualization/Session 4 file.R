### Metrics Mondays R File! ###

## February 14 2023 ##
# Objectives: Create a graph in base R, create a plot with ggplot2, explore new visualizations with esquisse, think about possibilities with Plotly
library(readxl)
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


## THE BEGINNING OF TODAY'S CODE! ###
hist(data$`Age Today`)

# line graph --good for continuous data

plot(x=data$`Current Admission Date`,y=data$`Projected Discharge Date3`)

#this plot is cute BUUUUT leaves something to be desired... like color or lines or anything

library(ggplot2)
#ggplot()+
# geom_MYPLOT(mapping=aes(x=,y=,size, facet, color))

ggplot(data) +
  geom_jitter(mapping=aes(x=`Current Admission Date`, y = `Projected Discharge Date3`,color=`Crime Class`))

# that was fun but alison messed up the code initially, why did she doe that?
#she's super lazy

library(esquisse)

esquisser(data)

randomrows <- sample(29256,75)
esquisser(data[randomrows,])


ggplot(data) +
  geom_point(mapping=aes(x=`Current Admission Date`, y = `Projected Discharge Date3`,color=`Crime Class`))
