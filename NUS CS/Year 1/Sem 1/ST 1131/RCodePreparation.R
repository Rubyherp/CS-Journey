setwd("/your work directory")
nums = c(1,2,3,4)
strs = c("hello", "hi")
numeric = numeric(3) #Give a vector of length 3, all zeros
replicate = rep(c(a,b), 3) #Replicate vector: c(a,b), 3 times
sequence = seq(from=2, to=10, by=2) # 2 4 6 8 10
sequence = seq(from=2, to=10, length=5) #2 4 6 8 10
sequence = seq(10) #1 2 3 4 5 6 7 8 9 10
matrix = matrix(v, nrow = 2, ncol = 2) #A 2X2 matrix of V. This is filled by COLUMN by default
matrix = matrix(v, nrow = 2, ncol = 2, byrow = T) #A 2X2 matrix of by, filled by ROW
bind_rows = rbind(a,b) #Binding rows of Vector A and Vector B (OR MATRIX)
bind_columns = cbind(a,b) #Binding columns of Vector A and Vector B (OR MATRIX)
Math_Operations_on_Matrix, m part 1: m*3, 1/m (inverse all number)
inverse_matrix = solve(m) #Inverse of matrix
Math_Operations_on_Matrix, m part 2: m*inverse_matrix Each m multiply with each inverse_matrix, m %*% inverse_matrix (matrix muultiplication)
transpose_matrix = t(m)
dataframes = data.frame(vector_of_first_column, vector_of_second_column)
imported_data = read.csv("file_name.csv/txt", sep = "," / " ", header = TRUE/FALSE)
imported_data[1:5, ] #First 5 rows, include all columns
imported_data[ , 1] #All rows from column 1
imported_data[ , 2:4] #All rows from columns 2 to 4
imported_data[1, 3] #Data from row 1, column 3
names(imported_data) #To view the names of all the headers
names(imported_data) = c("Subjects", "Gender", "CA1", "CA2", "HW") #Replacing all the names with the vector specified names
get_specific_columns = imported_data$Gender #Get all data from the column "Gender"
attach(imported_data) #Greater efficiency. No need to use "imported_data$Gender", just "Gender" is enough
imported_data[imported_data$Gender == "M", ] #If not attached; Get all rows where Gender == "M"; Notice 2 "=" only, NOTICE THE COMMA!!!!!!!!!  NOTICE THE COMMA!!!!!!!!!!
imported_data[Gender == "M", ] #If attached
imported_data[imported_data$Gender == "M" & imported_data$CA2 > 85, ] #Additiona conditions NOTICE THE COMMA!!!!!!!
imported_data[Gender == "M" & CA2 > 85, ]
Common logical operators: ==, !=, >, >=, <, <=, &, |
max = max(v) #Max value of vector v
min = min(v)
sum = sum(v)
mean = mean(v)
range = range(v)
correlation = cor(m, n) #Correlation between vectors m and n
sorted = sort(v) #Sorted version of v
Means_of_Columns = colMeans(imported_data) #Get the mean of every column, if all are numerics
Get_index = which(imported_data$Gender == "M") #Get all index of the rows from data where the Gender Column == "M"
length_of_data = length(imported_data$Gender) 
frequency_table = table(imported_data$Gender)
table_of_proportions = prop.table(frequency_table) #Or type the full code: table(imported_data$Gender)
table_of_percentages = table_of_proportions * 100 #Or type the full code: prop.table(table(imported_data$Gender)) * 100
changing_binary_variable_to_names: 
1. imported_data$Gender = ifelse(imported_data$Gender == "0", "female", "male") #If Gender == "0", replace with "Female", else "Male"
2. imported_data$gender_as_a_new_variable = ifelse(imported_data$Gender == "0", "female", "male") #This is creating a new variable instead of replacing directly
3. imported_data$Gender = factor(imported_data$Gender); levels(imported_data$Gender) = c("female", "male") #Convert variable from integers to categories. Then rename levels "0", and "1" to "female", anmd "male"
barplot = barplot(table(imported_data$Gender), ylab = "Frequency", xlab = "Gender", col = c(2,5), main = "Bar plot of Gender") #Takes in a frequency table
piechart = pie(table(imported_data$Gender), col = c(2,5), main = "Pie chart of Gender") 
summaries = summary(imported_data$CA1)
q30 = quantile(imported_data$CA1, 30) #Not a Frequency table anymore - dealing with quantitative variables 
IQR = IQR(imported_data$CA1)
variance = var(imported_data$CA1)
standard_deviation = sd(imported_data$CA1)
histogram = hist(imported_data$CA1, prob = TRUE, col = 2, xlab = "CA1 Marks", ylab = "Density", main = "Histogram of CA1 Marks")
hist(imported_data$CA1[mark < 30], main = "Histogram of Marks")
hist(imported_data$CA1[mark < 30], prob = TRUE, col = 2, xlab = "CA1 Marks", ylab = "Density", main = "Histogram of CA1 Marks") #plot up to a certain range
boxplot_stats = boxplot.stats(imported_data$CA1)
boxplot = boxplot(imported_data$CA1, col = 5, ylab = "CA1 Marks", main = "Box plot of CA1 Marks")
line = abline(h = median(imported_data$CA1)) #Add a line at the median value
contingency_table = table(categorical_data1, categorical_data2) #Contingency table is to show the frequency of multiple variables, compared to a frequency table that shows frequency of 1 variable. 
#Always table(row, column)
contingency_table_of_percentages = prop.table(table(categorical_data1, categorical_data2)) * 100
row_wise_contingency_table_percentage = prop.table(table(categorical_data1, categorical_data2), "categorical_data1") * 100 #Row-wise percentage contingency table. View Topic 2 EDA 5 
column_wise_contingency_table_percentage = prop.table(table(categorical_data1, categorical_data2), "categorical_data2") * 100 #Column-wise. Notice I swapped to 2 instead of 1 for the name

Example 1: Plotting
contingency_table = table(cancer, pmh.use) 
proptab = prop.table(contingency_table, "pmh.use") * 100
barplot_categorical = (proptab, beside = TRUE, xlab = "PMH Usage", main = " ", col = c("blue", "darkred"), legend = rownames(proptab)) 
#Beside = TRUE will plot clustered barplots and the clusters are formed by the column of the object 'proptab'.  If want consider the percentage of having cancer in each grp of PMH, then "pmh.use" 
#should be arrange in the column of "proptab", and percentages should be column-wise
#Compare 2 bars for this graph - those are the percentages of having cancer for 2 grps: PMH users, and non-users
contingency_table2 = table(pmh.use, cancer) 
proptab = prop.table(contingency_table, "pmh.use") * 100
barplot_categorical = (proptab, beside = TRUE, xlab = "Cancer", main = " ", col = c("blue", "darkred"), legend = rownames(proptab)) 
#Compare percentages in the cluster "Present" of the figure. Those are the percentages of having cancer for grp of PMH user and non-user
barplot_categorical_without_beside = (proptab, xlab = "Cancer", main = " ", col = c("blue", "darkred"), legend = rownames(proptab)) # This is stacked by default

box_plot_one_categorical_one_quantitative = boxplot(bc$agemenop~cancer, col = c(2,5), ylab = "Age at Menopause") #Notice the ~. boxplot(x~y). x is categorical, y is quantitative
outlier_boxplot = boxplot(bc$agemenop~cancer)$out #Values of all outliers
outlier_boxplot_each_group = boxplot(bc$agemenop~cancer)$group
index_outlier_of_group_1 = which(outlier_boxplot_each_group == 1) #Index of outliers in group == 1
outlier_boxplot_group==1 = boxplot(bc$agemenop~cancer)$out[which(outlier_boxplot_each_group == 1)]
scatterplot_1_variable = plot(hdb$floor_area, hdb$resale_price, col = 2) #Quantitative
scatterplot_2_variable = plot(hdb$resale_price ~ hdb$floor_area, col = 5) #2 Quantitative variable. plot(x~y)
correlation = cor(hdb$floor_area, hdb$resale_price)

vector_of_10_random_binomial_observations = rbinom(10, n, p) #10 obeservations. n is number of trials, p is probability of each independent trials
#Given X ~ Bin(3889, 0.531)
binomial_probability_P(X <= 2000) = pbinom(2000, 3889, 0.531, lower.tail = TRUE) 
binomial_probability_P(X > 2000) = pbinom(2000, 3889, 0.531, lower.tail = FALSE) #Not >= !!!!!!
binomial_quantile_P(x <= q0.9) = qbinom(0.9, n, p) #0.9 is the probability

vector_of_10_random_normal_observations = rnorm(10, mu, sd) #mu = mean
#Given X ~ N(100, 15^2)
normal_probability_P(X <= 115) = pnorm(115, 100, 15, lower.tail = TRUE) #Not variance !!!! 
normal_probability_P(X >= 90) = pbinom(90, 100, 15, lower.tail = FALSE) 
normal_quantile_90thpercentile_q0.9 = qnorm(0.9, 100, 15) #0.9 is the probability
#if want in between
normal_probability_P(50 <= X <= 75) = pnorm(75, 100, 15) - pnorm(50, 100, 15)
round_off_decimal_place = round(vector, num_of_decimal_place) #From vector V, round off each value to a decimal place

Example 2: Distributions
set.seed(999)
#Given N(70, 10^2) 
sample1 = rnorm(12, 70, 10); sample1 #Generate 12 observations
sample1_rounded1dp = round(sample1, 1); sample1_rounded1dp #Round to 1 dp
mean = mean(sample1_rounded1dp); mean #Get the mean for 1 sample

N.10000samples = matrix(rnorm(12000, 70, 10), 10000, 12); N.10000samples #N(samples) = 10000, n(sample size) = 12
sample.means = rowMeans(N.10000samples); sample.means #Get the mean of each row (10000). ie X1...Xn 
mean(sample.means) #Should be around 70
sd(sample.means) #should be around 10/ sqrt(12). NOTICE: sigma/sqrt(n), n = 12 !!! not N = 10000
histogram = hist(sample.means, prob = TRUE, col = "steelblue", xlab = "Histogram of Midterm Marks", ylab = "Density")

#Given N(70, 5^2) #Changed sd to 5
sample_10000_size_12 = matrix(rnorm(12000, 70, 5), 10000, 12); sample_10000_size_12 
sample_means = rowMeans(sample_10000_size_12); rowmeans
histogram_sd5 = hist(sample_means, prob = TRUE, col = "darkred", xlab = "Histogram of Midterm Marks", ylab = "Density")
