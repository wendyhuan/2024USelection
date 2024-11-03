#### Preamble ####
# Purpose: Downloads and saves the data from fivethirtyeight website (https://projects.fivethirtyeight.com/polls/president-general/2024/national/)
# Author: Yanfei Huang
# Date: 02 November 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Download data ####
#download the data from the website
raw_data <- read.csv(
  file = "https://projects.fivethirtyeight.com/polls/data/president_polls.csv")



#### Save data ####
# name the raw data into raw_president_polls
write_csv(raw_president_polls, "data/01-raw_data/raw_data.csv") 

         
