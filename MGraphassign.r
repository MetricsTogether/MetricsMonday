
library(tidyverse)
library(esquisse)
library(readxl)


#Assignment #1
dataas <- read_excel("C:/Users/unisr/Documents/MMAS.xlsx",skip=5)
sapply(data,class)
as.numeric(dataas$`Sentence Months`)
dataas$`Sentence Months`[3]
unique(dataas$`Sentence Years`)
dataas$`Special Sentence` <- ifelse(dataas$`Sentence Years` %in% c("LIFE","SDP"),dataas$`Sentence Years`,NA)
dataas$`Sentence Years` <- as.numeric(dataas$`Sentence Years`)

dataas$`Age Today` <- difftime(time1 = Sys.time(), time2 = dataas$`Date of Birth`,units = "days")
dataas$`Age Today` <- as.numeric(dataas$`Age Today`)
dataas$`Age Today` <- dataas$`Age Today`/365

summary(dataas$`Age Today`)
hist(dataas$`Age Today`)

dataas$`Age Sentenced` <- difftime(time1 = dataas$`Sentence Date`, time2= dataas$`Date of Birth`,units = "days" )
dataas$`Age Sentenced` <-as.numeric(dataas$`Age Sentenced`)
dataas$`Age Sentenced` <-dataas$`Age Sentenced`/365

summary(dataas$`Age Sentenced`)
hist(dataas$`Age Sentenced`)

dataas$`Age Custody` <- difftime(time1 =dataas$`Custody Date`,time2 = dataas$`Date of Birth`,units = "days" )
dataas$`Age Custody` <- as.numeric(dataas$`Age Custody`)
dataas$`Age Custody` <- dataas$`Age Custody`/365

summary(dataas$`Age Custody`)
hist(dataas$`Age Custody`)


#Assignment #2
dataas[1:25]



#assignment #3

library(dplyr)

plot(x=dataas$`Current Admission Date`,y=dataas$`Projected Discharge Date3`)


plot(x=dataas$``,y=dataas$``)

esquisser(dataas)

randorows <- sample(24,75)

library(ggplot2)
ggplot(dataas, aes(x='Current Admission Date', y= 'Projected Discharge Date3')) +
  geom_bar(stat='identity')

ggplot(dataas) +
  geom_histogram(mapping = aes(x = 'Race', y = 'Sentence Years'))

ggplot(dataas) + 
  geom_bar(mapping = aes(x = 'Sentence Years', y = 'Age Today'))

# wanted to see the relationship between race and sentence years 



