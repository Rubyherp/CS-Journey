setwd("C:/DATA1131")
data = read.csv("hdb_2017_2025Feb_sample.csv"); data
flr_area = data$floor_area_sqm; flr_area
hist(flr_area, breaks = seq(30, 250, by = 5), col = "steelblue", xlab = "Floor Area (sqm)", ylab = "Frequency", main = "Histogram of Floor Area (sqm)")
mean(flr_area)
type = data$flat_type; type

tab = table(type); tab
names(tab)
proptab = prop.table(tab)

barplot(proptab, col = "darkred", xlab = "Type of Flat", ylab = "Frequency", main = "Barplot of the Flat Types")

ggplot(data, aes(x = flat_type)) +
  geom_bar(fill = "darkred") +
  geom_text(stat = "count", aes(label = after_stat(count/ sum(count) * 100)), vjust = -0.3) +
  labs(title = "Barplot of Flat Types", x = "Flat Type",y = "Number of Flats") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(vjust = 5)
  )

boxplot(data$floor_area_sqm~data$flat_type, col = c("steelblue", "darkred"))

ggplot(data, aes(x = flat_type, y = floor_area_sqm)) +
  geom_boxplot(color = "steelblue") +
  scale_y_continuous(breaks = seq(30, 200, by = 10)) + #To increase y-axis numbers
  labs(title = "Boxplot of Floor Area (sqm) and Flat Type",
       x = "Flat Type",
       y = "Floor Area (sqm)")+
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(hjust = 0.5))


plot(data$resale_price~data$floor_area_sqm)

ggplot(data, aes(x = floor_area_sqm, y = resale_price)) +
  geom_point(col = "darkblue", alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  scale_y_continuous(breaks = seq(100000, max(resale_price), by = 100000)) +
  scale_x_continuous(breaks = seq(30, 250, by = 5)) +
  labs(title = "Scatter plot of Resale Price and Floor Area (sqm) ",
       x = "Floor Area (sqm)",
       y = "Resale Price" ) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x = element_text(hjust = 0.5))

cor(resale_price, floor_area_sqm)

model = lm(formula = data$resale_price~data$floor_area_sqm)
summary(model)



setwd("C:/DATA1131")
data = read.csv("hdb_2017_2025Feb_sample.csv")
factor_flat_type = factor(data$flat_type)

library(dplyr)
library(stringr)
data <- data %>%
  mutate(
    # Extract years and months using regex
    years = as.numeric(str_extract(remaining_lease, "\\d+(?=\\s*years)")),
    months = as.numeric(str_extract(remaining_lease, "\\d+(?=\\s*months)")),
    months = ifelse(is.na(months), 0, months),  # replace NA months with 0
    remaining_lease_numeric = years + months / 12
  )


factown = factor(data$town)
facmodel = factor(data$flat_model)
plot(data$resale_price, main = "Scatter plot of Resale Price", ylab = "Resale Price")
plot(log(data$resale_price), main = "Scatter plot of the log of Resale Price",ylab = "Resale Price")


model2 = lm(formula = (data$resale_price) ~ data$floor_area_sqm * factor_flat_type + data$remaining_lease_numeric)
summary(model2)

model3 = lm(formula = log(data$resale_price) ~ data$floor_area_sqm * factor_flat_type + data$remaining_lease_numeric)
summary(model3)

raw.res = model2$res
sr = rstandard((model2))
plot(sr, log(data$resale_price))
plot(sr,  data$floor_area_sqm * factor_flat_type + data$remaining_lease_numeric)
hist(sr)
qqnorm(sr)
qqline(sr)

model4 = lm(formula = log(data$resale_price) ~ data$floor_area_sqm*factor_flat_type*data$remaining_lease_numeric)
summary(model4)

model5 = lm(formula = log(data$resale_price) ~ (data$floor_area_sqm  * facmodel) + (factor_flat_type * factown))
summary(model4)


#model6 = lm(formula = (data$resale_price) ~ data$floor_area_sqm * factor_flat_type * facmodel * factown + data$remaining_lease_numeric)
#summary(model6)


plot(log(data$remaining_lease_numeric))
plot((data$remaining_lease_numeric),  log(data$resale_price), main = "Scatter plot of Resale Price and Remaining Lease", xlab = 'Remaining Lease', ylab = 'log (Resale Price)')
cor((data$remaining_lease_numeric),  log(data$resale_price))
plot((data$remaining_lease_numeric)^(3),  log(data$resale_price))

