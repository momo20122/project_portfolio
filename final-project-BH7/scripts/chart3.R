# Chart 3: Exploring change in Co2 Emissions Over Time


## Group by year to determine annual CO2 emissions and show trend over time
annual_emissions <- read.csv("./data/annual-co2-emissions-per-country.csv",
                             stringsAsFactors = FALSE)

emissions_by_year <- annual_emissions %>%
  mutate(Emissions_Tons = Annual.CO2.emissions..tonnes.) %>%
  group_by(Year) %>%
  summarize(CO2_Emitted = sum(Emissions_Tons))

## Create function that calls a plot to show trend of global CO2 emissions
timeline_emissions <- function(df) {
  timeline <- plot_ly(df, x = ~Year, y = ~CO2_Emitted, type = "bar",
          name = "CO2 Emissions") %>%
  layout(title = "Chart 3: Global Timeline of C02 Emissions",
         yaxis = list(title = "CO2 Emissions (in tons of carbon)"),
         xaxis = list(title = "Year"))
  return(timeline)
}
