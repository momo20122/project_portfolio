# Summary Info
annual_emissions <- read.csv("./data/annual-co2-emissions-per-country.csv",
                             stringsAsFactors = FALSE)
pollution_deaths <- read.csv("./data/death-rates-total-air-pollution.csv",
                             stringsAsFactors = FALSE)
projects <- read.csv("./data/country-contributions.csv",
                     stringsAsFactors = FALSE)

emissions_by_country <- annual_emissions %>%
    mutate(Country = Entity,
           Emissions_Tons = Annual.CO2.emissions..tonnes.) %>%
    group_by(Country) %>%
    summarize(CO2_Emitted = sum(Emissions_Tons))

pollution_deaths_by_country <- pollution_deaths %>%
    mutate(Country = Entity, Deaths = Death.Rates..per.100.000.) %>%
    group_by(Country) %>%
    summarize(Deaths_Pollution = sum(Deaths))

projects_by_country <- projects %>%
    mutate(Pledged_Amt = as.numeric(gsub(",", "",
                                         Pledged..USD.million.current.))) %>%
    group_by(Country) %>%
    summarize(Project_Funds = sum(Pledged_Amt, na.rm = FALSE))


total_co2 <- sum(emissions_by_country$CO2_Emitted,
                              na.rm = FALSE)
total_co2 <- prettyNum(total_co2, big.mark = ",", scientific = FALSE)
total_co2 <- paste0(total_co2, " (tons of Carbon)")

total_funding <- sum(projects_by_country$Project_Funds,
                       na.rm = FALSE)
total_funding <- prettyNum(total_funding, big.mark = ",")
total_funding <- paste0("$", total_funding, " (in USD millions)")

top_3_co2_countries <- emissions_by_country %>%
    arrange(desc(CO2_Emitted)) %>%
    slice(1, 3, 6) %>%
    pull(Country)
  
top_3_emissions <- paste0(top_3_co2_countries[1], ", ",
                          top_3_co2_countries[2], ", ",
                          "and ", top_3_co2_countries[3])

top_3_contributors <- projects_by_country %>%
    arrange(desc(Project_Funds)) %>%
    slice(1:3) %>%
    pull(Country)

top_3_contributions <- paste0(top_3_contributors[1], ", ",
                          top_3_contributors[2], ", ",
                          "and ", top_3_contributors[3])
  
global_pollution_death_rate <- pollution_deaths_by_country %>%
    arrange(desc(Country)) %>%
    slice(4) %>%
    pull(Deaths_Pollution)

global_pollution_death_rate <- round(global_pollution_death_rate,
                                     digits = 2)
global_pollution_death_rate <- prettyNum(global_pollution_death_rate,
                                         big.mark = ",")
global_pollution_death_rate <- paste0(global_pollution_death_rate,
                                      " (per 100,000 deaths)")

get_summary_info <- function(emissions_df, pollution_df,
                               contribution_df) {
  summary_info_list <- list(
    total_co2, total_funding, top_3_emissions,
    top_3_contributions, global_pollution_death_rate)
  return(summary_info_list)
}
