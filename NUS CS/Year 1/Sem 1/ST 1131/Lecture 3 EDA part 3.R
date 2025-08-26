
#26 AUG 2025 ST1131

#SET YOUR WORK DIRECTORY
setwd("C:/DATA1131")

#TOPIC2, PART 3

rm(list = ls())
lung = read.csv("lung_cancer.csv", header = TRUE)
lung
head(lung) #show first 6 rows of the DATAFRAME
#smoke: 1 = yes; 0 = No
#Gender: 1 = male; 0 = female
#Cance: 1 = yes; 0 = No
lung$Gender
length(lung$Gender) #Number of rows in the DATAFRAME excluding the header





########### FREQUENCY TABLE

freq_table = table(lung$Gender) #RETURN A FREQUENCY TABLE, BASICALLY JUST
# THE SUM OF EACH OF THE FREQUENCIES: 0/1
freq_table
prop.table(table(lung$Gender)) #RETURNS THE PROPORTION OF THE TABLE
prop.table(table(lung$Gender)) *100 #TO MAKE IT 100%





########### LABEL A CATEGORICAL VARIABLE
# CREATE A NEW VARIABLE
lung$Gender = ifelse(lung$Gender == "0", "Female", "Male")
lung$Gender
table(lung$Gender)
prop.table(table(lung$Gender))*100 #NOTICE THE CHANGE IN HEADER NAME





########### LABEL A CATEGORICAL VARIABLE, 
#BY DIRECTLY CHANGING LABELS OF THE ORIGINAL VARIABLE IN THE DATAFRAME

lung$Gender = factor(lung$Gender) #CONVERT THE VARIABLES 
# FROM INTEGERS TO CATEGORIES(OR FACTORS)
lung$Gender
levels(lung$Gender) #CHECK CURRENT NAME OF CATEGORIES/FACTORS
levels(lung$Gender) = c("Female","Male") # REPLACE ORIGINAL
# NAME OF THE FACTOR WITH "FEMALE", AND "MALE" WITH CONCAT
levels(lung$Gender) # NOTICE THE CHANGE IN FACTOR NAMES
lung$Gender
lung
table(lung$Gender)
prop.table(table(lung$Gender))*100
lung$Gender *5 # GENDERS ARE NO LONGER 0/1 INTEGERS, THEY ARE STINGS
# THUS THIS RETURNS AN ERROR





########## BAR PLOT

#FIRST, WE CONVERT DATAFRAME INTO A FREQUENCY TABLE
freq_table_bar = table(lung$Gender); freq_table_bar

#THEN WE CAN RUN BARPLOT
barplot(freq_table_bar)

#TO ADJUST ASTHETICS
barplot(freq_table_bar, ylab = "Frequency", xlab = "Gender", col = c(2,5), main = "Bar Plot of Gender" )

#OR INSTEAD OF SAVING FREQ_TALBLE_BAR, JUST TYPE IT
barplot(table(lung$Gender), ylab = "Frequency", xlab = "Gender", col = c(2,9), main = "Bar Plot of Genders")





########## ANOTHER WAY TO CREATE A BARPLOT (MORE ADVANCED - NOT NEEDED FOR ST1131)
count<-c(17066,14464,788,126,37); count
alcohol = c('0', '1', '2', '3-5', '6 or more'); alcohol
df = data.frame(alcohol, count); df #CREATING DATAFRAME
#CALLING GGPLOT LIBRARY
library(ggplot2)
#SET P TO GGPLOT FUNCTION
p = ggplot(data=df, aes(x=alcohol, y=count)) + geom_bar(stat="identity")
p #CALLING P





########### ADDING LABELS
ggplot(data=df, aes(x=alcohol, y=count)) + 
  geom_bar(stat="identity", fill="steelblue") +
  geom_text(aes(label=count), vjust=-0.3, size=3.5) +
  theme_minimal()
#LABEL = COUNT: LABELS ABOVE THE BARS ARE THE VALUES FROM
# THE COLUMN "COUNT"
# vjust TO LET THE COUNT NUMBERS APPEAR ABOVE THE BARS
# size TO SPECIFY THE TEXT SIZE OF THE NUMBERS




########## PIE CHART

#1. MAKE FREQUENCY TABLE
pie_freq = table(lung$Gender); pie_freq
#2. MAKE PIE CHART
pie(pie_freq, col = c(2,5), main = "Pie chart of Gender")





########### QUANTITATIVE VARIABLES


BMI = c(29.5,28.6,24.7, 28.8, 23.7, 23.3,28.8, 26.7, 23.6, 27.1, 24.5,20.7,28,24.7, 16.3,26,14,
        25.8,17.5,30.7,17.5,30.6, 29.7, 24.5,35,21.9,20.9,24.3,27.3, 26.5, 22,16.3, 30.1, 27.2)

#IN THIS CASE BMI IS ALREADY A VECTOR!!!!!
#SO WE DO NOT NEED TO CONVERT IT INTO A VECTOR/FREQUENCY TABLE
hist(BMI, col=3)
#CREATIVITY: MAKE Y-AXIS TO BE PROBABILITY INSTEAD OF FREQUENCY
hist(BMI, col=4, prob = TRUE, ylab = "Probability")





############ MIDTERM MARKS DATA

rm(list = ls())
data = read.csv("midterm_marks.csv"); data
# SHOW 2ND COLUMN ONLY
mark = data[,2];mark




############ summaries of results

# SUMMARIES MIN, 1ST QU, MEDIAN, 3RD QU, MAX
summary(mark)
# LENGTH OF THE VECTOR "MARK"
length(mark)

min(mark)
max(mark)
mean(mark)
median(mark)
#BOTTOM 40%
quantile(mark,0.4)
#BUT INPUT JUST QUNATILE(MARK) RETURNS 0,25,50,75,100 QU.
quantile(mark)
#INTERQUARTILE RANGE, 3RD QU - 1ST QU
IQR(mark)
#RANGE, SHOW MAX AND MIN
range(mark)
#VARIANCE S^2
var(mark)
#STANDARD DEVIATION S
sd(mark)

summaries = c(min(mark), max(mark), mean(mark), median(mark), quantile(mark,0.3), IQR(mark), range(mark), var(mark), sd(mark))
summaries




########### HISTOGRAM

hist(mark,
     col=7,
     prob = TRUE,
     xlab = "Midterm Marks",
     ylab = "Density",
     main = "Histogram of Midterm Marks")

#SELECTIVE: INPUT VECTOR OF MARK SUCH THAT MARK<30
hist(mark[mark<30],
     col=7,
     prob=TRUE,
     xlab = "Midterm Marks",
     ylab = "Density" ,
     main = "Histogram of Midterm Marks ")




########### BOX PLOT

mark
summary(mark)
boxplot.stats(mark) #NOTICE THE SIMILARITY 
# BTW BOXPLOT.STATS(MARK) AND SUMMARY

#MAKE A BOXPLOT
boxplot(mark) #MARK IS ALREADY A VECTOR

#AESTHETICS
boxplot(mark, ylab ="Midterm Marks", main = "Boxplot of Midterm marks", col =7)
#MARK THE MEDIAN WITH A HORIZONTAL LINE
abline(h = quantile(mark), col = "pink")
        



########### OUTLIERS

#MANUALLY ADD IN OUTLIERS BUT CONCATENATE IT INTO MARK
mark = c(mark,46); mark
boxplot(mark)
#MARKING THE MEDIAN HORIZONTAL LINE
abline(h = median(mark), col=2)
mark = c(mark, -10)
#ROW INDEXES OF WHICH MARK IS <0 OR >29
which(mark<0 | mark > 29)
#RETURNING THE VALUES OF THOSE INDEXES, I.E., OUTLIER MARKS
mark[which(mark<0 | mark>29)]
#RETURN OF ORIG
mark = data[,2]; mark



























