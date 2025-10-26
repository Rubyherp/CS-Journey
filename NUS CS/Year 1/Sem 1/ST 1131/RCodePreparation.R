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

