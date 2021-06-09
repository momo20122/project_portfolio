# Organizing Data

# We started with three individual datasets. This file combines them
# and summarizes them to calculate the variables we need for each of
# our charts.

## Load Packages
library(dplyr)

# GROUP DATA BY COUNTRY FOR MAP & SCATTER PLOT

## Data about total Co2 emissions, grouped by COUNTRY
annual_emissions <- read.csv("./data/annual-co2-emissions-per-country.csv",
                             stringsAsFactors = FALSE)

emissions_by_country <- annual_emissions %>%
  mutate(Country = Entity, Emissions_Tons = Annual.CO2.emissions..tonnes.) %>%
  group_by(Country) %>%
  summarize(CO2_Emitted = sum(Emissions_Tons))

## Data about pollution-related deaths, grouped by COUNTRY
pollution_deaths <- read.csv("./data/death-rates-total-air-pollution.csv",
                             stringsAsFactors = FALSE)

pollution_deaths_by_country <- pollution_deaths %>%
  mutate(Country = Entity, Deaths = Death.Rates..per.100.000.) %>%
  group_by(Country) %>%
  summarize(Deaths_Pollution = round(sum(Deaths), 2))

## Data about climate-focused projects funded, grouped by COUNTRY
projects <- read.csv("./data/country-contributions.csv",
                     stringsAsFactors = FALSE)

projects_by_country <- projects %>%
  mutate(Pledged_Amt = as.numeric(gsub(",", "",
                                       Pledged..USD.million.current.))) %>%
  group_by(Country) %>%
  summarize(Project_Funds = sum(Pledged_Amt, na.rm = FALSE)) %>%
  mutate(Project_Funds = as.numeric(Project_Funds, digits = 2))

## Data about country codes to use for mapping
country_codes <- read.csv("./app_data/country_codes.csv",
                          stringsAsFactors = FALSE)

## Merging first two datasets together, grouped by COUNTRY
together <- inner_join(emissions_by_country,
                       pollution_deaths_by_country,
                       by = "Country")

## Merging final dataset with first two, grouped by COUNTRY
all_together <- left_join(together, projects_by_country, by = "Country")

# Join all data sets, grouped by COUNTRY
map_data <- left_join(all_together, country_codes, by = "Country")

## Change NA values to 0 in map_data
map_data[is.na(map_data)] <- 0

## Add Hover Columns for Display Purposes
map_data <- map_data %>%
  mutate(Hover = paste0(Country, "<br>",
                        "CO2 Emitted: ",
                        format(round(CO2_Emitted, 1), big.mark = ","),
                            " (tons C02)", "<br>",
                        "Pollution Deaths: ",
                        format(Deaths_Pollution, big.mark = ","),
                        " (deaths/100,000)", "<br>",
                        "Project Funding: ", "$", Project_Funds))

# GROUP DATA BY YEAR FOR TIMELINE CHART

## Read emissions and pollution csv files, filter & group by date
annual_emissions <- read.csv("./data/annual-co2-emissions-per-country.csv",
                             stringsAsFactors = FALSE)

emissions_by_year <- annual_emissions %>%
  mutate(Emissions_Tons = Annual.CO2.emissions..tonnes.) %>%
  group_by(Year) %>%
  summarize(Emissions_Tons = sum(Emissions_Tons)) %>%
  mutate(Hover = paste0("Year: ", Year, "<br>",
                           "CO2 Emitted: ",
                        format(Emissions_Tons, big.mark = ","),
                        " (tons CO2)"))
