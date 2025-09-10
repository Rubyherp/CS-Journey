# Construct star_wars_matrix
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
region <- c("US", "non-US")
titles <- c("A New Hope", 
            "The Empire Strikes Back", 
            "Return of the Jedi")


# dimnames means DIMENSION NAMES
star_wars_matrix <- matrix(box_office, 
                      nrow = 3, byrow = TRUE,
                      dimnames = list(titles, region))
star_wars_matrix


# The worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)


# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)






########################################## FACTORS #####################################

The function factor is used to encode a vector as a factor (the terms ‘category’ and ‘enumerated type’ are also used for factors). If argument ordered is TRUE, the factor levels are assumed to be ordered. For compatibility with S there is also a function ordered.

is.factor, is.ordered, as.factor and as.ordered are the membership and coercion functions for these classes.
            
Usage
factor(x = character(), levels, labels = levels,
       exclude = NA, ordered = is.ordered(x), nmax = NA)

ordered(x, …)
is.factor(x)
is.ordered(x)
as.factor(x)
as.ordered(x)
addNA(x, ifany = FALSE)

Arguments
x: a vector of data, usually taking a small number of distinct values.

levels: an optional vector of the unique values (as character strings) that x might have taken. The default is the unique set of values taken by as.character(x), sorted into increasing order of x. Note that this set can be specified as smaller than sort(unique(x)).
                                                            
labels: either an optional character vector of labels for the levels (in the same order as levels after removing those in exclude), or a character string of length 1. Duplicated values in labels can be used to map different values of x to the same factor level.
                                                            
exclude: a vector of values to be excluded when forming the set of levels. This may be factor with the same level set as x or should be a character.
                                                            
ordered: logical flag to determine if the levels should be regarded as ordered (in the order given).
                                                            
nmax: an upper bound on the number of levels; see ‘Details’.
                                                            
…: (in ordered(.)): any of the above, apart from ordered itself.
                                                            
ifany: only add an NA level if it is used, i.e. if any(is.na(x)).


Value

factor returns an object of class "factor" which has a set of integer codes the length of x with a "levels" attribute of mode character and unique (!anyDuplicated(.)) entries. If argument ordered is true (or ordered() is used) the result has class c("ordered", "factor"). Undocumentedly for a long time, factor(x) loses all attributes(x) but "names", and resets "levels" and "class".                                                            

# Animals
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector)
factor_animals_vector


# Temperature
temperature_vector <- c("High", "Low", "High", "Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector




############# CHANGING LEVEL NAMES GENERATED FROM THE FACTOR FUNCTION
# Build factor_survey_vector with clean levels
survey_vector <- c("M", "F", "F", "M", "M")
survey_vector
factor_survey_vector <- factor(survey_vector)
levels(factor_survey_vector) <- c("Female", "Male")


# Male
male <- factor_survey_vector[1]


# Female
female <- factor_survey_vector[2]


# Battle of the sexes: Male 'larger' than female?
male > female






############ COMPARING FACTORS, SETTING LEVELS IN ORDINAL, I.E., WHICH LEVELS HAVE HIGHER IMPORTANCE
# Create factor_speed_vector
speed_vector <- c("medium", "slow", "slow", "medium", "fast")
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "medium", "fast"))
factor_speed_vector


# Factor value for the second data analyst
da2 <-factor_speed_vector[2]
da2


# Factor value for the fifth data analyst
da5 <- factor_speed_vector[5]
da5


# Is data analyst 2 faster than data analyst 5?
da2>da5





############# MTCARS DATA 
                     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2


############### SHOW THE STRUCTURE OF MTCARS DATAFRAME
str(mtcars)


############### RETURNS:
'data.frame':	32 obs. of  11 variables:
 $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
 $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
 $ disp: num  160 160 108 258 360 ...
 $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
 $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
 $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
 $ qsec: num  16.5 17 18.6 19.4 17 ...
 $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
 $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
 $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
 $ carb: num  4 4 1 1 2 1 4 2 2 4 ...






############# DATA: PLANETS
# Definition of vectors
name <- c("Mercury", "Venus", "Earth", 
          "Mars", "Jupiter", "Saturn", 
          "Uranus", "Neptune")
type <- c("Terrestrial planet", 
          "Terrestrial planet", 
          "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", 
          "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 
              11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 
              0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

    
# Create a data frame from the vectors
planets_df <- data.frame(name, type, diameter, rotation, rings)

    
################ Select the first 5 values of the diameter column
planets_df[,"diameter"]       #OR      
planets_df[,3]

    
################ Select the rings variable from planets_df
rings_vector <- planets_df$rings
# Print out rings_vector
rings_vector

    
################ subset(my_df, subset = some_condition)
# Select planets with a diameter < 1
subset(planets_df, subset = diameter<1)


################ order() is a function that gives you the ranked position of each element when it is applied to a variable
a <- c(100, 10, 1000)
order(a)
[1] 2 1 3


################ This means we can use the output of order(a) to reshuffle a:
a[order(a)]
[1]   10  100 1000
# Same as 
sort(a)


# Use order() to create positions
positions <-  order(planets_df$diameter)


# Use positions to sort planets_df
planets_df[positions,]



################# LISTS
################# Using MTCARS DATA
# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Adapt list() call to give the components names
my_list <- list(my_vector, my_matrix, my_df)
names(my_list) = c("vec", "mat", "df")        # OR
my_list <- list(vec = my_vector, mat = my_matrix, df = my_df)


# Print out my_list
my_list





###############  [] Brackets

shining_list[[1]]
[1] "The Shining"

shining_list[[2]]
[1] "Jack Nicholson"   "Shelley Duvall"   "Danny Lloyd"      "Scatman Crothers"
[5] "Barry Nelson"    

shining_list[[3]]
  scores sources                                              comments
1    4.5   IMDb1                     Best Horror Film I Have Ever Seen
2    4.0   IMDb2 A truly brilliant and scary film from Stanley Kubrick
3    5.0   IMDb3                 A masterpiece of psychological horror


shining_list

$moviename
[1] "The Shining"

$actors
[1] "Jack Nicholson"   "Shelley Duvall"   "Danny Lloyd"      "Scatman Crothers"
[5] "Barry Nelson"    

$reviews
  scores sources                                              comments
1    4.5   IMDb1                     Best Horror Film I Have Ever Seen
2    4.0   IMDb2 A truly brilliant and scary film from Stanley Kubrick
3    5.0   IMDb3                 A masterpiece of psychological horror

#!!!!!!!!!!!!!  Important to remember: to select elements from vectors, you use single square brackets: [ ]. Don't mix them up! 
#!!!!!!!!!!!!!  You can also refer to the names of the components, with [[ ]] or with the $ sign.





Summarise each group down to one row
summarise() creates a new data frame. It returns one row for each combination of grouping variables; if there are no grouping variables, the output will have a single row summarising all observations in the input. It will contain one column for each grouping variable and one column for each of the summary statistics that you have specified.
summarise() and summarize() are synonyms.
Usage
summarise(.data, ..., .by = NULL, .groups = NULL)

Examples
# A summary applied to ungrouped tbl returns a single row
mtcars %>%
  summarise(mean = mean(disp), n = n())
#>       mean  n
#> 1 230.7219 32

# Usually, you'll want to group first
mtcars %>%
  group_by(cyl) %>%
  summarise(mean = mean(disp), n = n())
#> # A tibble: 3 × 3
#>     cyl  mean     n
#>   <dbl> <dbl> <int>
#> 1     4  105.    11
#> 2     6  183.     7
#> 3     8  353.    14





Group by one or more variables
Most data operations are done on groups defined by variables. group_by() takes an existing tbl and converts it into a grouped tbl where operations are performed "by group". ungroup() removes grouping.
Usage
group_by(.data, ..., .add = FALSE, .drop = group_by_drop_default(.data))
ungroup(x, ...)
Ordering
Currently, group_by() internally orders the groups in ascending order. This results in ordered output from functions that aggregate groups, such as summarise().
When used as grouping columns, character vectors are ordered in the C locale for performance and reproducibility across R sessions. If the resulting ordering of your grouped operation matters and is dependent on the locale, you should follow up the grouped operation with an explicit call to arrange() and set the .locale argument. For example:
data %>%
  group_by(chr) %>%
  summarise(avg = mean(x)) %>%
  arrange(chr, .locale = "en")
visit https://dplyr.tidyverse.org/reference/group_by.html






Keep rows that match a condition
The filter() function is used to subset a data frame, retaining all rows that satisfy your conditions. To be retained, the row must produce a value of TRUE for all conditions. Note that when a condition evaluates to NA the row will be dropped, unlike base subsetting with [.]
                                                                                                                                                                                                                                                                                 
Usage
filter(.data, ..., .by = NULL, .preserve = FALSE

Useful filter functions
There are many functions and operators that are useful when constructing the expressions used to filter the data:
    ==, >, >= etc
    &, |, !, xor()
    is.na()
    between(), near()

                                                                                                                                                                                                                                                                                 
################## dplyr is loaded for you, and food_consumption is available.
# Calculate the mode of consumption for all countries in the food_consumption dataset by counting and sorting values in descending.
food_consumption %>% count(consumption, sort = TRUE)


################## The dplyr and ggplot2 libraries are loaded and food_consumption is available.
food_consumption %>%
  # Filter for rice food category
  filter(food_category == "rice") %>%
  # Create a histogram of CO2 emissions
  ggplot(aes(co2_emission)) +
    geom_histogram()  


food_consumption %>%
  # Filter for rice food category
  filter(food_category == "rice") %>% 
  # Summarize the mean_co2 and median_co2
  summarise(mean_co2 = mean(co2_emission),
            median_co2 = median(co2_emission))



       


################### Boxplot using ggplot and without %>%
ggplot(msleep, aes(y = sleep_total)) +
  geom_boxplot()

# Adjust Quantile's default percentile, by adding probs, which takes in a vector of values
quantile(msleep$sleep_total, probs = c(0.2, 0.4, 0.6, 0.8, 1))
# OR          Use seq(start, end, step) / seq(from, to, by)
quantile(msleep$sleep_total, probs = seq(0, 1, 0.2))


################## !!!!!!!!!!!!!!!!!!!! FINDING THE OUTLIERS !!!!!!!!!!!!!!!!!!!!!!!!!!!!

# first find the Interquantile range
iqr <- quantile(msleep$bodywt, 0.75) - quantile(msleep$bodywt, 0.25)
lower_threshold <- quantile(msleep%bodywt, 0.25) - 1.5 * iqr
upper_threshold <- quantile(msleep%bodywt, 0.75) + 1.5 * iqr

msleep %>%
            filter( bodywt < lower_threshold | bodywt > upper_threshold) %>%
                        select(name, vore, sleep_total, bodywt



                               
                               
################# Short Summnary of learnt ##########################################
food_consumption %>% 
  group_by(food_category) %>% 
  summarize(var_co2 = var(co2_emission),
            sd_co2 = sd(co2_emission))

ggplot(food_consumption, aes(co2_emission)) +
  geom_histogram() +
  facet_wrap(~ food_category)

#Variance: The average of the squared distances from each data point to the mean. It's a measure of how spread out the data is. The formula involves squaring the differences between each data point and the mean, summing these squares, and dividing by the number of data points minus one. High variance indicates more spread out data.
#Standard Deviation (SD): The square root of the variance, providing a measure of spread that is in the same units as the data. It's easier to interpret than variance because it relates more directly to the data points.
#Mean Absolute Deviation (MAD): Similar to standard deviation but uses absolute values instead of squaring the distances. It treats all deviations from the mean equally, without giving extra weight to larger deviations like the standard deviation does.
#Quartiles and Quantiles: Methods to divide the data into equal parts. Quartiles split the data into four parts, and the Interquartile Range (IQR) is the difference between the first and third quartiles, offering a measure of spread that is robust against outliers.
#Outliers: Points that are significantly different from the rest of the data. They can be identified using the IQR; any data point more than 1.5 times the IQR below the first quartile or above the third quartile is considered an outlier.





# Sampling from a data frame
name = c("Amir", "Brian", "Claire", "Damian")
n_sales - c(178, 126, 75, 69)
sales_counts = data.frame(name, n_sales)

sales_counts %>%
   sample_n(1) #########!!!!!!!! This chooses randomly, repeating it will give a different row !!!!!!!########
# Change the input to get change the number of samples

# Setting a random seed
set.seed(5) #will make sure same sample is chosen each time

# Sampling with replacement --> can get same people multiple time
sales_counts %>%
   sample_n(2, replacement = TRUE) 

Independent events: Two events are independent if the probability of the second event isnt affected by the outcome of the first event
Sampling with replacement = each pick is independent

Dependent events: Two events are dependent if the probability of the second event is affected by the outcome of the first event
Sampling WITHOUT replacement = each pick is dependent




                               
Create, modify, and delete columns
mutate() creates new columns that are functions of existing variables. It can also modify (if the name is the same as an existing column) and delete columns (by setting their value to NULL).

Examples
# Newly created variables are available immediately
starwars %>%
  select(name, mass) %>%
  mutate(
    mass2 = mass * 2,
    mass2_squared = mass2 * mass2
  )
#> # A tibble: 87 × 4
#>    name                mass mass2 mass2_squared
#>    <chr>              <dbl> <dbl>         <dbl>
#>  1 Luke Skywalker        77   154         23716
#>  2 C-3PO                 75   150         22500
#>  3 R2-D2                 32    64          4096
#>  4 Darth Vader          136   272         73984
#>  5 Leia Organa           49    98          9604
#>  6 Owen Lars            120   240         57600
#>  7 Beru Whitesun Lars    75   150         22500
#>  8 R5-D4                 32    64          4096
#>  9 Biggs Darklighter     84   168         28224
#> 10 Obi-Wan Kenobi        77   154         23716
#> # ℹ 77 more rows
                                                                                           
# As well as adding new variables, you can use mutate() to
# remove variables and modify existing variables.

                                                                                           
# Calculate probability of picking a deal with each product
amir_deals %>%
  count(product) %>%
  mutate(prob = n/sum(n))



####################################################### GGPLOT #################################################
Arguments
data
    Default dataset to use for plot. If not already a data.frame, will be converted to one by fortify(). If not specified, must be supplied in each layer added to the plot.
mapping
    Default list of aesthetic mappings to use for plot. If not specified, must be supplied in each layer added to the plot.

Details
ggplot() is used to construct the initial plot object, and is almost always followed by a plus sign (+) to add components to the plot.
There are three common patterns used to invoke ggplot():
    ggplot(data = df, mapping = aes(x, y, other aesthetics))
    ggplot(data = df)
    ggplot()
The first pattern is recommended if all layers use the same data and the same set of aesthetics, although this method can also be used when adding a layer using data from another data frame.
The second pattern specifies the default data frame to use for the plot, but no aesthetics are defined up front. This is useful when one data frame is used predominantly for the plot, but the aesthetics vary from one layer to another.
The third pattern initializes a skeleton ggplot object, which is fleshed out as layers are added. This is useful when multiple data frames are used to produce different layers, as is often the case in complex graphics.
The data = and mapping = specifications in the arguments are optional (and are often omitted in practice), so long as the data and the mapping values are passed into the function in the right order. In the examples below, however, they are left in place for clarity.


# Create a histogram of group_size
ggplot(data = restaurant_groups, mapping = aes(group_size)) +    geom_histogram(bins = 5)
# OR
ggplot(restaurant_groups, aes(group_size)) +    geom_histogram(bins = 5)
# Typically
ggplot( Data, mapping(using aes = () )) + geom_(type_of_graph)(bins = n)
# IF DATA IS NOT A DATA FRAME, AND IS A VECTOR, USE fortify() TO MAKE IT A DATAFRAME


# Create probability distribution
size_distribution <- restaurant_groups %>%
  # Count number of each group size
  count(group_size) %>%
  # Calculate probability
  mutate(probability = n / sum(n))
size_distribution

# Calculate expected group size
expected_val <- sum(size_distribution$group_size *
                    size_distribution$probability)
expected_val

# Calculate probability of picking group of 4 or more
size_distribution %>%
  # Filter for groups of 4 or larger
  filter(group_size>=4) %>%
  # Calculate prob_4_or_more by taking sum of probabilities
  summarise(prob_4_or_more = sum(probability))


                               

#######################################################  Continuous Distribution #########################################
# Finding Probility of a continuous distribution (AREA UNDER GRAPH)
P(wait time <= 7)
punif(7, min = 0, max = 12)
# probability of waiting <= 7 mins = 0.5833
P(wait time >= 7)
punif(7, min = 0, max = 12, lower.tail = FALSE)
# probability of waiting >= 7 mins = 0.41776

P(4 <= wait time <= 7) = P(wait time <= 7) - P(wait time <= 4)
punif(7, min = 0, max = 12) - punif(4, min = 0, max = 12)
                               

#!!!!!!!!!!!!!!!!! punif() and runif() !!!!!!!!!!!!!!!!!#######################
The runif() function
The runif() function generates random numbers from a uniform distribution. A uniform distribution is a distribution in which all values are equally likely. The runif() function takes three arguments:
    n: the number of random numbers to generate
    min: the lower bound of the distribution
    max: the upper bound of the distribution
The default values for min and max are 0 and 1, respectively.

Here is an example of how to use the runif() function to generate 10 random numbers from a uniform distribution between 0 and 1:
set.seed(123)
r <- runif(10)
                               
Output:
print(r)
 [1] 0.2875775 0.7883051 0.4089769 0.8830174 0.9404673 0.0455565 0.5281055
 [8] 0.8924190 0.5514350 0.4566147

The runif() function can also be used to generate random numbers from other distributions, such as the normal distribution, the Poisson distribution, and the binomial distribution.            
The punif() function
The punif() function calculates the cumulative probability density function (CDF) of the uniform distribution. The CDF is the probability that a random variable will be less than or equal to a certain value.
The punif() function takes three arguments:
    x: the value at which to calculate the CDF
    min: the lower bound of the distribution
    max: the upper bound of the distribution

Here is an example of how to use the punif() function to calculate the CDF of a uniform distribution between 0 and 1 at the value 0.5:
set.seed(123)
p <- punif(0.5, min = 0, max = 1)
                               
Output:
print(p)
[1] 0.5
This means that there is a 50% chance that a random variable from this distribution will be less than or equal to 0.5.

                                                                                           
# Set random seed to 334
set.seed(334)

# Generate 1000 wait times between 0 and 30 mins, save in time column
wait_times %>%
  mutate(time = runif(1000, min = 0, max = 30)) %>%
  # Create a histogram of simulated times
  ggplot(aes(time)) +
  geom_histogram()




                                                                                           
####################################################### Binomial Distribution ##############################################
Probability of the number of sucesses in a seqeunce of independent trials
E.g Number of head in a sequence of coin flips
Decribed by n and p
- n: total number of trials
- p: Probability of success
                                                
Examples: 

rbinom(nums of trials, nums of coins, probability of head/success)
1 = head, 0 = tails
rbinom(1, 1, 0.5)

                                                                                           
What is the probability of 7 heads?                                                                                           
P(heads = 7)?                      
dbinom(nums heads, num trials, prob of heads)
dbinom(7, 10, 0.5) = 0.1171
--> Flip 10 coins, 0.1171 chances of getting 7 heads


What is the probability of 7 heads or fewer?                                                                                           
P(heads <= 7)?      
pbinom(7, 10, 0.5) = 0.94531


What is the probability of more than 7 heads?                                                                                           
P(heads >= 7)?      
pbinom(7, 10, 0.5, lower.tail = FALSE) = 0.05468 =  1 - pbinom(7, 10, 0.5) = 0.94531        

Expected Value of a binomial distribution                                                                                           
Expected values = n x p                                                                                           
Expected number of heads out of 10 flips = 10 * 0.5 = 5

                                                                                           
dbinom function
This function returns the value of the probability density function (pdf) of the binomial distribution given a certain random variable x, number of trials (size), and probability of success on each trial (prob). 
    Syntax: dbinom(x, size, prob)
    Parameters:
        x : a vector of numbers.
        size : the number of trials.
        prob : the probability of success of each trial.
The dbinom function is also used to get the probability of getting a certain number of successes (x) in a certain number of trials (size) where the probability of success on each trial is fixed (prob).

                                                                                           
rbinom function
This function generates a vector of binomial distributed random variables given a vector length n, number of trials (size), and probability of success on each trial (prob). 
    Syntax: rbinom(n, size, prob) 
    Parameters:
        n: number of observations.
        size: the number of trials.
        prob: the probability of success of each trial.

Example:
In this example, we are generating a vector with a number of successes of 500 binomial experiments including the 90 trials where the probability of success on each trial is 0.7 and then verifying it by using calculating the mean of the generated vector using the rnorm function in the R.
gfg <- rbinom(500, size=100, prob=.6)
mean(gfg)
                                                                                           
Output:
[1] 60.01
Note: The more random variables we create, the closer the mean number of successes is to the expected number of successes. As the “Expected number of successes” = n*p where n is the number of trials and p is the probability of success on each trial.


pbinom function
This function returns the value of the cumulative density function (cdf) of the binomial distribution given a certain random variable q, number of trials (size), and probability of success on each trial (prob). 
    Syntax: pbinom(x, size, prob)
    Parameters:
        x: a vector of numbers.
        size: the number of trials.
        prob: the probability of success of each trial.
pbinom function returns the area to the left of a given value q in the binomial distribution. If you’re interested in the area to the right of a given value q, you can simply add the argument lower.tail = FALSE
Syntax:
pbinom(q, size, prob, lower.tail = FALSE) 

Example 1:
Under this example, we are calculating the probability to get a head more than 3 times if the coin is flipped fairly 10 times using the pbinom() function. Since the coin is tossed fairly the prob parameter to the function is passed to be 0.5. 
pbinom(3, size=10, prob=.5, lower.tail=FALSE)
Output:
[1] 0.828125

Example 2:
In this example, we are calculating the probability if a man scores a strike on 30% of his attempts when he bowls, If he bowls 50 times, what is the probability that he scores 30 or fewer strikes using the pbinom() function in R.
pbinom(30, size=50, prob=.7)
Output:
[1] 0.0848026





Example:
Simulating sales deals
#Assume that Amir usually works on 3 deals per week, and overall, he wins 30% of deals he works on. Each deal has a binary outcome: it's either lost, or won, so you can model his sales deals with a binomial distribution. In this exercise, you'll help Amir simulate a year's worth of his deals so he can better understand his performance.
qn: 
Simulate a year's worth of Amir's deals, or 52 weeks of 3 deals each, and store in deals.
Calculate the mean number of deals he won per week.

# Set random seed to 10
set.seed(10)
# Simulate 52 weeks of 3 deals
deals <- rbinom(52, 3, 0.3)
# Calculate mean deals won per week
mean(deals)

# Probability of closing 3 out of 3 deals
dbinom(3,3,0.3)                                                                                           
# Probability of closing <= 1 deal out of 3 deals
pbinom(1,3,0.3)
# Probability of closing > 1 deal out of 3 deals
pbinom(1,3,0.3, lower.tail = FALSE)  or  1-pbinom(1,3,0.3)

qn:                                                                                           
How many sales will be won?
Now Amir wants to know how many deals he can expect to close each week if his win rate changes. Luckily, you can use your binomial distribution knowledge to help him calculate the expected value in different situations. Recall from the video that the expected value of a binomial distribution can be calculated by n*p.
# Expected number won with 30% win rate
won_30pct <- 3 * 0.3
won_30pct

# Expected number won with 25% win rate
won_25pct <- 3 * 0.25
won_25pct

# Expected number won with 35% win rate
won_35pct <- 3 * 0.35
won_35pct





###################################### Normal Distribution ##########################

Traits
1. Bellcurve shaped
2. Symmetrical
3. Area under curve = 1
4. Probability of edges never hits 0
5. Standard normal distribution --> Mean = 0, sd = 1   
6. 68% falls under 1sd from mean                                 
7. 95% falls under 2sd from mean
8. 99.7% falls under 3sd from mean     

What percentage of women are shorter than 154 cm?                                                    
pnorm(154, mean = 161, sd = 7) = 0.159
What percentage of women are taller than 154 cm?                                                    
pnorm(154, mean = 161, sd = 7, lower.tail = FALSE) = 0.8413447
What percentage of women are 154 - 157 cm?                                                           pnorm(157, mean = 161, sd = 7) - pnorm(154, mean = 161, sd = 7) = 0.1252

What height are 90% of women shorter than?
qnorm(0.9, mean = 161, sd = 7) = 169.9707                
What height are 90% of women taller than?
qnorm(0.9, mean = 161, sd = 7, lower.tail  = FALSE) = 169.9707  

Generating random numbers                                                                            # Generate 10 random heights               
rnorm(10, mean = 161, sd = 7)                                                                                           


dnorm function
This function returns the value of the probability density function (pdf) of the normal distribution given a certain random variable x, a population mean μ, and the population standard deviation σ. 
    Syntax; dnorm(x, mean, sd)
    Parameters:
        x: vector of quantiles.
        mean: vector of means.
        sd: vector standard deviation.
                                                                                           
Example:
In this example, we will be finding the value of the standard normal distribution pdf at x=1 using the dnorm() function in the R.
                                                                                           
dnorm(x=1, mean=0, sd=1)
                                                                                           
Output:
[1] 0.2419707

                                                                                           
pnorm function
This function returns the value of the cumulative density function (cdf) of the normal distribution given a certain random variable q, a population mean μ, and the population standard deviation σ.
    Syntax: pnorm(q, mean, sd, lower.tail) 
    Parameters:
        q: It is a vector of quantiles.
        mean: vector of means.
        sd: vector standard deviation.
        lower.tail: It is logical; if TRUE (default), probabilities are otherwise

If lower.tail = FALSE take other half of the curve
                                                                                           
Example: In this example, we will be calculating the percentage of students at this school who are taller than 75 inches height of males at a certain school is normally distributed with a mean of μ=70 inches and a standard deviation of σ =3 inches using the pnorm() function in the R.
                                                                                           
pnorm(75, mean=70, sd=3, lower.tail=FALSE)
                                                                                           
Output:
[1] 0.04779035
At this school, 4.779% of males are taller than 75 inches.


qnorm function
This function returns the value of the inverse cumulative density function (cdf) of the normal distribution given a certain random variable p, a population mean μ, and the population standard deviation σ.
    Syntax: qnorm(p, mean = 0, sd = 0, lower.tail = TRUE)
    Parameters:
         p: It represents the significance level to be used
        mean: vector of means.
        sd: vector standard deviation.
         lower.tail = TRUE: Then the probability to the left of p in the normal distribution is returned. 
                                                                                           
Example:
In this example, we are calculating the Z-score of the 95th quantile of the standard normal distribution using the qnorm() function in R.
qnorm(.95, mean=0, sd=1)
                                                                                           
Output:
[1] 1.644854
                                                                                           
rnorm function
This function generates a vector of normally distributed random variables given a vector length n, a population mean μ and population standard deviation σ. 
    Syntax: rnorm(n, mean, sd) 
    Parameters:
        n: number of datasets to be simulated
        mean: vector of means.
        sd: vector standard deviation.
                                                                                           
Example: In this example, with the use of the rnorm() function we are generating a vector of 10 normally distributed random variables with mean=10 and sd=2.
rnorm(10, mean = 10, sd = 2)
                                                                                           
Output:
     [1] 10.886837  9.678975 12.668778 10.391915  7.021026 10.697684  9.340888  6.896892 12.067081 11.049609



                                                                                           
                                                                                           
The main difference is that the Binomial distribution is for discrete data (counts of successes in a fixed number of trials) with a finite range of outcomes, while the Normal distribution is for continuous data (like height or temperature) with an infinite range of possible values. 
A Normal distribution has a symmetric, bell shape, whereas a Binomial distribution can be symmetric or skewed.                 

Binomial Distribution     
Type of Data: Discrete (only takes on integer values).  What it describes: The number of "successes" in a fixed number of independent trials, where each trial has only two possible outcomes (e.g., heads or tails).  Parameters: The number of trials (\(n\)) and the probability of success (\(p\)) on any single trial.  
Range of values: Finite, from 0 successes to the total number of trials (\(n\)).  
Example: The number of correct answers on a 10-question quiz, where each question has a 70% chance of being answered correctly.           
                                                                                           
Normal Distribution     
Type of Data: Continuous (can take on any value within a range).  What it describes: Data that tends to cluster around a central mean, forming a symmetrical bell shape.  
Parameters: The mean (\(\mu \)) and the variance (\(\sigma ^{2}\)).  Range of values: Theoretically infinite, extending from negative to positive infinity.  
Example: The heights of adult men or the weights of a certain product.            
                                    
When to Use Which     
#Binomial: When you're counting outcomes of a fixed number of yes/no events.  
#Normal: When your data is continuous and follows a natural bell curve.            

Relationship      
When the number of trials (\(n\)) in a binomial distribution is large, and the probability of success (\(p\)) is close to 0.5, the binomial distribution can be approximated by the normal distribution. This is known as the Normal Approximation to the Binomial, which simplifies calculations for large sample sizes.                                                                                           

#Distribution of Amir's sales
#Since each deal Amir worked on (both won and lost) was different, each was worth a different amount of money. These values are stored in the amount column of amir_deals As part of Amir's performance review, you want to be able to estimate the probability of him selling different amounts, but before you can do this, you'll need to determine what kind of distribution the amount variable follows.
Both dplyr and ggplot2 libraries are loaded and amir_deals is available.                                                        

# Histogram of amount with 10 bins
ggplot(amir_deals, aes(amount)) + geom_histogram(bins = 10)
                                                                                           

                                                                                           
Simulating sales under new market conditions
The company's financial analyst is predicting that next quarter, the worth of each sale will increase by 20% and the volatility, or standard deviation, of each sale's worth will increase by 30%. To see what Amir's sales might look like next quarter under these new market conditions, you'll simulate new sales amounts using the normal distribution and store these in the new_sales data frame, which has already been created for you.
In addition, dplyr and ggplot2 libraries are loaded.
                                                                                           
Instructions:
Currently, Amir's average sale amount is $5000. Calculate what his new average amount will be if it increases by 20% and store this in new_mean.
new_mean <- 5000*120/100

Amir's current standard deviation is $2000. Calculate what his new standard deviation will be if it increases by 30% and store this in new_sd.
new_sd <- 2000*130/100

Add a new column called amount to the data frame new_sales, which contains 36 simulated amounts from a normal distribution with a mean of new_mean and a standard deviation of new_sd.
new_sales <- new_sales %>% 
  mutate(amount = rnorm(36, new_mean, new_sd))

Plot the distribution of the new_sales amounts using a histogram with 10 bins.
ggplot(new_sales, aes(amount)) + geom_histogram(bins = 10)




Rolling the dice 5 times
die <- c(1,2,3,4,5,6)
sample_of_5 <- sameple(die, 5, replace = TRUE)
sample_of_5
Sample vs Sample_n? Sample is used on a vector, while sample_n is on a dataframe

Roll 5 times and take mean
sample(5, replace = TRUE) %>% mean()

Repeat whole process 10 times
sample_means <- replicate(10, sample(die, 5, replace = TRUE) %>% mean())
sample_means

Central Limit Theorem:
The sampling distribution of a statistic becomes closer to the normal distribution as the number of trials increases.




The CLT in action
The central limit theorem states that a sampling distribution of a sample statistic approaches the normal distribution as you take more samples, no matter the original distribution being sampled from.
#In this exercise, you'll focus on the sample mean and see the central limit theorem in action while examining the num_users column of amir_deals more closely, which contains the number of people who intend to use the product Amir is selling.
Both dplyr and ggplot2 libraries are loaded and amir_deals is available.                                                                                           

# Set seed to 104
set.seed(104)

# Sample 20 num_users from amir_deals and take mean
sample(amir_deals$num_users, size = 20, replace = TRUE) %>%
  mean()

# Repeat the above 100 times
sample_means <- replicate(100, sample(amir_deals$num_users, size = 20, replace = TRUE) %>% mean())

A data frame called samples has been created for you with a column mean, which contains the values from sample_means. Create a histogram of the mean column with 10 bins.                                                                                           
# Create data frame for plotting
samples <- data.frame(mean = sample_means)

# Histogram of sample means
ggplot(samples, aes(mean)) +
  geom_histogram(bins = 10)





The mean of means
You want to know what the average number of users (num_users) is per deal, but you want to know this number for the entire company so that you can see if Amir's deals have more or fewer users than the company's average deal. The problem is that over the past year, the company has worked on more than ten thousand deals, so it's not realistic to compile all the data. Instead, you'll estimate the mean by taking several random samples of deals, since this is much easier than collecting data from everyone in the company.
#The user data for all the company's deals is available in all_deals.

# Set seed to 321
set.seed(321)

# Take 30 samples of 20 values of num_users, take mean of each sample
sample_means <- replicate(30, sample(all_deals$num_users, 20) %>% mean())

# Calculate mean of sample_means
mean(sample_means)

# Calculate mean of num_users in amir_deals
mean(amir_deals$num_users)




                                                                                           
Poisson process:
Events appear to happen at a certain rate, but completely random            
E.G 
Number of animals adopted from an animal shelter per week, Number of people arriving at a restaurant per hour, Number of earthquakes in California per year

Poisson distribution:
Probability of some number of events occurring over a fixed period of time
E.G
Probability of >= 5 animals adopted from an animal shelter per week
Probability of 12 people arriving at a restaurant per hour
Probability of < 20 earthquakes in California per year
                                                                                           
A Poisson distribution is a discrete probability distribution. 
It gives the probability of an event happening a certain number of times (k) within a given interval of time or space. 
The Poisson distribution has only one parameter, λ (lambda), which is the mean number of events.

λ = Average number of events per time interval

Probability of a single value                                                                                           
If the average number of adoptions per week is 8, what is P(Number of adoptions in a week = 5)?
dpois(5, lambda = 8) = 0.09160366

If the average number of adoptions per week is 8, what is P(Number of adoptions in a week <= 5)?
ppois(5, lambda = 8) = 0.1912361

If the average number of adoptions per week is 8, what is P(Number of adoptions in a week > 5)?
ppois(5, lambda = 8, lower.tail = FALSE) = 0.8087639

Sampling from a Poisson distribution
rpois(10, lambda = 8) 



                                                                                           

Exponential distribution:
Probability of time between Poisson events                                                                                           
E.G
Probability of > 1 day between adoptions
Probability of < 10 minutes between restaurants arrivals
Probability of 6-8 months between earthquakes
Also uses lambda (rate)
Continuous (time) vs Poisson distribution which is discrete
                                                                                           
Customer service requests                                                                                           
On average, one customer service ticket is created every 2 minutes
λ = 0.5 customer service tickets created each minute

How long until a new request is created?
P(wait < 1 min) = 
pexp(1, rate = 0.5) = 0.3934
P(wait > 4 min) =  
pexp(4, rate = 0.5, lower.tail = FALSE) = 0.1353353
P(1 min < wait < 4 min) =  
pexp(4, rate = 0.5) - pexp(1, rate = 0.5) = 0.4711954

Expected value of exponential distribution
In terms of rate (Poisson):
λ = 0.5 customer service tickets created each minute (requests per min)
In terms of time (Exponential):
1/λ = 1 requests per 2 minutes




t-distribution
Similar shape as the normal distribution
Degrees of freedom:
Has parameter degress of freedom (df) which affects the thickness of the tail
Lower df = thicker tails, higher standard deviation
Higher df = Closer to normal distribution




Log-normal distribution
Variable whose logarithm is normally distributed
Results in distribution that are skewed
E.G
Length of chess games
Adult blook pressure                                                                                           
Number of Hospitalisations in the 2003 SARS outbreak
                               

















                                                                                           
