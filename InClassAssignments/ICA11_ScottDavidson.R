#ICA11_ScottDavidson
#CSC302_DrBisgin

library(ggplot2)
library(tidyr)
library(dplyr)

flights=read.csv('/Volumes/GoogleDrive-116793968377731534138/My Drive/DATA/flights.csv')
head(flights)
p1<-ggplot(data=flights)+geom_line(aes(x=year, y=passengers, color=month)) +theme_bw()
show(p1)
                                   