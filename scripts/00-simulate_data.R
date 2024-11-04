#### Preamble ####
# Purpose: Simulates the downloaded raw data of president polls for further data cleaning
# Author: Yanfei Huang 
# Date: 02 November 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(lubridate)
library(arrow)

#### Set Seeds for furture check
set.seed(304)

#### Simulate Data ####

# randomly simulate 500 tickets in the poll 
tickets <- 500

#simulate  between 2014-2024
simulated_crime <- tibble(
  # Randomly simulate 1000 crime reports in random divisions and random crime type in 2014-2024
  reported_y = sample(year, size = crime, replace = TRUE),
  division = sample(division, size = crime, replace = TRUE),
  crime_type = sample(crime_types, size = crime, replace = TRUE),
  crime_towards = sample (crime_against, size = crime, replace = TRUE),
  cleared = sample(c(0, 1), size = crime, replace = TRUE, prob = c(0.5, 0.5))
)

head(simulated_crime)

##### Save simulated data ####
write_csv(simulated_crime, file = "data/raw_data/simulated_data.csv")








#### Simulate data ####
# State names
states <- c(
  "New South Wales",
  "Victoria",
  "Queensland",
  "South Australia",
  "Western Australia",
  "Tasmania",
  "Northern Territory",
  "Australian Capital Territory"
)

# Political parties
parties <- c("Labor", "Liberal", "Greens", "National", "Other")

# Create a dataset by randomly assigning states and parties to divisions
analysis_data <- tibble(
  division = paste("Division", 1:151),  # Add "Division" to make it a character
  state = sample(
    states,
    size = 151,
    replace = TRUE,
    prob = c(0.25, 0.25, 0.15, 0.1, 0.1, 0.1, 0.025, 0.025) # Rough state population distribution
  ),
  party = sample(
    parties,
    size = 151,
    replace = TRUE,
    prob = c(0.40, 0.40, 0.05, 0.1, 0.05) # Rough party distribution
  )
)


#### Save data ####
write_csv(analysis_data, "data/00-simulated_data/simulated_data.csv")
