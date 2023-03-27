#CSC302_HW2_Question2
#Scott Davidson
#032623

df = read.csv("/Users/scottdavidson1/Documents/00_School/00_U of M 2022-23/00_Winter/CSC302 Data Visualization/HW2/DATA/WorldCupMatches.csv", header = TRUE, sep = ',')

#A 
dim(df)
#B 
summary(df)
#C
library(dplyr)
n_distinct(df$City)
#D
mean(df$Attendance, na.rm=TRUE)
#E
aggregate(df$Home.Team.Goals, by=list(df$Home.Team.Name), FUN=sum)
#F Average annual attendance is trending up over the full range of years.
average_annual_attendance <- df %>% group_by(Year) %>% summarize(average_attendees = mean(Attendance))
average_annual_attendance
plot(average_annual_attendance, type="o", col="blue") 

