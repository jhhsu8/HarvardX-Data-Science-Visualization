#Introduction to ggplot2

#1. ggplot2 basics
library(dplyr)
library(ggplot2)
library(dslabs)
data(heights)
data(murders)
p <- ggplot(murders)
class(p)

#2. Pipes
data(heights)
heights %>% ggplot()

#3. geom_point 1
murders %>% ggplot(aes(x =population, y = total )) + geom_point()

#4. geom_point 2
murders %>% ggplot(aes(x=total, y=population)) + geom_point()

#5. geom_point text
library(dplyr)
library(ggplot2)
library(dslabs)
data(murders)
murders %>% ggplot(aes(population, total, label= abb)) + geom_label()

#6. geom_point colors 2
murders %>% ggplot(aes(population, total,label= abb)) + geom_label(color="blue")

#7. geom_label colors
murders %>% ggplot(aes(population, total, label = abb, color= region)) + geom_label()

#8. Log-scale
p <- murders %>% ggplot(aes(population, total, label = abb, color = region)) + geom_label()
p + scale_x_log10() + scale_y_log10()

#9. Titles
p <- murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()
p + scale_x_log10() + 
    scale_y_log10() + ggtitle("Gun murder data")

#10. A second example
p <- heights %>% ggplot(aes(x=height))

#11. Histograms 2
p <- heights %>% 
  ggplot(aes(height))
p + geom_histogram()

#12. Histogram binwidth
p <- heights %>% 
  ggplot(aes(height))
p + geom_histogram(binwidth = 1)

#13. Smooth density plot
heights %>% ggplot(aes(height)) + geom_density()

#14. Two smooth density plots
heights %>% 
  ggplot(aes(height, group = sex)) + geom_density()

#15. Two smooth density plots 2
heights %>% 
  ggplot(aes(height, group = sex, color = sex)) + geom_density()

#16. Two smooth density plots 3
heights %>% ggplot(aes(height, fill = sex)) +
geom_density(alpha = 0.2)

