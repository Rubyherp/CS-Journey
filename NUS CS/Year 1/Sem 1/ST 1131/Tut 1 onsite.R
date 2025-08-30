
#28 AUG 2025

setwd("/Users/xiangnenghor/Desktop/NUS Computer Science/Year 1 Sem 1/ST 1131/Data")

final_marks = read.csv("final_marks.csv", header = TRUE); final_marks
names(final_marks)[1] = "ID"
names(final_marks)[2] = "Marks"
final_marks
mark = final_marks[,2]; mark
#Alternatively:
mark_alt = final_marks$Marks
mark_alt


head(mark)
tail (mark)
dim(mark) #Dimension of the data
length(mark) #students took the exam


#mean
mean(mark)
#median
median(mark)
#variance
var(mark)
#IQR
IQR(mark)
#Range
range(mark)

summaries = c(mean(mark), median(mark), median(mark), var(mark), IQR(mark), range(mark)); summaries


#Boxplot
#No need to change in to vector
box_plot_mark = boxplot(mark, col = "steelblue", ylab="Mark", main = "Boxplot of final marks" )

#YES THERE ARE OUTLIERS
median(mark)
which(mark<10)
abline(h = which(mark[mark<10]), col = "red")

#Histogram
hist_mark = hist(mark, prob = TRUE, col="red", ylab = "Probability", xlab = "Marks", main = "Histogram of marks")
