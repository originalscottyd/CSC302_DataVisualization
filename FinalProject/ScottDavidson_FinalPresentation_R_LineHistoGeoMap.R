library(readxl)
library(tidyverse)
library(ggthemes)

housing <- read_excel("/Users/scottdavidson1/Documents/00_School/00_U of M 2022-23/00_Winter/CSC302 Data Visualization/Group Projects/Midterm Presentation/Housing Data workbook 2.xlsx", sheet = "DA_-_housing-price-data-0404201")
str(housing)

# Line Plot -Average sale price / years -ggplot
# Stat_summary calcs mean for each yr
ggplot(data = housing, aes(x = YrSold, y = SalePrice)) +
  stat_summary(
    fun = mean,
    geom = "point",
    shape = 23,
    size = 3,
    color = "black",
    fill = "#1f77b4"
  ) +
  geom_smooth(
    method = "loess",
    se = TRUE,
    color = "#1f77b4",
    linetype = "solid",
    fill = "lightblue",
    alpha = 0.3
  ) +
  coord_cartesian(ylim = c(162000, 198000)) +
  scale_y_continuous(labels = scales::comma) +#separates thousands
  labs(
    title = "Ames, IA: Average Sale Price 2006-2010",
    x = "",
    y = "Sale Price  (USD)"
  ) +
  theme_bw() +
  theme(
    panel.background = element_blank(),
    panel.grid.major = element_line(color = "gray90", size = 0.5),
    panel.grid.minor = element_blank(),
    text = element_text(size = 12),
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5, size = 10)
  )

##############################################################

# Plot 2: Histogram of sale price distribution -ggplot
p_hist <- ggplot(data = housing, aes(x = SalePrice)) +
  geom_histogram(aes(y = after_stat(count)), fill = "#1f77b4", color = "black", bins = 30) +
  scale_x_continuous(labels = scales::comma) +
  labs(title = "Ames, IA: Home Sale Price Distribution 2006-2010",
       x = "Sale Price",
       y = "Frequency") +
  theme_bw() +
  theme(panel.grid.major = element_line(color = "gray90", size = 0.5),
        panel.grid.minor = element_blank(),
        text = element_text(size = 12),
        plot.title = element_text(hjust = 0.5)) +
  geom_text(stat = 'bin', aes(y = after_stat(count), label = after_stat(count)), bins = 30, vjust = -0.5, size = 3) #show count centered above each bar

p_hist

###########################################

#Ames, Iowa map using leaflet
library(sf)
library(leaflet)
library(rnaturalearth)
library(tidyverse)
library(sp)

# State boundaries from rnaturalearth
us_states <- ne_states(country = "United States of America", returnclass = "sf")

# Filter Iowa
iowa <- us_states %>% filter(name == "Iowa")

# Ames, IA coordinates from Google
ames_loc <- data.frame(
  lat = 42.0308,
  lng = -93.6319
)

# Leaflet map instructions on rstudio.github
leaflet() %>%
  addTiles() %>%
  addPolygons(
    data = iowa,
    fillColor = "blue",
    fillOpacity = 0.2,
    color = "blue",
    weight = 5
  ) %>%
  addCircleMarkers(
    data = ames_loc,
    lat = ~lat,
    lng = ~lng,
    radius = 20,
    color = "blue",
    stroke = TRUE,
    weight = 1,
    fillOpacity = 0.3
  )


