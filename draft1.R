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

prop.table(table(name.title))

titles <- unique(as.character(name.title))

train2 <- train %>%
  mutate(Mr=ifelse(str_detect(Name,pattern = titles[1]),1,0)) %>%
  mutate(Mrs=ifelse(str_detect(Name,pattern = titles[2]),1,0)) %>%
  mutate(Miss=ifelse(str_detect(Name,pattern = titles[3]),1,0)) %>%
  mutate(Master=ifelse(str_detect(Name,pattern = titles[4]),1,0)) %>%
  mutate(Don=ifelse(str_detect(Name,pattern = titles[5]),1,0)) %>%
  mutate(Rev=ifelse(str_detect(Name,pattern = titles[6]),1,0)) %>%
  mutate(Dr=ifelse(str_detect(Name,pattern = titles[7]),1,0)) %>%
  mutate(Mlle=ifelse(str_detect(Name,pattern = titles[8])|str_detect(Name,pattern = titles[13]),1,0)) %>%
  mutate(Ms=ifelse(str_detect(Name,pattern = titles[9]),1,0)) %>%
  mutate(Major=ifelse(str_detect(Name,pattern = titles[10]),1,0)) %>%
  mutate(Lady=ifelse(str_detect(Name,pattern = titles[11]),1,0)) %>%
  mutate(Sir=ifelse(str_detect(Name,pattern = titles[12]),1,0)) %>%
  mutate(Col=ifelse(str_detect(Name,pattern = titles[14]),1,0)) %>%
  mutate(Capt=ifelse(str_detect(Name,pattern = titles[15]),1,0)) %>%
  mutate(Countess=ifelse(str_detect(Name,pattern = titles[16]),1,0)) %>%
  mutate(Jonkheer=ifelse(str_detect(Name,pattern = titles[17]),1,0)) 
           
train3 <- train2 %>%
  mutate(Married = ifelse(Mr==1|Mrs==1,1,0)) %>%
  mutate(Unmarried = ifelse(Miss==1|Mlle==1|Master==1,1,0)) %>%
  mutate(Marital.unknown = ifelse(Married==0&Unmarried==0,1,0))

table(train3$Survived,train3$Married,labe)
