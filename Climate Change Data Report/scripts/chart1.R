# Chart 1: CO2 Emissions & Pollution-related Deaths

# Pollution Data
pollution_deaths <- read.csv("./data/death-rates-total-air-pollution.csv",
                             stringsAsFactors = FALSE)

pollution_deaths_by_country <- pollution_deaths %>%
  mutate(region = Entity, Deaths = Death.Rates..per.100.000.) %>%
  mutate(region = ifelse(region == "United States", "USA", region)) %>%
  mutate(region = ifelse(region == "United Kingdom", "UK", region)) %>%
  group_by(region) %>%
  summarize(Deaths_Pollution = sum(Deaths))

# Emissions Data
annual_emissions <- read.csv("./data/annual-co2-emissions-per-country.csv",
                             stringsAsFactors = FALSE)

emissions_by_country <- annual_emissions %>%
  mutate(region = Entity, Emissions_Tons = Annual.CO2.emissions..tonnes.) %>%
  mutate(region = ifelse(region == "United States", "USA", region)) %>%
  mutate(region = ifelse(region == "United Kingdom", "UK", region)) %>%
  group_by(region) %>%
  summarize(CO2_Emitted = sum(Emissions_Tons))

together <- inner_join(emissions_by_country,
                       pollution_deaths_by_country,
                       by = "region")

# World data
world_data <- map_data("world")

map_data <- left_join(together, world_data, by = "region")
write.csv(map_data, "./data/map_data.csv", row.names = FALSE)
map_data <- read.csv("./data/map_data.csv", stringsAsFactors = FALSE)
edited_map_data <- map_data[-c(90414)]

call_map <- function(df) {
  map <- ggplot(df, aes(long, lat, group = group)) +
  geom_polygon(aes(fill = CO2_Emitted), color = "white", size = .1) +
    scale_fill_continuous(low = "#132B43", high = "Red") +
    labs(title = "CO2 Emissions by Country",
         fill = "CO2 Emissions (in tons)")
  return(map)
}