# Chart 3: Timeline

library(dplyr)
library(plotly)

## Create function to call timeline chart in server file
timeline_chart <- function(df, year_range, type) {
  new_df <- df %>%
    filter(Year >= year_range[1]) %>%
    filter(Year <= year_range[2])
  if (type == "bar") {
  timeline <- plot_ly(new_df, x = ~Year, y = ~Emissions_Tons,
                      type = "bar", name = "CO2 Emissions",
                      text = ~Hover) %>%
    layout(title = "CO2 Emissions Over Time",
           yaxis = list(title = "CO2 Emissions (in tonnes)"),
           xaxis = list(title = "Year"))
  } else if (type == "scatter") {
    timeline <- plot_ly(new_df, x = ~Year, y = ~Emissions_Tons,
                        name = "CO2 Emissions",
            text = ~Hover, type = "scatter", mode = "lines") %>%
      layout(title = "CO2 Emissions Over Time",
                    yaxis = list(title = "CO2 Emissions (in tonnes)"),
                    xaxis = list(title = "Year"))
  }
  return(timeline)
}