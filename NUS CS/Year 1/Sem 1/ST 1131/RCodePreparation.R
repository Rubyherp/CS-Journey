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

Example 3: Exponential Distribution
#give mean, lambda =  5000. For Exponential dist, lambda(mean) = sigma. rate = 1/lambda. But for Poisson dist, mean = variance instead.
N.1000.n50 = matrix(rexp(50000, rate = 1/5000), 1000, 50); N.1000.n50
Xbar_sample.mean = rowMeans(N.1000.n50); Xbar_sample.mean
mean(Xbar_sample.mean) #should be close to lambda = 5000
sd(Xbar_sample.mean) #should be close to lamda/sqrt(n) = 707
histogram_exp = hist(Xbar_sample.mean, col = "green", xlab = "Sampling Distribution of X-bar")

N.1000.n7 = matrix(rexp(7000, rate = 1/5000), 1000, 7); N.1000.n7
Xbar_sample.mean.n7 = rowMeans(N.1000.n7); Xbar_sample.mean.n7
mean(Xbar_sample.mean.n7)
sd(Xbar_sample.mean.n7)
hist_exp2 = hist(Xbar_sample.mean.n7, col = "pink", xlab = "Sampling Distribution of X-bar")

t_dist_quantile = qt(0.975, 6), when df = n-1 = 6, at q 0.975 quantile
#Used to find Confidence Interval in its formula t(n-1),q(1-α/2), α = 1 100x% CI. Say 95% CI, then α = 0.05.
#T-test
t.test(data_vector, mu = μ0, alternative = "two.sided", conf.level = 0.95) #alternative = "two.sided" and conf.level = 0.95 is DEFAULT. Change "two.sided" to "greater" for right-sided or "less" for left-sided

#Equal Variance Test
var.test(x, y, alternative = "two.sided", ratio = 1, conf.level = 0.95) #ratio default = 1. conf.lvl default = 0.95

#T-test 2 sided for 2 INDEPENDENT variable
t.test(data_vector1, data_vector2, alternative = "two.sided", conf.level = 0.95, var.equal = TRUE) #!! var.equal = False by default

#T-test 2 sided for 2 dependent variable
t.test(data_vector1, data_vector2, mu = 0, alternative = "greater", paired = TRUE) #!!! mu is usually 0. Must include paired = TRUE
or t.test(diff, mu = 0, alternative = "greater") #if dw to use the paired one diff is the difference btw the 2 dependent variables
t.test(diff, mu = 0, alternative = "two.sided", conf.level = 0.99) #To see the confidence interval

#QQ plot
qqnorm(bill.Gentoo$length, pch = 20) #pch = 20 means use solid dots (small filled circles) for the points on the Q-Q plot.
qqline(bill.Gentoo$length, col = "red")

#| `pch` | Symbol | Description                                                 |
#| :---: | :----: | :---------------------------------------------------------- |
#|   0   |    □   | open square                                                 |
#|   1   |    ○   | open circle                                                 |
#|   2   |    △   | open triangle                                               |
#|   3   |    +   | plus sign                                                   |
#|   4   |    ×   | cross                                                       |
#|   5   |    ◊   | open diamond                                                |
#|   6   |    ▲   | filled triangle                                             |
#|   15  |    ■   | filled square                                               |
#|   16  |    ●   | filled circle (default for ggplot2)                         |
#|   17  |    ▲   | filled triangle                                             |
#|   18  |    ◆   | filled diamond                                              |
#|   19  |    ●   | larger filled circle                                        |
#|   20  |    •   | **small filled circle** (often used for clean scatterplots) |


#Shapiro Wilk Test
shapiro.test(bill.Gentoo$length) #Want larger p-value. cuz h0 = sample is from a Normal Dist. So we dw to reject H0

#Linear Model
m1 = lm(formula = y ~ x, data = data)
summary(m1)

#predicting value
new1 = data.frame(Present_Price = 20) # create a new df with 1 pt
new2 = data.frame(Present_Price = c(20, 40)) # create a new df with 2 pt
predict(m1, newdata = new1)

#Confidence Intervals for β0, β1
confint(m1, level = 0.95) #CI for all coef in m1
confint(m1, 'Present_Price', level = 0.95) # CI for coef of Present Price only

#Predicting value by a confidence interval
predict(m1, newdata = new2, interval = "confidence", level = 0.95)

#F Statistics
# Example: Calculate p-value using pf()
pf(F_statistic_value, df1, df2, lower.tail = FALSE)

# Example: Find the P-value for an F-statistic of 3.30 with 2 and 29 DF
p_value <- pf(3.30, df1 = 2, df2 = 29, lower.tail = FALSE)
print(p_value)

# Example: Find the F critical value for alpha = 0.05 with 2 and 29 DF
f_critical <- qf(p = 0.05, df1 = 2, df2 = 29, lower.tail = FALSE)
print(f_critical)

#List all raw residuals of m1
raw.res = m1$res

#List all standardized residuals of m1
SR = rstandard(m1)

#Get index of outliers
outliers = which(SR > 3 | SR < -3)

#Cook's Distance
C = cooks.distance(m1)
influential_point = which(C > 1)

#Linear model with categorical variable with >= 3 categories
#want to first factor it
hdb$flat_type = factor(hdb$flat_type)
# Then create model
attach(hdb)
m2 = lm(resale_price ~ floor_area_sqm + flat_type, data = hdb)
summary(m2)

#Adding Higher order terms like x^2
M = lm(y ~ x + I(x^2))
m3 = lm(resale_price ~ floor_area_sqm + I(floor_area_sqm^2), data = hdb)

#Adding Interaction terms
M = lm(y ~ x1 + x2 + x1*x2) === M = lm(y ~ x1 + x2 + x1:x2)
=== M = lm(y ~ x1*x2)
#If put the interaction terms only as shown above, R will automatically include the individual variables
#So if to to include use this
M = lm(y ~ x1 + x1:x2) # Use x1 : x2 to exclude x2

#Transforming response variable
y1 = log(y) # create a new response variable
M = lm(y1 ~ x)
#or
M = lm(log(y) ~ x)
M = lm(sqrt(y) ~ x)
M = lm(1/y ~ x)

#Anova 
anova(m2) #Order in ANOVA table is impt

#How to predict price for 2 flats, a 5 room that is 120 sqm and 3 room that is 88 sqm using model m2?
#1
new.point = data.frame(floor_area_sqm = c(120, 88), 
                       flat_type = c("5 Room", "3 Room")) # make sure type correctly
predict(m2, newdata = new.point)


##################### MISC #######################
# Boxplot stats
boxplot(mark, col = 5, main = "Boxplot of Final Mark", ylab = "Final Mark")
# boxplot has outliers.
box_stats = boxplot.stats(mark) # this summarises the boxplot
box_stats
box_stats$stats # this shows us the cut-offs for the boxplot; the whisker and box information
box_stats$out # the marks which are outliers


# " %in % "
# Check if a single value is in a vector
value <- 5
vector_data <- c(1, 2, 3, 4, 5, 6)
value %in% vector_data # Returns TRUE

# Check if multiple values are in a vector
values_to_check <- c(3, 7, 5)
vector_data %in% values_to_check # Returns c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)

# Subsetting a data frame based on column values
df <- data.frame(ID = c(101, 102, 103, 104), Name = c("Alice", "Bob", "Charlie", "David"))
selected_ids <- c(101, 103)
df_subset <- df[df$ID %in% selected_ids, ]
print(df_subset)




# SR vs fitted values
# 1. Get standardized residuals
std_resid <- rstandard(model)

# 2. Get fitted (predicted) values
fitted_vals <- fitted(model)

# 3. Plot manually
plot(fitted_vals, std_resid, # or swap with model$fitted.values
     main = "Standardized Residuals vs Fitted Values",
     xlab = "Fitted Values",
     ylab = "Standardized Residuals",
     pch = 20, col = "blue")

# 4. Add a horizontal line at 0
abline(h = 0, col = "red", lwd = 2)




# SR vs x
model <- lm(y ~ x1 + x2 + x3 + x4, data = mydata)

# Standardized residuals
std_resid <- rstandard(model)

# Loop over predictors to plot each
for (xname in c("x1", "x2", "x3", "x4")) {
  plot(mydata[[xname]], std_resid,
       main = paste("Standardized Residuals vs", xname),
       xlab = xname,
       ylab = "Standardized Residuals",
       pch = 20, col = "blue")
  abline(h = 0, col = "red", lwd = 2)
}



# Step 1: Convert to factor
mydata$gender <- factor(mydata$gender)

# Step 2: Set baseline to "Male"
mydata$gender <- relevel(mydata$gender, ref = "Male")

# Fit model
model <- lm(y ~ gender, data = mydata)
summary(model)


| Before relevel             | After relevel                |
| -------------------------- | ---------------------------- |
| Baseline = Female          | Baseline = Male              |
| Intercept = mean of Female | Intercept = mean of Male     |
| genderMale = Male − Female | genderFemale = Female − Male |



| Context                            | df formula                                   | Notes                      |
| ---------------------------------- | -------------------------------------------- | -------------------------- |
| Sample variance / SD               | n − 1                                        | 1 estimated mean           |
| Simple regression (1 predictor)    | n − 2                                        | 1 mean + 1 slope estimated |
| Multiple regression (p predictors) | n − (p + 1)                                  | +1 for intercept           |
| Regression ANOVA                   | Total: n−1; Regression: p; Residual: n−(p+1) | Splits total variation     |


























