##########  TOPIC 1 ##########

c(2,4,6,8,10)

# Creating a Vector in R
#creating a vector of numbers:
number<-c(2,4,6,8,10); number

# creating a vector of strings/characters:
string<-c("weight", "height", "gender"); string

#creating a Boolean vector (T/F):
logic<- c(T, T, F, F, T); logic





#set YOUR working directory, please check YOURS
setwd("C:/Data")
data<-read.csv("crab.txt", sep = "", header = FALSE)
data[1:6,] #first 6 rows
names(data)


#Or read file with the full directory instead
data<-read.csv("C:/Data/crab.txt", sep = "", header = TRUE)
data[1:6,] #first 6 rows
names(data)
colMeans(data)

which(data$color == 3)



m = matrix(seq(2,20,2), 10, 3)
# or
m = matrix(0,10, 3)
for(i in 1:3){m[,i] = seq(2,20,2)}; m

colMeans(m)


