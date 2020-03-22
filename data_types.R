#Data Types

#1. Variable names
library(dslabs)
data(heights)
names(heights)

#2. Numerical values
library(dslabs)
data(heights)
x <- heights$height
length(unique(x))

#3. Tables
library(dslabs)
data(heights)
x <- heights$height
tab <- table(x)
sum(tab == 1)

#4. Indicator variables
library(dslabs)
data(heights)
tab <- table(heights$height)
sum(tab == 1)

