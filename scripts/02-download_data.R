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
#download the data from the website and name it raw_data
raw_data <- read.csv(
  file = "https://projects.fivethirtyeight.com/polls/data/president_polls.csv")



#### Save data ####
#  write the raw_data to save it in the data file
write_csv(raw_data, "data/01-raw_data/raw_data.csv") 

         
