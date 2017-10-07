library(readr)
library(ggplot2)
library(dplyr)
library(stringr)

train <- read_csv("train.csv")
str(train)
View(train)

name.temp <- train$Name
name.title <- sapply(train$Name, FUN=function(x) {strsplit(x, split='[,.]')[[1]][2]})
table(name.title)

table(name.title)[,"table"]$name.title
prop.table(table(name.title))

titles <- unique(as.character(name.title))

train2 <- train %>%
  mutate(Mr=ifelse(str_detect(Name,pattern = titles[1]),1,0)) %>%
  mutate(Mrs=ifelse(str_detect(Name,pattern = titles[2],1,0)) %>%
  