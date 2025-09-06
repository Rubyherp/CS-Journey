
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
temperature_vector <- c("High", "Low", "High","Low", "Medium")
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

# Factor value for second data analyst
da2 <-factor_speed_vector[2]
da2

# Factor value for fifth data analyst
da5 <- factor_speed_vector[5]
da5




# Is data analyst 2 faster than data analyst 5?
da2>da5

