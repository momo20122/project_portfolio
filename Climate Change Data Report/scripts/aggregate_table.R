# Aggregate Table


## Data about total Co2 emissions by country
annual_emissions <- read.csv("./data/annual-co2-emissions-per-country.csv",
                             stringsAsFactors = FALSE)

emissions_by_country <- annual_emissions %>%
  mutate(Country = Entity, Emissions_Tons = Annual.CO2.emissions..tonnes.) %>%
  group_by(Country) %>%
  summarize(CO2_Emitted = sum(Emissions_Tons))

## Data about pollution-related deaths in countries around the world
pollution_deaths <- read.csv("./data/death-rates-total-air-pollution.csv",
                             stringsAsFactors = FALSE)

pollution_deaths_by_country <- pollution_deaths %>%
  mutate(Country = Entity, Deaths = Death.Rates..per.100.000.) %>%
  group_by(Country) %>%
  summarize(Deaths_Pollution = sum(Deaths))

## Data about climate-focused projects funded by country
projects <- read.csv("./data/country-contributions.csv",
                     stringsAsFactors = FALSE)

projects_by_country <- projects %>%
  mutate(Pledged_Amt = as.numeric(gsub(",", "",
                                       Pledged..USD.million.current.))) %>%
  group_by(Country) %>%
  summarize(Project_Funds = sum(Pledged_Amt, na.rm = FALSE))

## Combining these data sets into an aggregate table
summary_table <- function(df_1, df_2, df_3) {
  first_step <- inner_join(df_1, df_2, by = "Country")
  country_summary <- left_join(first_step, df_3, by = "Country")
  table_arranged <- country_summary %>%
    arrange(desc(country_summary$CO2_Emitted))
  return(table_arranged)
}
table_col_names <- c("Country", "Co2 Emitted (Tons)",
                     "Pollution-Related Deaths",
                     "Project Funding (USD Mil)")

call_table <- function(df_1, df_2, df_3) {
  table <- kable(summary_table(df_1, df_2, df_3),
        col.names = table_col_names,
        caption = "Summary Table: Climate Change Statistics by Country",
        align = "lllll", digits = 2,
        longtable = TRUE,
        format.args = list(big.mark = ",", scientific = FALSE)) %>%
  kable_styling(latex_options = "scale_up")
return(table)
  }
