#CSC302_HW2_Question3
#Scott Davidson
#032623

df = read.csv("/Users/scottdavidson1/Documents/00_School/00_U of M 2022-23/00_Winter/CSC302 Data Visualization/DATA/metabolite.csv", header = TRUE, sep = ',')
#(a) Find how many Alzheimers patients there are in the dataset.(Hint:Please refer to question 1)
str(df)
table(df$Label)
#(b) Determine the number of missing values for each column.(Hint:is.na())
colSums(is.na(df))
#(c) Remove the rows which has missing value for the Dopamine column and assign the result to a new data frame. (Hint: is.na( ) )
df1 = df[is.na(df['Dopamine']), ]
colSums(is.na(df1))
#(d) In the new data frame,replace the missing values in the c4-OH-Pro column with the median value of the same column. (Hint: there is median() function.)
df1$c4.OH.Pro[is.na(df1$c4.OH.Pro)]<-median(df1$c4.OH.Pro,na.rm=TRUE)
colSums(is.na(df1))
#(e) (Optional)Drop columns which have more than 25% missing values.
#(Hint:when you slice your data frame, you can use -c(.., ..., ...) where ... represent one column name)
df = df[,!sapply(df, function(x) mean(is.na(x)))>0.25]
colnames(df)
