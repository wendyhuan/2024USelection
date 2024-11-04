#### Preamble ####
# Purpose: Cleans the raw plane data recorded by Trump and Harris with national data and state data
# Author: Yanfei Huang
# Date: 02 November 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: Downloaded the data from fivethirtyeight.com
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(lubridate)
library(arrow)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv")

# Clean the data for prediction of the whole nation
national_data <- 
  raw_data |>
  # filter only the high-quality pollsters
  filter(numeric_grade >= 2.9,
         # filter target candidate
         candidate_name == "Donald Trump" 
         | candidate_name == "Kamala Harris") |> 
  # obtain end date of the polls
  mutate(end_date = mdy(end_date)) |>
  # choose data during half a year before the election (Nov 5, 2024)
  filter(end_date >= as.Date("2024-05-05")) |> 
  # convert binary variable hypothesis into value 1 and 0
  mutate(hypothetical = ifelse(hypothetical == "TRUE", 1, 0)) |> 
  # select columns needed for analysis
  select(pollster, end_date, sample_size, state, hypothetical,party, answer, pct) |>
  # change date to be number of days since half year ago - it's a counter not a date
  mutate(end_date_num = as.numeric(end_date - min(end_date))) |>
  # need vote in number not percent for some models
  mutate(num_vote = round((pct / 100) * sample_size, 0))

# Remove all missing values to clean data for prediction of each state
state_data <-
  national_data |> tidyr::drop_na()


#### Save data ####
# save the data file into csv and the parquet file
write_csv(state_data, "data/02-analysis_data/state_data.csv")
write_parquet(state_data, "data/02-analysis_data/state_data.parquet")

