# Loading data to work with R
hotel_bookings <- read.csv('hotel_bookings.csv')

# Running header function to see few rows
head(hotel_bookings)

# str function to see more details about the file
str(hotel_bookings)

# Just to see the column names
colnames(hotel_bookings)

# To create chart using ggplot2 installing and running the package
install.packages("ggplot2")
library("ggplot2")

# finding lead time and family with children
ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = lead_time, y = children))

# Using bar chart to find hotel type and market segment
ggplot(data = hotel_bookings) + 
  geom_bar(mapping = aes(x = hotel, fill = market_segment))

# Using facet_wrap funciton in bar chart to find hotel type and market segment with mor clarity
ggplot(data = hotel_bookings) + 
  geom_bar(mapping = aes(x = hotel, fill = market_segment)) + 
  facet_wrap(~market_segment)

# Same functions but facet_grid() and theme with x axis text in 45 degree
ggplot(data = hotel_bookings) + 
  geom_bar(mapping = aes(x = hotel, fill = market_segment)) + 
  facet_grid(~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

# using tidyverse package
install.packages("tidyverse")
library("tidyverse")

# Finding lead time and family with children 
onlineta_city_hotels <- filter(hotel_bookings, hotel_bookings$hotel == "City Hotel" & hotel_bookings$market_segment == "Online TA")

# To view the newely filtered file
View(onlineta_city_hotels)

# Finding lead time and family with children using pipe
onlineta_city_hotels_v2 <- hotel_bookings %>% 
  filter(hotel == "City Hotel") %>% 
  filter(market_segment == "Only TA")

# To view the new file filtered using pipe
View(onlineta_city_hotels_v2)

ggplot(data = onlineta_city_hotels) +
  geom_point(mapping = aes(x = lead_time, y = children, color = reservation_status)) +
  labs(title = "Lead time vs Guest with Kids", subtitle = "Data from two table",
       caption = "Source of data from google") +
  annotate("text", x=200, y=300, label = "The gentoos", color = "red", fontface = "bold", size = 4.5)