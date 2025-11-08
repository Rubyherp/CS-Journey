setwd("C:/DATA1131")
data = read.csv("hdb_2017_2025Feb_sample.csv"); data

library(ggplot2)
library(flextable)
library(dplyr)

#Q2##############################################################################################

hist(data$floor_area_sqm, breaks = seq(30, 250, by = 5), col = "steelblue", xlab = "Floor Area (sqm)", ylab = "Frequency", main = "Histogram of Floor Area (sqm)")
mean(data$floor_area_sqm)
type = data$flat_type; type
tab = table(type); tab
proptab = prop.table(tab) 
names(tab)

#1
barplot(proptab, col = "darkred", xlab = "Type of Flat", ylab = "Frequency", main = "Barplot of the Flat Types")
#2
ggplot(data, aes(x = floor_area_sqm)) +
  geom_histogram(fill = "steelblue", color = "black") +
  labs(title = "Histogram of Floor Area (sqm)", x = "Floor Area", y = "Number of Flats") +
  scale_x_continuous(breaks = seq(30, 250, by = 5)) + #To increase x-axis numbers +
  scale_y_continuous(breaks = seq(0, 1200, by = 100)) + #To increase y-axis numbers +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        axis.title = element_text(size = 11),
        axis.text = element_text(size = 10),
        panel.grid.minor = element_blank())




#Q3##############################################################################################

#Using ggplot, barplot

ggplot(data, aes(x = flat_type)) +
  geom_bar(fill = "darkred") +
  geom_text(stat = "count", aes(label = after_stat(count/ sum(count) * 100)), vjust = -0.3) + #To add cound on the bar
  labs(title = "Barplot of Flat Types", x = "Flat Type", y = "Number of Flats") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(vjust = 1, angle = 45),
        axis.title.x = element_text(angle = 0))

#boxplot(data$floor_area_sqm~data$flat_type, col = c("steelblue", "darkred"))




#Q4##############################################################################################

#Using ggplot, box plot
#1
ggplot(data, aes(x = flat_type, y = floor_area_sqm)) +
  geom_boxplot(color = "steelblue") +
  scale_y_continuous(breaks = seq(30, 200, by = 10)) + #To increase y-axis numbers
  labs(title = "Boxplot of Floor Area (sqm) and Flat Type",
       x = "Flat Type",
       y = "Floor Area (sqm)")+
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(hjust = 0.5))

#2
ggplot(data, aes(x = flat_type, y = floor_area_sqm)) +
  geom_boxplot(outlier.color = "red", 
               outlier.size = 1,
               alpha = 0.5) +
  scale_y_continuous(breaks = seq(30, 250, by = 10))+
  labs(title = "Box plot of Floor Area by Flat Type",
       x = "Flat Type",
       y = "Floor Area (sqm)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        axis.title = element_text(size = 11),
        axis.text.x = element_text(angle = 45, hjust = 0.5, size = 10),
        axis.text.y = element_text(size = 10),
        axis.title.x = element_text(vjust = 20))


library(dplyr)
library(flextable)

# Create summary statistics
summary_stats <- data %>%
  group_by(flat_type) %>%
  summarise(
    Count = n(),
    Min = min(floor_area_sqm, na.rm = TRUE),
    Q1 = quantile(floor_area_sqm, 0.25, na.rm = TRUE),
    Median = median(floor_area_sqm, na.rm = TRUE),
    Mean = mean(floor_area_sqm, na.rm = TRUE),
    Q3 = quantile(floor_area_sqm, 0.75, na.rm = TRUE),
    Max = max(floor_area_sqm, na.rm = TRUE),
    SD = sd(floor_area_sqm, na.rm = TRUE),
    IQR = IQR(floor_area_sqm, na.rm = TRUE)
  ) %>%
  mutate(across(where(is.numeric) & !Count, ~round(., 2)))

# Create formatted table
ft <- flextable(summary_stats) %>%
  set_header_labels(
    flat_type = "Flat Type",
    Count = "Count",
    Min = "Min (sqm)",
    Q1 = "Q1 (sqm)",
    Median = "Median (sqm)",
    Mean = "Mean (sqm)",
    Q3 = "Q3 (sqm)",
    Max = "Max (sqm)",
    SD = "SD",
    IQR = "IQR"
  ) %>%
  theme_booktabs() %>%
  bg(part = "header", bg = "steelblue") %>%
  color(part = "header", color = "white") %>%
  align(align = "center", part = "all") %>%
  align(j = 1, align = "left", part = "body") %>%
  autofit() %>%
  add_header_lines("Summary Statistics: Floor Area by Flat Type")

ft #Print table



#Q5##############################################################################################

library(ggplot2)
attach(data)
#Scatter plot with line for #2
#1
plot(data$resale_price~data$floor_area_sqm)
#2
ggplot(data, aes(x = floor_area_sqm, y = resale_price)) +
  geom_point(col = "darkblue", alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  scale_y_continuous(breaks = seq(100000, max(resale_price), by = 100000)) +
  scale_x_continuous(breaks = seq(30, 250, by = 5)) +
  labs(title = "Scatter plot of Resale Price and Floor Area (sqm) ",
       x = "Floor Area (sqm)",
       y = "Resale Price" ) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x = element_text(hjust = 0.5, angle = 45))

cor(resale_price, floor_area_sqm)

model = lm(formula = data$resale_price~data$floor_area_sqm)
summary(model)

# Scatter plot with regression line
library(ggplot2)

#3
ggplot(data, aes(x = floor_area_sqm, y = resale_price)) +
  geom_point(alpha = 0.5, color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Relationship between Floor Area and Resale Price",
       x = "Floor Area (sqm)",
       y = "Resale Price") +
  theme_minimal()

# Calculate Pearson correlation
correlation <- cor(data$floor_area_sqm, data$resale_price, method = "pearson")
print(paste("Pearson correlation:", round(correlation, 3)))




#Q6##############################################################################################

setwd("C:/DATA1131")
data = read.csv("hdb_2017_2025Feb_sample.csv")
library(dplyr)
library(stringr)
library(ggplot2)
factor_flat_type = as.factor(data$flat_type)
factor_flat_type
factown = as.factor(data$town)
facmodel = as.factor(data$flat_model)
faclease = as.factor(data$lease_commence_date)
data <- data %>%
  mutate(
    # Extract years and months using regex
    years = as.numeric(str_extract(remaining_lease, "\\d+(?=\\s*years)")),
    months = as.numeric(str_extract(remaining_lease, "\\d+(?=\\s*months)")),
    months = ifelse(is.na(months), 0, months),  # replace NA months with 0
    remaining_lease_numeric = years + months / 12
  )

model1 = lm(formula = data$resale_price ~ data$floor_area_sqm 
                                      + data$remaining_lease_numeric 
                                      + facmodel 
                                      + faclease 
                                      + factown
                                      + factor_flat_type)

plot(data$resale_price ~ data$floor_area_sqm 
     + data$remaining_lease_numeric 
     + facmodel 
     + faclease 
     + factown
     + factor_flat_type)

summary(model1)
plot(model1) 

raw.res = model1$res
SR = rstandard(model1)
plot(data$resale_price, SR, xlab = "Predicted Response", ylab = "SR") 
abline(h=0, col = "red", lty = 1)
hist(SR)
qqnorm(SR)

#for resale and Remaining Lease - Scatter plot
ggplot(data, aes(x = remaining_lease_numeric, y = resale_price)) +
  geom_point(alpha = 0.5, color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Scatter plot of Remaining Lease (Years) and Resale Price",
       x = "Remaining Lease (Years)",
       y = "Resale Price") +
  theme_minimal()

cor.test(data$resale_price, data$remaining_lease_numeric)


#for resale and area - Scatter plot
ggplot(data, aes(x = floor_area_sqm, y = resale_price)) +
  geom_point(alpha = 0.5, color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Scatter plot of Floor Area and Resale Price",
       x = "Floor Area (sqm)",
       y = "Resale Price") +
  theme_minimal()

cor.test(data$resale_price, data$floor_area_sqm)

# for resale and type
# ANOVA test
anova_result <- aov(resale_price ~ flat_type, data = data)
summary(anova_result)

# Summary statistics by flat type
data %>%
  group_by(flat_type) %>%
  summarise(
    Count = n(),
    Mean_Price = mean(resale_price),
    Median_Price = median(resale_price),
    SD_Price = sd(resale_price)
  ) %>%
  arrange(Mean_Price)

#For resale price and flat type  - Box plot
ggplot(data, aes(y = resale_price, x = flat_type)) +
  geom_boxplot(outlier.color = "red", 
               outlier.size = 1,
               alpha = 0.5) +
  labs(title = "Box plot of Resale Price by Flat Type",
       x = "Flat Type",
       y = "Resale Price") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        axis.title = element_text(size = 11),
        axis.text.x = element_text(angle = 45, hjust = 0.5, size = 10),
        axis.text.y = element_text(size = 10),
        axis.title.x = element_text(vjust = 20))

# for resale and model
# ANOVA test
anova_result <- aov(resale_price ~ flat_model, data = data)
summary(anova_result)

# Summary statistics by flat model
data %>%
  group_by(flat_model) %>%
  summarise(
    Count = n(),
    Mean_Price = mean(resale_price),
    Median_Price = median(resale_price),
    SD_Price = sd(resale_price)
  ) %>%
  arrange(Mean_Price)

# for resale and model - Box plot
ggplot(data, aes(y = (resale_price), x = reorder(flat_model, resale_price, FUN = median))) +
  geom_boxplot(outlier.color = "red", 
               outlier.size = 1,
               alpha = 0.5) +
  labs(title = "Box plot of Resale Price by Flat Model",
       x = "Flat Model",
       y = "Resale Price") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        axis.title = element_text(size = 11),
        axis.text.x = element_text(angle = 45, hjust = 0.5, size = 10),
        axis.text.y = element_text(size = 10),
        axis.title.x = element_text(vjust = 20))


# for resale and town
# ANOVA test
anova_result <- aov(resale_price ~ town, data = data)
summary(anova_result)

# Summary statistics by flat model
data %>%
  group_by(town) %>%
  summarise(
    Count = n(),
    Mean_Price = mean(resale_price),
    Median_Price = median(resale_price),
    SD_Price = sd(resale_price)
  ) %>%
  arrange(Mean_Price)

# for resale and town - Box plot
ggplot(data, aes(y = (resale_price), x = reorder(town, resale_price, FUN = median))) +
  geom_boxplot(outlier.color = "red", 
               outlier.size = 1,
               alpha = 0.5) +
  labs(title = "Box plot of Resale Price by Town",
       x = "Town",
       y = "Resale Price") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        axis.title = element_text(size = 11),
        axis.text.x = element_text(angle = 45, hjust = 0.5, size = 10),
        axis.text.y = element_text(size = 10),
        axis.title.x = element_text(vjust = 20))

#for resale and lease commencement - scatterplot
ggplot(data, aes(x = lease_commence_date, y = resale_price)) +
  geom_point(alpha = 0.5, color = "blue") +
  scale_x_continuous(breaks = seq(1960, 2025, by = 5))+
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Scatter plot of Resale Price, and Lease Commencement Date",
       x = "Lease Commencement Date",
       y = "Resale Price") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"))


cor.test(data$resale_price, data$lease_commence_date)


model2 = lm(formula = log(data$resale_price) ~ data$floor_area_sqm 
            + data$remaining_lease_numeric 
            + facmodel 
            + faclease 
            + factown
            + factor_flat_type)
summary(model2)
plot(model2)

############ FINAL MODEL ############ ############ ############ ############ ############ ############ 
setwd("C:/DATA1131")
data = read.csv("hdb_2017_2025Feb_sample.csv")
library(dplyr)
library(stringr)
library(ggplot2)
factor_flat_type = as.factor(data$flat_type)
factown = as.factor(data$town)
facmodel = as.factor(data$flat_model)
faclease = as.factor(data$lease_commence_date)
data <- data %>%
  mutate(
    # Extract years and months using regex
    years = as.numeric(str_extract(remaining_lease, "\\d+(?=\\s*years)")),
    months = as.numeric(str_extract(remaining_lease, "\\d+(?=\\s*months)")),
    months = ifelse(is.na(months), 0, months),  # replace NA months with 0
    remaining_lease_numeric = years + months / 12
  )


model3 = lm(formula = log(data$resale_price) ~ data$floor_area_sqm 
            + data$remaining_lease_numeric 
            + facmodel 
            + faclease 
            + factown
            + factor_flat_type)
summary(model3)

SR <- rstandard(model3)
outlier_indices <- which(SR > 3 | SR < -3)
cat("Number of outliers:", length(outlier_indices), "\n")
data = data[-c(outlier_indices), ] #REMOVE OUTLIERS FROM DATA
plot((model3))
hist(SR)
qqnorm(SR)
qqline(SR)
plot(log(data$resale_price), SR, xlab = "Predicted Response", ylab = "SR") 
abline(h = 0, col = "red")


#################################################################################################################



