# Chart 1: Map

library(plotly)
library(dplyr)

# Specify map projection/options
build_map <- function(df, var_name, color) {
# Configure Title depending on input
   title <- if (var_name == "CO2_Emitted") {
    paste("CO2 Emissions (in tons)")
  } else if (var_name == "Deaths_Pollution") {
    paste("Pollution Deaths (per 100,000)")
  } else if (var_name == "Project_Funds") {
    paste("Project Funds (USD Million)")
  }
# Configure tick mark depending on input
   tick <- if (var_name == "CO2_Emitted") {
     paste("")
   } else if (var_name == "Deaths_Pollution") {
     paste("")
   } else if (var_name == "Project_Funds") {
     paste("$")
   }

# Configure map
  map <- plot_geo(df) %>%
    add_trace(
      z = ~get(var_name), color = ~get(var_name), colors = ~color,
      text = ~Hover, locations = ~Code,
      marker = list(line = list(color = toRGB("grey"), width = 0.5))
    ) %>%
    colorbar(title = title, tickprefix = tick) %>%
    layout(geo = list(showframe = T, showcoastlines = F,
                 projection = list(type = "Mercator")
      ))
  return(map)
}
