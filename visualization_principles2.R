#Data Visualization Principles - Part 2

#1. Customizing plots - watch and learn
library(dplyr)
library(ggplot2)
library(dslabs)

dat <- us_contagious_diseases %>%
filter(year == 1967 & disease=="Measles" & !is.na(population)) %>% mutate(rate = count / population * 10000 * 52 / weeks_reporting)
state <- reorder(dat$state, dat$rate)
rate <- dat$count/(dat$population/10000) * (52/dat$weeks_reporting)
levels(state)
rate <- dat$count/(dat$population/10000)*(52/dat$weeks_reporting)

#2. Customizing plots - redefining
library(dplyr)
library(ggplot2)
library(dslabs)
data(us_contagious_diseases)
dat <- us_contagious_diseases %>% filter(year == 1967 & disease=="Measles" & count>0 & !is.na(population)) %>%
  mutate(rate = count / population * 10000 * 52 / weeks_reporting)
  dat$state <-reorder(dat$state, dat$rate)
dat %>% ggplot(aes(state, rate)) +
  geom_bar(stat="identity") +
  coord_flip()

#3. Making a box plot
library(dplyr)
library(ggplot2)
library(dslabs)
data("murders")
p <- murders %>% mutate(rate = total/population*100000)
p %>% mutate(region = reorder(region, rate, FUN = median)) %>% ggplot(aes(x=region, y=rate)) + geom_point() + geom_boxplot()

