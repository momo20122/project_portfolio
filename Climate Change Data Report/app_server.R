library(dplyr)
library(plotly)
library(shiny)

# Server Input/Output
server <- function(input, output) {
  output$map <- renderPlotly({
    build_map(map_data, input$var_name, input$color)
  })

  output$scatterplot <- renderPlotly({
    new_df <- get_new_df(map_data, input$x_var, input$y_var)
    build_scatterplot(new_df, input$x_var, input$y_var)
  })

  output$timeline <- renderPlotly({

    timeline_chart(emissions_by_year, input$slider, input$type)
  })
}