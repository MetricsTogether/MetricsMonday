### Metrics Mondays R File! ###

## February 1 2023 ##
# Objectives: read in text file, csv, excel, pdf. Understand different structures of data in R. Manipulating data structures. READING IN FROM APIS

#
## TEXT FILE ##
#cool shortcuts in R if you press ALT and - you get <- 
ICIP <- read.delim("ICIP.txt",skip = 5,skipNul = T)


## CSV FILE ##
seneca_grants <- read.csv("tnum_workaround.csv")

library(tidyverse)
seneca_grants_tidy <- read_csv("tnum_workaround.csv")


## EXCEL FILE ##
library(readxl)
restore_justice <- read_excel(path="June2022.xls",skip = 5)


## PDF FILE ##
library(pdftools)
fire_protection <- pdftools::pdf_text("FireProtection.pdf")

## learning about your files! ##
View(ICIP)
View(ICIP[ICIP$Aztec=="McKinley County",])

sapply(restore_justice,typeof)
sapply(restore_justice,class)

summary(restore_justice)
summary(ICIP)
