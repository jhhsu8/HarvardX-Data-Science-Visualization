#Exploring the gapminder dataset

#1. Life expectancy vs fertility - part 1
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder %>% filter(continent == "Africa" & year == "2012" ) %>%
  ggplot(aes(y= life_expectancy, x=fertility ))  + geom_point()
  geom_point()

#2. Life expectancy vs fertility - part 2 - coloring your plot
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)

gapminder %>% filter(continent == "Africa" & year == "2012") %>% ggplot(aes(y=life_expectancy, x=fertility, color=region)) + geom_point()

#3. Life expectancy vs fertility - part 3 - selecting country and region
library(dplyr)
library(dslabs)
data(gapminder)
df <- gapminder %>% filter(continent == "Africa" & year == "2012" & fertility <= 3 & life_expectancy >= 70) %>% select(country, region)

#4. Life expectancy and the Vietnam War - part 1
library(dplyr)
library(dslabs)
data(gapminder)
tab <- gapminder %>% filter(country %in% c("United States", "Vietnam") & year >= "1960" & year <= "2010")

#5. Life expectancy and the Vietnam War - part 2
tab <- gapminder %>% filter(country %in% c("United States", "Vietnam") & year >= "1960" & year <= "2010")
p <- tab %>% ggplot(aes(y=life_expectancy, x = year, color = country)) + geom_line()

#6. Life expectancy in Cambodia
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
p <- gapminder %>% filter(country == "Cambodia" & year >= "1960" & year <= "2010") %>% ggplot(aes(y=life_expectancy, x=year)) + geom_line()

#7. Dollars per day - part 1
library(dplyr)
library(dslabs)
data(gapminder)
daydollars <- gapminder %>% filter(continent == "Africa" & year == "2010" & !is.na(gdp)) %>% mutate(dollars_per_day = gdp/population/365)

#8. Dollars per day - part 2
daydollars %>% ggplot(aes(x=dollars_per_day, y=..count..)) + scale_x_continuous(trans="log2") + geom_density()

#9. Dollars per day - part 3 - multiple density plots
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
daydollars <- gapminder %>% filter(continent == "Africa" & year %in% c("1970","2010") & !is.na(gdp)) %>% 
mutate(dollars_per_day = gdp/population/365) %>% ggplot(aes(x=dollars_per_day, y=..count..)) + scale_x_continuous(trans="log2") + 
geom_density() + facet_grid(year ~ .)

#10. Dollars per day - part 4 - stacked density plot
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
daydollars <- gapminder %>% filter(continent == "Africa" & year %in% c("1970","2010") & !is.na(gdp)) %>% 
mutate(dollars_per_day = gdp/population/365) %>% ggplot(aes(x=dollars_per_day, y=..count.., fill=region)) + 
scale_x_continuous(trans="log2") + geom_density(bw = 0.5, position="stack") + facet_grid(year ~ .)

#11. Infant mortality scatter plot - part 1
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder_Africa_2010 <- gapminder %>% filter(continent == "Africa" & year == "2010" & !is.na(gdp)) %>% mutate(dollars_per_day = gdp/population/365) 
gapminder_Africa_2010 %>% ggplot(aes(x=dollars_per_day, y=infant_mortality, color=region)) + geom_point()

#12. Infant mortality scatter plot - part 2 - logarithmic axis
gapminder_Africa_2010 %>% ggplot(aes(x=dollars_per_day, y=infant_mortality, color=region)) + geom_point() + scale_x_continuous(trans="log2")

#13. Infant mortality scatter plot - part 3 - adding labels
gapminder_Africa_2010 %>% ggplot(aes(x=dollars_per_day, y=infant_mortality, color=region, label=country)) + 
geom_point() + scale_x_continuous(trans="log2") + geom_text()

#14. Infant mortality scatter plot - part 4 - comparison of scatter plots
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder_Africa_2010 <- gapminder %>% filter(continent == "Africa" & year %in% c("1970","2010") & !is.na(gdp) & !is.na(infant_mortality)) %>% 
mutate(dollars_per_day = gdp/population/365) %>% ggplot(aes(x=dollars_per_day, y=infant_mortality, color=region, label=country)) + 
scale_x_continuous(trans="log2") + geom_text() + facet_grid(year ~ .)
