#Normal Distribution

#1. Proportions
library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
ind <- x > 69 & x <= 72
mean(ind)

#2. Averages and Standard Deviations
library(dslabs)
data(heights)
x <- heights$height[heights$sex=="Male"]
avg <- mean(x)
stdev <- sd(x)
pnorm(72, avg, stdev) - pnorm(69, avg, stdev)

#3. Approximations
library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
exact <- mean(x > 79 & x <= 81)
avg <- mean(x)
std <- sd(x)
approx <- pnorm(81, avg, std) - pnorm(79, avg, std)
exact/approx

#4. Seven footers and the NBA
# use pnorm to calculate the proportion over 7 feet (7*12 inches)
1 - pnorm(84, 69, 3)
#5. Estimating the number seven footers
p <- 1 - pnorm(84,69,3)
round(p * 10 ^9)
#6. How many seven footers are in the NBA?
p <- 1 - pnorm(84,69,3)
N <- round(p * 10 ^9)
10/N
#7. Lebron James' height
p <- 1 - pnorm(6*12+8, 69, 3)
N <- round(p * 10^9)
150/N

