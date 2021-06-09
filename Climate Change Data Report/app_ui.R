library(plotly)
library(shiny)
source("./app_scripts/map.R")
source("./app_scripts/scatter.R")
source("./app_scripts/timeline.R")
source("./app_scripts/organizing_data.R")


# Overview
overview_page <- tabPanel(
  "Overview",
  sidebarLayout(
    sidebarPanel(
      tags$h1(
        id = "title",
        "Climate Change Project"
      ),
      tags$img(
        id = "overview_img",
        src = "quotes-leo.png",
        height = 250,
        width = 500
      ),
      h4("Climate change is one of the most important issues in our world today.
      It is at the top of many news articles and the cause of rising global
      temperatures, melting glaciers, and degrading ecosystems. Throughout our
      lifetimes, we will face the consequences of climate change in many
      different ways. For this reason, we want to explore the issue of climate
      change and find out what countries around the world are doing to both
      contribute to and help solve this complex problem.")
    ),
    mainPanel(
      h3("Question 1:"),
      tags$h4(
        id = "question_1",
        "How are climate change causes, effects, and solutions spread between
        different countries around the world?"
      ),
      p("This question can be answered by applying all three datasets, which
      contain information on a country's CO2 emissions, the amount of money
      they put into climate-related projects, and death rate due to pollution,
      and incorporating them into a map chart. As a result, we could determine
      global patterns related to these variables between different countries."),

      h3("Question 2:"),
      tags$h4(
        id = "question_2",
        "Is there a correlation between a country's CO2 emissions, the amount
        of money they put into climate-related projects, and/or their death
        rate due to pollution?"
      ),
      p("This question can be answered through a scatterplot with axes
      representing two of the variables mentioned. Since there can only be
      two axes, we would have to make it so users can select a climate-change-
      related variable for each axis and as a result, see if there is a
      correlation and pattern between the two variables selected."),

      h3("Question 3:"),
      tags$h4(
        id = "question_3",
        "How has CO2 emissions changed over time?"
      ),
      p("This question can be answered through a bar chart where the x-axis
      is years and the y-axis is the total amount of CO2 emitted in a
      particular year, which we can gather from the \"Our World in Data\"
      dataset compiled by Ritchie and Roser. As a result, we could see how
      CO2 levels have progressed over time."),

      h3("Data Sources:"),
      h4("The data set regarding the contributors of climate finance from
      the multilateral climate change funds came from the \"Climate Funds
      Update\". The data to measure the Carbon Dioxide (CO2) in each region
      used an infrared sensor. This data was compiled by Hannah Ritchie and
      Max Roser from \"Our World in Data\" to analyze the annual territorial
      emissions of carbon dioxide (CO2) from fossil fuels and cement per
      country. Our pollution related death data is also from \"Our World in
      Data\" and was collected by the \"Global Burden of Disease
      Collaborative Network\" and published in the Global Burden of Disease
      Study 2017.")
    )
  )
)
  

# Chart 1: Map
map_page <- tabPanel(
  tags$p(
    id = "question_1",
    "Map",
  ),
  titlePanel("Map of Climate Change Variables"),
  sidebarLayout(
    sidebarPanel(
      radioButtons(inputId = "var_name",
                   label = h3("Select Variable for Display"),
                   choice <-
                     list("CO2 Emissions (tonnes)" = "CO2_Emitted",
                          "Pollution-Related Death Rate" = "Deaths_Pollution",
                          "Climate-Change Project Funding (USD Million)" =
                            "Project_Funds"),
                   selected = "CO2_Emitted"),
      selectInput("color", label = h3("Select Map Color"),
                  choices = list("Purple" = "Purples",
                                 "Blue" = "Blues",
                                 "Red" = "Reds",
                                 "Green" = "Greens"),
                  selected = "Blues")),
    mainPanel(
      plotlyOutput("map"),
      h4("This Chart Shows Us..."),
      p("This map helps us to visualize how each country around the
         globe causes, suffers from, and contributes to Climate Change
         (answering our first question in this project). The three
         different variables we measured appear on the left, and you
         may select the one you want displayed on the map. In
         correspondence to your choice, the shading on the map will
         change based on each country's level of the variable you
         selected. You can gage the level of this variable by looking
         to the legend on the right-hand side of the chart, and you
         can also hover over the country to get detailed information
         about its CO2 Emissions, Pollution-Related Deaths, and Project
         Funding Contributions. All of this information helps us to
         gain perspective on the issue of climate change, on a country
         basis. From here, we can take this information, delve into
         correlations between these individual variables, and draw
         conclusions on our findings.")
    )
  )
)

# Chart 2: Scatterplot
scatterplot_page <- tabPanel(
  tags$p(
    id = "question_2",
    "Scatterplot"
  ),
  titlePanel("Correlation of Climate Change Variables"),
  sidebarLayout(
    sidebarPanel(
      radioButtons(inputId = "x_var",
                   label = h3("Choose X-Variable"),
                   choice <-
                     list("CO2 Emitted" = "CO2_Emitted",
                          "Project Funds" = "Project_Funds",
                          "Death Rate from Pullution" = "Deaths_Pollution"),
                   selected = "CO2_Emitted"),
      radioButtons(inputId = "y_var",
                   label = h3("Choose Y-Variable"),
                   choice <-
                     list("CO2 Emitted" = "CO2_Emitted",
                          "Project Funds" = "Project_Funds",
                          "Death Rate from Pollution" = "Deaths_Pollution"),
                   selected = "Project_Funds")
    ),
    mainPanel(
      plotlyOutput("scatterplot"),
      h4("This Chart Shows Us..."),
      p("By default, this interactive scatterplot helps us to
      understand the relationship between a country's CO2 emissions
      in metric tonnes (CO2 Emitted) and the amount of money they
      put into climate-related projects (Project Funds) in USD
      millions. Doing so will also help us answer the question of
      which countries are contributing the most and the least to
      projects aimed at fighting climate change. The x-axis and
      y-axis can be selected and Deaths Pollution, a variable
      representing the death rate of a country due to pollution,
      can also be selected as one of the axes. Holding down the
      mouse button will bring up an adjustable box that zooms into
      the area inside the box when the mouse button is released,
      allowing you to see certain dots more clearly. Hovering over
      a dot will bring up its x-coordinate and y-coordinate, which
      each represent a certain climate-change statistic, and the
      name of the country.")
    )
  )
)

# Chart 3: Timeline
year_range <- range(emissions_by_year$Year)

min <- format(min(year_range), big.mark = "")
min_num <- as.numeric(min)
max <- format(max(year_range), big.mark = "")
max_num <- as.numeric(max)

timeline_page <- tabPanel(
  tags$p(
    id = "question_3",
    "Timeline"
  ),
  titlePanel("The Progression of Climate Change Over Time"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider", label = h3("Choose Date Range"), min = 1751,
                  max = 2017, value = c(1850, 2000), sep = ""),
      selectInput("type", label = h3("Select Graph Type"),
                  choices = list("Bar Chart" = "bar",
                                 "Line Chart" = "scatter"),
                  selected = "bar")
      ),
    mainPanel(
      plotlyOutput("timeline"),
      h4("This Chart Shows Us..."),
      p("This chart establishes the severity of climate change on a
         time-scale. On the left side of the screen, you will see a
         slider bar that allows you to choose the range of years that
         the chart includes. You will also see the option of changing
         the chart from a bar-layout to a line-layout, based on your
         preference. This chart shows us that CO2 emissions have
         increased exponentially and are still on the rise. This
         visualization helps us understand the reality of climate
         change, and our goal in including it is to hopefully spark
         concern that this issue needs attention now.")
    )
  )
)

# Summary Page
summary_page <- tabPanel(
  "Summary",
  sidebarLayout(
    sidebarPanel(
      h2("To Conclude..."),
      h4("Now more than ever, it is essential that countries play their
         part in both decreasing their annual CO2 emissions and contributing
         to the clean-up of climate change damage that has already been done.
         To solve this complex issue, countries around the world must work
         together and spread awareness of climate change and its severity.")
    ),
    mainPanel(
      tags$h1(
        id = "title",
        "Key Takeaways"),
      h3("1: CO2 Emissions Have Increased Exponentially Over Time"),
      p("Since the industrial revolution in the mid 1700s, carbon dioxide
        emissions (CO2) have increased. Since the early 1900s, innovation
        and further development in manufacturing, transportation, and
        production has caused emissions to increase at a much more
        rapid pace."),
      p("For example, if you view the Timeline tab, and hover over specific
        years, you will see that in 1751, total global CO2 emissions were
        18,702,056 tons. Then, in 2017, at the most recent datapoint, total
        global CO2 emissions increased to 53,319,489,185 tons. The CO2 Emissions
        have risen by over 28x during this time period."),
      p("The broader implications of this drastic increase are that (1) climate
        change is a severe problem that is not going to go away anytime soon,
        and (2) we, as a global society, will likely experience negative
        impacts from climate change in the near future because levels have
        risen to a \"tipping-point\" (in terms of global health)."),

      h3("2: Countries that Cause Climate Change Need to Contribute More To
         Solving the Issue"),
      p("By comparing the data presented in both the Map visualization and the
        Scatter Plot visualization (with CO2 & Project Funds as variables), it
        is clear that there is no real correlation between a country's CO2
        Emissions and their contributions towards climate change projects."),
      p("This is an excerpt of a summary table that encapsulates each of the
        variables displayed on the Map visualization. The table is sorted by
        CO2 Emissions and includes the top seven countries
        with the highest emission levels (furthering climate
        change impacts)."),

      img(src = "summary.png", height = 437.5, width = 1000),

      p("The highest ranking country (in terms of C02 emissions) is the United
        States, which is also the same country with the highest pledged towards
        climate change mitigation projects (in USD millions). This matches the
        expectation that we had about the correlation of these two variables.
        Germany, the United Kingdom, and Japan also follow this trend of high
        CO2 emissions and high amounts of project funding. However, other
        countries with CO2 emission levels at the top of the chart, such as
        China, Russia, and India, also have high rates of pollution-related
        deaths, but offer little to no funding to climate change projects.
        This data demonstrates a divide between countries that are large
        contributors to the cause of climate change but also the solution
        and countries that emit high levels of greenhouse gases, suffer from
        high rates of pollution-related deaths, but have yet to put resources
        towards mitigation of the problem."),
      p("The broader impact of this pattern, or rather, discrepancy, in our
        data is that simply not enough is being done to curb the impacts of
        CO2 emissions and climate change as a whole. While it would make sense
        that the culprits of greenhouse gas emissions would also be the ones
        doing the most to solve the issue, we instead find
        an inconsistent pattern. Moving forward, attention should be
        drawn to this inconsistency, and countries around the world need
        to be held responsible for doing their due diligence in mitigating
        climate change impacts."),

      h3("3: While Pollution-Related Deaths are Not Correlated to CO2 Emission
         Levels, There are Many Other Severe Impacts of Climate Change"),
      p("Coming into this project, our goal was to investigate if the
        countries that contributed the most to causing climate change
        (emitting Co2), are the same countries that have suffered the
        most from climate change impacts (using the metric of deaths
        by pollution) and have donated the most funding towards mitigating
        these impacts (in millions of USD contributed to climate change
        projects). While we just discussed the correlation of CO2 emissions
        (cause) and project funding (solution),  we also need to address
        the correlation between CO2 Emissions and pollution-related deaths."),
      p("While pollution is comprised of CO2, among other greenhouse gases,
        we assumed that higher levels of CO2 would cause a higher pollution-
        related death rate. However, as you can see in the table, above, as
        well as this screenshot from our scatterplot tab, below, we found
        no correlation between these two variables."),

      img(src = "scatterplot.png", height = 437.5, width = 1000),

      p("After reviewing the bulk of the data, it seems that the highest
        number of pollution-related deaths seem to relate less to the amount
        of CO2 that specific country emitted. The trend appears to be that
        pollution-related deaths occur most commonly in developing countries,
        where is is likely that the healthcare system is less advanced,
        leading to a higher number of pollution-related deaths."),
      p("In a more broad scope, this negative correlation does not mean that
        there are no negative impacts to climate change. While it turned out
        that pollution-related deaths was an inaccurate variable to use for
        measurement of the harms of climate change, there are many other
        implications of this issue. As mentioned in the overview tab,
        climate change is the cause of rising global temperatures, melting
        glaciers, and degrading ecosystems. With ever-rising CO2 levels, we
        can easily assume that these severe impacts of climate change will
        only become more prevalent.")
    )
  )
)

ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
    "Climate Change Analysis",
    overview_page,
    map_page,
    scatterplot_page,
    timeline_page,
    summary_page
  )
)