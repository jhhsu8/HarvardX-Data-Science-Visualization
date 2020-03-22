#Properties of Stars

#Load the stars data frame from dslabs.
library(tidyverse)
library(dslabs)
data(stars)
options(digits = 3) 

#Question 1
#What is the mean magnitude?
mean(stars$magnitude)
#What is the standard deviation of magnitude?
sd(stars$magnitude)
 
#Question 2
#Make a density plot of the magnitude.
stars %>% ggplot(aes(magnitude, y = ..count..)) + geom_density()

#Question 3
#Make the distribution of star temperature.
stars %>% ggplot(aes(temp)) + geom_histogram()

#Question 4
#Make a scatter plot of the data with temperature on the x-axis and magnitude on the y-axis and examine the relationship between the variables.
stars %>% ggplot(aes(temp, magnitude)) + geom_point()

#Questions 5, 6, 7, 8, 9
# Flip the y-axis and x-axis 
stars  %>% ggplot(aes(log10(temp), magnitude)) + scale_y_reverse() + scale_x_reverse() + geom_point() + 
  geom_text(aes(log10(temp), magnitude, label=star))

stars  %>% ggplot(aes(log10(temp), magnitude, col = type)) + scale_y_reverse() + scale_x_reverse() + geom_point() + 
  geom_text(aes(log10(temp), magnitude, label=star))

stars %>%
    ggplot(aes(log10(temp), magnitude, col = type)) + geom_point() +  scale_x_reverse() +  scale_y_reverse()
