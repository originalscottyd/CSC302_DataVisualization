library(tidyverse)
library(ggplot2)
library(ggridges)
library(lubridate)
library(ggrepel)
library(colorspace)

folder_location='/Users/scottdavidson1/Documents/00_School/00_U of M 2022-23/00_Winter/CSC302 Data Visualization/HW4'
setwd(folder_location)
#source('/Volumes/GoogleDrive/My Drive/TEACHINGDrive/CSC302/R/themes.R')
#source('/Volumes/GoogleDrive/My Drive/TEACHINGDrive/CSC302/R/plot_grid.R')
#source('/Volumes/GoogleDrive/My Drive/TEACHINGDrive/CSC302/R/moving_average.R')
source('/Users/scottdavidson1/Documents/00_School/00_U of M 2022-23/00_Winter/CSC302 Data Visualization/R/Slides12Rscripts_Data/themes.R')
source('/Users/scottdavidson1/Documents/00_School/00_U of M 2022-23/00_Winter/CSC302 Data Visualization/R/Slides12Rscripts_Data/plot_grid.R')
source('/Users/scottdavidson1/Documents/00_School/00_U of M 2022-23/00_Winter/CSC302 Data Visualization/R/Slides12Rscripts_Data/moving_average.R')

#1
#load("change path to /preprint_growth.rda")
load("/Volumes/GoogleDrive-116793968377731534138/My Drive/DATA/preprint_growth.rda")

head(preprint_growth)
preprint_growth %>% filter(archive == "bioRxiv") %>%
  filter(count > 0) -> biorxiv_growth
preprints<-preprint_growth %>% filter(archive %in%
                                        c("bioRxiv", "arXiv q-bio", "PeerJ Preprints")) %>%filter(count > 0) %>%
  mutate(archive = factor(archive, levels = c("bioRxiv", "arXiv q-bio", "PeerJ Preprints")))

#Changed max date to 2016
preprints_final <- filter(preprints, date == ymd("2016-01-01"))
ggplot(preprints) +
  aes(date, count, color = archive, fill = archive) +
  geom_line(size = 1) +
  scale_y_continuous(
    limits = c(0, 600), expand = c(0, 0),
    name = "preprints / month",
    sec.axis = dup_axis( #this part is for the second y axis
      breaks = preprints_final$count, #and we use the counts to position our labels
      labels = c("arXivq-bio", "PeerJPreprints", "bioRxiv"),
      name = NULL)
  )+
  #Changed max date to 2016
  scale_x_date(name = "year",
               limits = c(min(biorxiv_growth$date), ymd("2016-01-01"))) +
  #Changed colors to RGB
  scale_color_manual(values = c("#FF0000", "#008000", "#0000FF"),
                     name = NULL) +
  theme(legend.position = "none")

 