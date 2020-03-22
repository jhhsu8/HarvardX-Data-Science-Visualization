#Climate Change:

#Question 1
#Which of these code blocks return the latest year for which carbon emissions are reported?
library(tidyverse)
library(dslabs)
data(temp_carbon)
data(greenhouse_gases)
data(historic_co2)

temp_carbon %>%
    filter(!is.na(carbon_emissions)) %>%
    pull(year) %>%
    max()
 
temp_carbon %>%
    filter(!is.na(carbon_emissions)) %>%
    .$year %>%
    max()
 
temp_carbon %>%
    filter(!is.na(carbon_emissions)) %>%
    select(year) %>%
    max()

#Question 2
#Inspect the difference in carbon emissions in temp_carbon from the first available year to the last available year.
#What is the first year for which carbon emissions (carbon_emissions) data are available?
temp_carbon %>%
    filter(!is.na(carbon_emissions)) %>%
    select(year) %>%
    min()

#What is the last year for which carbon emissions data are availabletemp_carbon %>%
temp_carbon %>%
    filter(!is.na(carbon_emissions)) %>%
    select(year) %>%
    max()

#How many times larger were carbon emissions in the last year relative to the first year?
temp_carbon$carbon_emissions[temp_carbon$year == last_year]/temp_carbon$carbon_emissions[temp_carbon$year == first_year]

#Question 3
#Inspect the difference in temperature in temp_carbon from the first available year to the last available year.
#What is the first year for which global temperature anomaly (temp_anomaly) data are available?
first_year <-temp_carbon %>%
  filter(!is.na(temp_anomaly)) %>%
  select(year) %>%
  min()
 
#What is the last year for which global temperature anomaly data are available?
last_year <-temp_carbon %>%
  filter(!is.na(temp_anomaly)) %>%
  select(year) %>%
  max()
 
#How many degrees Celsius has temperature increased over the date range? Compare the temperatures in the most recent year versus the oldest year.
temp_carbon$temp_anomaly[temp_carbon$year == last_year] - temp_carbon$temp_anomaly[temp_carbon$year == first_year]

#Question 4
#Create a time series line plot of the temperature anomaly. Only include years where temperatures are reported. Save this plot to the object p.
p <- temp_carbon %>% filter(!is.na(year) & !is.na(temp_anomaly)) %>%
  ggplot() + geom_line(aes(year,temp_anomaly))

p <- p + geom_hline(aes(yintercept = 0), col = "blue")

#Question 5
#Change the y-axis label to be "Temperature anomaly (degrees C)". 
#Add a title, "Temperature anomaly relative to 20th century mean, 1880-2018". 
#Also add a text layer to the plot: the x-coordinate should be 2000, the y-coordinate should be 0.05, 
#the text should be "20th century mean", and the text color should be blue.
 
p + ylab("Temperature anomaly (degrees C)") +
    ggtitle("Temperature anomaly relative to 20th century mean, 1880-2018") +
    geom_text(aes(x = 2000, y = 0.05, label = "20th century mean"), col = "blue")

#Question 7
#Add layers to the previous plot to include line graphs of the temperature anomaly in the ocean (ocean_anomaly) and on land (land_anomaly). 
#Assign different colors to the lines. Compare the global temperature anomaly to the land temperature anomaly and ocean temperature anomaly.
temp_carbon %>% filter(!is.na(year) & !is.na(temp_anomaly)) %>%
  ggplot() + geom_line(aes(year,temp_anomaly), col="blue") + 
  geom_line(aes(year,ocean_anomaly), col="red") + 
  geom_line(aes(year,land_anomaly), col="green")+
  geom_hline(aes(yintercept = 0), col = "blue")  +
  ylab("Temperature anomaly (degrees C)") +
  ggtitle("Temperature anomaly relative to 20th century mean, 1880-2018") +
  geom_text(aes(x=2000,y=0.05, label = "20th century mean"), col="blue") 

#Question 8
#Make a line plot of concentration on the y-axis by year on the x-axis. Facet by gas, aligning the plots vertically so as to ease comparisons along the year axis. 
#Add a vertical line with an x-intercept at the year 1850, noting the unofficial start of the industrial revolution and widespread fossil fuel consumption. 
#Note that the units for ch4 and n2o are ppb while the units for co2 are ppm.

data(temp_carbon)
data(greenhouse_gases)
data(historic_co2)
library(scales)

greenhouse_gases %>%
    ggplot(aes(year, concentration)) +
    geom_line() +
    facet_grid(gas ~ ., scales = "free") +
    geom_vline(xintercept = 1850) +
    xlab("year") +
    ylab("Concentration (ch4/n2o ppb, co2 ppm)") +
    ggtitle("Atmospheric greenhouse gas concentration by year, 0-2000")

#Question 9
#Interpret the plot of greenhouse gases over time from the previous question. You will use each answer exactly once ch4, co2, n2o, all, none).
greenhouse_gases %>%
    ggplot(aes(year, concentration)) +
    geom_line() +
    facet_grid(gas ~ ., scales = "free") +
    geom_vline(xintercept = 1850) +
    xlab("year") +
    ylab("Concentration (ch4/n2o ppb, co2 ppm)") +
    ggtitle("Atmospheric greenhouse gas concentration by year, 0-2000")

#Question 10
#Make a time series line plot of carbon emissions (carbon_emissions) from the temp_carbon dataset. The y-axis is metric tons of carbon emitted per year.
temp_carbon %>% filter(!is.na(year) & !is.na(carbon_emissions)) %>%
  ggplot() + geom_line(aes(year,carbon_emissions), col="blue") + 
  scale_x_continuous(breaks = seq(min(temp_carbon$year), max(temp_carbon$year), by = 100)) +
    ylab("Carbon emissions (metric tons)") +
    ggtitle("Carbon emissions")

#Question 11
#Make a line plot of co2 concentration over time (year), coloring by the measurement source (source). Save this plot as co2_time for later use.
co2_time <- historic_co2 %>% filter(!is.na(co2) & !is.na(year)) %>%
  ggplot(aes(year,co2, col=source)) + geom_line() +
    ggtitle("CO2 concentration") +
    ylab("co2")
 
#Question 12
#One way to differentiate natural co2 oscillations from today's manmade co2 spike is by examining the rate of change of co2. The planet is affected not only by the absolute concentration of co2 but also by its rate of change. When the rate of change is slow, living and nonliving systems have time to adapt to new temperature and gas levels, but when the rate of change is fast, abrupt differences can overwhelm natural systems. How does the pace of natural co2 change differ from the current rate of change?
#Change the x-axis limits to -800,000 and -775,000. About how many years did it take for co2 to rise from 200 ppmv to its peak near 275 ppmv?
co2_time + xlim(-800000, -775000)

#Change the x-axis limits to -375,000 and -330,000. About how many years did it take for co2 to rise from the minimum of 180 ppm to its peak of 300 ppmv?
co2_time + xlim(-375000, -330000)

#Change the x-axis limits to -140,000 and -120,000. About how many years did it take for co2 to rise from 200 ppmv to its peak near 280 ppmv?
co2_time + xlim(-140000, -120000)

#Change the x-axis limits to -3000 and 2018 to investigate modern changes in co2. About how many years did it take for co2 to rise from its stable level around 275 ppmv to the current level of over 400 ppmv?
co2_time + xlim(-3000, 2018)
