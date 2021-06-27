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
