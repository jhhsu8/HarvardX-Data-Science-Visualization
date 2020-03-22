#Summarizing with dplyr

#1. Blood pressure 1
library(dplyr)
library(NHANES)
data(NHANES)
tab <- NHANES %>% filter(Gender=="female" & AgeDecade == " 20-29")
print(tab)

#2. Blood pressure 2
library(dplyr)
library(NHANES)
data(NHANES)
ref <- NHANES %>% filter(AgeDecade == " 20-29" & Gender == "female") %>% 
summarize(average=mean(BPSysAve, na.rm=TRUE), standard_deviation = sd(BPSysAve, na.rm=TRUE))

#3. Summarizing averages
library(dplyr)
library(NHANES)
data(NHANES)
ref_avg <- NHANES %>%
  filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm=TRUE)) %>% .$average

#4. Min and max
library(dplyr)
library(NHANES)
data(NHANES)
NHANES %>% filter(AgeDecade == " 20-29"  & Gender == "female") %>% summarize(minbp=min(BPSysAve, na.rm=TRUE), maxbp=max(BPSysAve, na.rm=TRUE))

#5. group_by
library(dplyr)
library(NHANES)
data(NHANES)
NHANES %>%
      filter(Gender == "female") %>% group_by(AgeDecade) %>% summarize(average = mean(BPSysAve, na.rm=TRUE), standard_deviation = sd(BPSysAve, na.rm=TRUE))

#6. group_by example 2
library(dplyr)
library(NHANES)
data(NHANES)
NHANES %>% filter(Gender == "male") %>% group_by(AgeDecade) %>% summarize(average = mean(BPSysAve, na.rm = TRUE), standard_deviation=sd(BPSysAve,na.rm=TRUE))

#7. Arrange
library(dplyr)
library(NHANES)
data(NHANES)
NHANES %>% filter(Gender == "male", AgeDecade == " 40-49") %>% group_by(Race1) %>% summarize(average = mean(BPSysAve, na.rm=TRUE), standard_deviation = sd(BPSysAve, na.rm= TRUE)) %>% arrange(average)

