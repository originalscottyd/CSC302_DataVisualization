library(tidyverse)
library(lubridate)
library(ggplot2)

# Load the dataset
load("/Users/scottdavidson1/Documents/00_School/00_U of M 2022-23/00_Winter/CSC302 Data Visualization/R/Slides12Rscripts_Data/house_prices.rda")

# View the orignal dataset
head(house_prices)

# Reshape the dataset
house_prices %>%
  gather(key = measure, value = value, -c(house_price_index, date, state)) -> house_reshaped

# Analyze the reshaped dataset
head(house_reshaped)
# The "measure" column is new and contains unemploy_perc and house_price_perc column names, and 
# "value" is a new column also, which combines the values from the columns that were combined.

# Create the plot
ggplot(house_reshaped, aes(x = date, y = value, color = measure)) +
  geom_line() +
  facet_wrap(~ state) +
  scale_x_continuous(breaks = ymd(c("1980-01-01", "2000-01-01", "2020-01-01")), labels = c("80", "00", "20")) +
  labs(x = "Year", y = "Value", color = "Measurement") +
  theme_minimal()

