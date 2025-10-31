
#Tutorial 9

setwd('/Users/xiangnenghor/Desktop/NUS Computer Science/Year 1 Sem 1/ST 1131/Data')
data = read.csv("house_selling_prices_FL.csv")
data
attach(data)
selling_price = price; selling_price
house_size = size; house_size

#Q1a
cor(selling_price,house_size) #if cor > 0.7, then strong association

#Q1b
scatterplot = plot(selling_price~house_size)
#from the scatter plot, there seem to be a linear positive relationship between selling price and the size 
#of the house. 

#Q1c
model1 = lm(formula = selling_price ~ house_size, data = data); model1
summary(model1)

#Q1d
#Since the p-value is very small, <0.001, we have very strong evidence that the built model is significant
#hence, the house size is no independent  of the size of the house.

#Q1e
confint(model1, level = 0.99)
#At a confidence interval of 99%, we have (59.6, 94,4) as the lower and upper bound respectively
# as the slope of Model 1, the house size
# ( + , + )
#Note that if ( -, + ) would imply that y is indepedent of x. This is beacuse mu1 can be 0. y = mu1x + mu0
#If mu1 is 0, then y = mu0, which is a straight line


#Q1f
raw.res = model1$res; raw.res
stand.res = rstandard(model1); stand.res
plot(stand.res~selling_price)
abline(h = 0)
qqnorm(stand.res, col = "red")
qqline(stand.res)
hist(stand.res) #Can try to remove outlier
which(stand.res < -3 | stand.res > 3) #There are no outliers 


#Q1g
R_squared = 0.5795
sqrt(R_squared)
cor(selling_price, house_size)


#Tutorial 9 group work

data$NW = as.factor(NW)
data;
model2 = lm(formula = selling_price ~ house_size + NW, data = data)
model2
summary(model2)
