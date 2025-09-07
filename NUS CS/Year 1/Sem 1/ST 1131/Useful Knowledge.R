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


################### !!!!!!!!!!!!!  Important to remember: to select elements from vectors, you use single square brackets: [ ]. Don't mix them up! 
################### !!!!!!!!!!!!!  You can also refer to the names of the components, with [[ ]] or with the $ sign.





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



















