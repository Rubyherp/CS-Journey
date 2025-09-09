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






################ FACTORS
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



# GGPLOT
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



























                               
