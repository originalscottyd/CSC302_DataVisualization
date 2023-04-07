#CSC302_HW2_Question1
#Scott Davidson
#032623

#1. Run the following lines and study how they work.Then state what they do and output for us.(20Points)

#This creates the df1 data frame with three columns Name, State and Sales.
df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))
df1 #I added this to show df1
aggregate(df1$Sales, by=list(df1$State), FUN=sum) #Use aggregate function to sum sales for each state.

library(dplyr) #load the dplyr package 
df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales)) # use dplyr and group_by instead of aggregate function to sum sales for each state. 
