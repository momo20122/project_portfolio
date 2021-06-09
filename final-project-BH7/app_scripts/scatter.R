# Chart 2: ScatterPlot

## Function to create organized dataframe
get_new_df <- function(map_data, x_var, y_var) {
  return(na.omit(map_data %>%
                   select(Country, x_var, y_var, Hover)))
}

## Function to call scatter plot
build_scatterplot <- function(new_df, x_var, y_var) {
  plot_ly(
    data = new_df,
    x = ~ (get(x_var)),
    y = ~ (get(y_var)),
    type = "scatter",
    mode = "markers",
    name = ~Country,
    text = ~Hover,
    showlegend = F
  ) %>%
    layout(
      title = paste0(
        gsub("_", " ", x_var),
        " Vs. ",
        gsub("_", " ", y_var)
      ),
      xaxis = list(title = gsub("_", " ", x_var)),
      yaxis = list(title = gsub("_", " ", y_var))
    )
}
