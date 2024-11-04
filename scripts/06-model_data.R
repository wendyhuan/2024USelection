#### Preamble ####
# Purpose: Models of Trump and Harris percentage of vote with date and state 
# Author: Yanfei Huang
# Date: 02 November 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: Cleaned data set from data file
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(janitor)
library(lubridate)
library(broom)
library(modelsummary)
library(splines)
library(arrow)


#### Read data ####
state_data <- read_parquet("data/02-analysis_data/state_data.parquet")
national_data <- read_parquet("data/02-analysis_data/national_data.parquet")

#### Bayesian models and splines ####

# Change 'pollster' and 'state' to factor variables
national_data <- national_data |>
  mutate(
    pollster = factor(pollster),
    state = factor(state)
  )

state_data <- state_data |>
  mutate(
    pollster = factor(pollster),
    state = factor(state)
  )

# Fit Bayesian model with spline for prediction of the whole nation
spline_model_national <- stan_glm(
  pct ~ ns(end_date_num, df = 5), # Change df for the number of "bits" - higher numbers - more "wiggly" - but then need to worry about overfitting.
  data = national_data,
  family = gaussian(),
  prior = normal(0, 5),
  prior_intercept = normal(50, 10),
  seed = 304,
  iter = 2000,
  chains = 4,
  refresh = 0
)

# Fit Bayesian model with spline and state as fixed effect
spline_model_state <- stan_glm(
  pct ~ ns(end_date_num, df = 5) + state,
  data = state_data,
  family = gaussian(),
  prior = normal(0, 5),
  prior_intercept = normal(50, 10),
  seed = 304,
  iter = 2000,
  chains = 4,
  refresh = 0
)


#### Save model ####
saveRDS(
  spline_model_national,
  file = "models/model_national.rds"
)

saveRDS(
  spline_model_state,
  file = "models/model_state.rds"
)


