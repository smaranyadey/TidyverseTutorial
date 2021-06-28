#### Installing the required libraries ####
install.packages("tidyverse")
install.packages("nycflights13")

#### Load the packages ####
library(tidyverse)
library(nycflights13)

##### Dataset : nycflights13::flights ####
# nycflights13: contains the data from all 336,776 flights that departed from New York City in 2013 
# Source of the data: US Bureau of Transportation Statistics
flights

# The above way is only going to print first few rows and columns.
# This is called tibble, which are data frames, slightly tweaked to work with tidyverse.

#### Filter rows ####
# filter rows with info on flights on Jan 1.
flights |> 
  filter(month == 1, day == 1)

# save the result in a new tibble df
jan1 <- flights |> 
  filter(month == 1, day == 1)

# If you want to save the result as well as want to print it
(jan1 <- flights |> 
    filter(month == 1, day == 1)
)

# Flights department in November or December
flights |> 
  filter(month == 11 | month == 12)

# Flights that weren't delayed (on arrival or departure) by more than two hours
flights |> 
  filter(!(arr_delay > 120 | dep_delay > 120))
# or
flights |> 
  filter(arr_delay <= 120 & dep_delay <= 120)

# create a tibble with NA value in them
df <- tibble(x = c(1, NA, 3))
# now, select rows with NA
df |> 
  filter(is.na(x))

# Find all the flights had an arrival delay of two or more hours
View(flights |> 
  filter(arr_delay >= 2))

# Flights which flew to Houston (IAH or HOU)
flights |> 
  filter(dest == "IAH" | dest == "HOU")

# flights operated by United, American, or Delta
flights |> 
  filter(carrier %in% c("UA", "AA", "DL"))

# flights departed in summer (July, August, and September)
flights |> 
  filter(month %in% c(7,8,9))

# Arrived more than two hours late, but didn’t leave late
flights |> 
  filter(arr_delay >= 120 & dep_delay <= 0)

# Were delayed by at least an hour, but made up over 30 minutes in flight
flights |> 
  filter(arr_delay >= 60 & (dep_time - sched_dep_time)>= 30)

# Departed between midnight and 6 a.m. (inclusive)
flights |> 
  filter(dep_time >= 1 & dep_time <= 6)
# or
flights |> 
  filter(between(dep_time, 1, 6))

# How many flights have a missing dep_time
flights |> 
  filter(is.na(dep_time))

#### Arrange ####
# reorder by a column in descending order
View(flights |> 
  arrange(desc(arr_delay)))




