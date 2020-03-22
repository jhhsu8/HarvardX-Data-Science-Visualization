#Robust Summaries with Outliers

#1. Exploring the Galton Dataset - Average and Median
library(HistData)
data(Galton)
x <- Galton$child
mean(x)
median(x)

#2. Exploring the Galton Dataset - SD and MAD
library(HistData)
data(Galton)
x <- Galton$child
sd(x)
mad(x)

#3. Error impact on average
library(HistData)
data(Galton)
x <- Galton$child
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
mean(x_with_error) - mean(x)

#4. Error impact on SD
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
sd(x_with_error) - sd(x)

#5. Error impact on median
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
median(x_with_error) - median(x)

#6. Error impact on MAD
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
mad(x_with_error) - mad(x)
x_with_error

#7. Using EDA to explore changes
x <- Galton$child
error_avg <- function(k){
x[1] <- k
return(mean(x))
}
error_avg(10000)
error_avg(-10000)

