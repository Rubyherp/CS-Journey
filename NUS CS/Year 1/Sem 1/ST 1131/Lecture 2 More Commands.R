setwd("C:/DATA1131")
data1 = read.csv("lung_cancer.csv", sep = ",", header = TRUE); data1

   Cancer Age Gender Smoke
1       1  68      1     1
2       1  69      0     1
3       1  55      1     1
4       1  48      1     1
5       1  73      0     1
6       1  76      0     1
7       1  66      1     0
8       1  61      0     0
9       0  40      1     1
10      0  53      0     1
11      1  49      0     1
12      0  53      0     0
13      0  39      0     0
14      0  71      1     0
15      0  36      1     0
16      0  25      0     0
17      0  40      0     0
18      0  45      0     0
19      0  30      0     0
20      1  37      0     0
21      1  67      1     0
22      1  55      1     1
23      1  49      1     0
24      0  58      1     0
25      0  70      1     0
26      1  65      1     1
27      1  48      1     0
28      1  54      1     1
29      1  49      1     1
30      0  47      0     0
31      0  68      0     1
32      0  46      0     1
33      0  31      1     0
34      0  38      1     0

female = sum(data1$Gender == 0); female
male = sum(data1$Gender == 1); male
gender = data.frame(female, male); gender

  female male
1     16   18

gender = gender / (16+18) * 100; gender     #AS A PERCENTAGE / PROPORTION

    female     male
1 47.05882 52.94118

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!           OTHER IMPORTANT COMMANDS               !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!:
attach(data)
detach(data)
data$Age;    #PRINT THE WHOLE "AGE" COLUMN FROM DATA
data[1:5,];    #PRINT DATA ROWS 1 TO 5. !!!!!!!!! NOTICE THE COMMA AT THE END TO INDICATE INCLUDE ALL COLUMNS. SAME FOR THE ROWS
data[data$Gender == "M",]    #PRINT ALL ROWS WHERE COLUMN = GENDER == "M"
&    #TO INDICATE "AND"
|    #TO INDICATE "OR"
!=    #TO INDICATE "NOT EQUAL TO"
is.na(data)    #TO TURN MATRIX DATA INTO TRUE/FALSE DEPENDING ON WHETHER THERE IS AN ERROR/MISSING INPUT IN THE DATA
max(data)
min(data)
sum(data)
cor(data)
mean(data)
range(data)
colMeans(data)    #MEAN OF ALL COLUMNS
sort(data)
which(data$Gender == "M");    #RETURN INDEXES OF ALL ROWS WHERE GENDER == "M"
















