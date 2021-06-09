# Chart 2: Scatter Plot of CO2 Emissions and Funding of Climate Change Projects


contributions_emissions_plot <- function(contributions_df, co2_emissions_df) {
  sum_contributions_df <- contributions_df %>%
    group_by(Country) %>%
    summarize(
      total_pledged_USD_million =
        sum(as.numeric(gsub(
          ",", "",
          Pledged..USD.million.current.
        )), na.rm = FALSE)
    )

  sum_co2_emissions_df <- co2_emissions_df %>%
    group_by(Entity) %>%
    summarize(total_CO2_emissions_tonnes = sum(Annual.CO2.emissions..tonnes.))

  contributions_emissions_df <- na.omit(merge(
    x = sum_contributions_df,
    y = sum_co2_emissions_df,
    by.x = "Country",
    by.y = "Entity"
  ))

  contributions_emissions_plot <- plot_ly(
    data = contributions_emissions_df,
    x = ~total_CO2_emissions_tonnes,
    y = ~total_pledged_USD_million,
    type = "scatter",
    mode = "markers",
    name = ~Country,
    showlegend = F
  ) %>%
    layout(
      title = "Total Recorded CO2 Emissions vs.
           Total Funding for Climate-Related Projects",
      xaxis = list(title = "Total Recorded CO2 Emissions (tonnes)"),
      yaxis = list(title = "Total Funding for Climate-Related
                   Projects (USD million)")
    )
  return(contributions_emissions_plot)
}
