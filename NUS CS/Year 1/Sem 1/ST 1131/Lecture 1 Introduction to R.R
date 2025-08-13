3+4
4+5
x <- 3 
x
# <- / = works for out level

3-> x
x

y = "hello"
y
z = TRUE
z = True
z = T
z


x = c(0,1,2,3)
x

y = c("a","B", "c", "D")
y

z = c(T, FALSE, TRUE, F)
z

x = c(x, 4)
x

x = c(-1, x, 5)
x
#c is concat. -1 added infront followed byx and 5

y = c(y, 0,1)
y 
# In y 0 and 1 is now a string


#how to create a blank vector of len 5
x = numeric(5)
x
#merge x and y
xy = c (x,y)
xyz = c(x,y,z,6,10)
xy
xyz

#make vector of five 1s. rep is replicate
x = rep(1,7)
x = rep(c(1,2), 7)
x
x= c(rep(c(1,2),7),3,3)

x = rep("weight", 5)
x



#sequence
x = seq(from=2, to=11, by=2) #to inclusive, give multiples of 2, from 2 to 11

# 5 numbers of equal gaps.
x = seq(from=2, to=11, length=5)
x

#if dont write from, to and by, it will assume it to be 
x = seq(2,20,4)
x
#if want change lenght instead of by, change it manully
x = seq(2,20,length = 4)
x


#X is a vector 1 to 5, each multiplied by 2
x = 1:5*2
x
# each x value added by 2
x = 1:5 +2
#alternatively
x = 1:5
x = x+2
x



#try adding int to a str?
y+2
y + "hello"
y


#booleans are 0 and 1
#note that z = z will save the new z value
z 
z+1
z+3



#ls() 
#rm(list = ls())



x = c(1:6)
x

m = matrix(x,nrow=2, ncol=3) #fill by column
m = matrix(x, 2, 3, byrow=T) #default byrow is false
m = matrix(x, 2, 4) #error 
m = matrix(x, 2, 6) #

#binding to matrix
weight = c(1:4)
height = c(3:6)
m = rbind(weight,height) #row bind x, and y. Noticed change in name
m
#binding matrixes need to be same size
m = cbind(weight, height)
#c and r binddoes not to be a matrixes

bmi = c(2, 3, 4, 5)
m = cbind(m, bmi)

#adding a new person? thru binding
a = c(3, 5, 7)
m = rbind(m, a)

m = matrix(c(1,2,3,4),2,2)
m



#invert a matrix. Not 1/m
n = solve(m)
1/m



#this doesn't do matrix multiplication
n
m
n*m
#correct
m%*%n



#Transpose t(m)





































