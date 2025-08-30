
#ST1131 TUTORIAL 1, 28 AUG 2025
#UPDATED ON 30 AUG 2025

setwd("c:/DATA1131")

#
#
#
#
#

#Q1a
patient = c(1,2,3,4,5,6,7,8,9)
bp = c(96,119,119,108,126,128,110,105,94)

#sorted patient and bp
spatient = c(9,1,8,4,7,2,3,5,6)
sbp = c(94,96,105,108,110,119,119,126,128)
#or for sbp
sort(bp)
data = data.frame(spatient,sbp);data

#my median = 110
median(data$sbp) 
#YES, They are the same


#Q1b
#mean
mean(data$sbp) # == 111.6667 mmHg

#var
var(data$sbp) # == 149.75 mmHg^2

#sd
sd(data$sbp) # == 12.23724 mmHg


#Q1c
#If the measurement machine was not zero-ed, and all readings reduced by 
#10 mmHg, the mean WILL DECREASE BY 10 mmHg. However, Variance remain unchanged
# new mean == 101.6667 mmHg 
# unchanged var == 149.75 mmHg, as the entire distribution shifted


#Q1d
#New reduced blood pressure
newbp = bp-10; newbp
#Since newbp is already a vector, js plot
boxplot_bp = boxplot(newbp, 
                     ylab = "Reduced Blood Pressure (mmHg)", 
                     main = "Patient's Blood Pressure in mmHg (Reduced)",
                     col = "steelblue")



#Q1e
#Histogram of new BP
hist_bp = hist(newbp, 
               prob = TRUE, 
               col = "pink", 
               xlab = "Reduced Blood Pressure (mmHg)", 
               main = "Patient's Blood Pressure in mmHg (Reduced)")

#
#
#
#
#

#Q2
#For each of the following experiments, identify the variable(s),
#the data type of each variable, and the
#sample size.



#Q2a For each of 10 beetles, a biologist counted the number of times the beetle 
#fed on a disease-resistant plant during a 4-hour period.

#Variables are: 
#1. Number of times the beetles fed on a disease-resistant plant: Discrete quantitative variable


#Q2b In a nutritional study, 40 healthy males were measured for height
#and weight as well as the weight of their food intake over a 24-hour period.

#Variables are: 
#1. Weight of their food intake: Continuous quantitative variable


#Q2c The birth weight, number of siblings, mother's race, and age were recorded for each of 85 babies
#born at NUH.

#Variables are:                                                   !!!!!!! SOME MIGHT NOT BE CORRECT !!!!!!
#1. Birth weight: Continuous quantitative variable      !!!!!!!!!!! ALL MEASUREMENTS ARE CONT. QUANT  !!!!!!!!!!!!
#2. Number of siblings: Discrete quantitative variable
#3. Mother's race: Nominal categorical variable
#4. Mother's age: Continuous quantitative variable

#
#
#
#
#

#Q3
#Symmetric and bimodal: Dataset 3
#Symmetric and skewed right: Dataset 2

#
#
#
#
#

#Q4
#Histogram 1 : Boxplot 3 \\ same median, same minimum
#Histogram 3 : Boxplot 2 \\ H3 is right skewed, range from 0 to 12
#Histogram 2 : Boxplot 1 \\ Negative minimum, range from -2 to 8
