# 2024 US election foreseeing

## Overview

This repository provides an overview of the forecasting of the 2024 US presidential election. Using data reported from polls collected by fivethirtyeight.com, we analyze the crime type and crime target under different districts of . Our finding reveals that the crime types shift around time, with a marked rise in property-related crimes within ten years. These insights can help shape a comprehensive understanding of crime dynamics in Toronto during the 2014-2024 period and contribute to discussions on improving public safety and crime prevention strategies.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from fivethirtyeight.com.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models.
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `scripts` contains the R scripts used to simulate, download, clean, and test data.

## Statement on LLM usage

ChatGPT4o (4o-mini) was used as an LLM for this project. Debugging, formatting, and commenting were done using LLM. All chat history for the LLM usage can be found in the `inputs/llm/usage.txt` folder.
