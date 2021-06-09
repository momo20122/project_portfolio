# Final Project Brainstorm
**Group Members:** Hannah Yerex, Monty Morawan, Nawal Shego
________________________________________________________________
#### **Climate Change**
_Climate change is one of the most important issues in our world today. It is at the top of many news articles and the cause of rising global temperatures, melting glaciers, and degrading ecosystems. Throughout our lifetimes, we will face the consequences of climate change in many different ways. For this reason, we want to explore the issue of climate change and find out what countries around the world are doing to both contribute to and help solve this complex problem._
____________________________________________________________

#### **Other Data-driven Projects**

* **Green Climate Fund (GCF) [Project](https://unfccc.int/climatefinance/gcf/gcf_data)**

  This project, completed by the _United Nations Framework Convention on Climate Change_, utilizes an interactive map to show and describe the climate change projects by country. This program was developed to assist developing countries respond to and counter the impacts of climate change. The map initially shows the number of projects running, by country, but you can click on each country to expand upon the project details including cost, project name, sector, and duration.

* **Our World in Data - CO2 and Greenhouse Gas Emissions [Project](https://ourworldindata.org/co2-and-other-greenhouse-gas-emissions)**

  This project, completed by Hannah Ritchie and Max Roser and published to a website titled _Our World in Data_, aimed to reveal the effects of climate change by tracking global rising temperatures and CO2 levels over many years and organizing the data into scatterplots. In summary, the data revealed that global average temperatures have increased by more than one degree celsius since pre-industrial times and CO2 concentrations in the atmosphere are at their highest in over 800,000 years.

* **2018 EPI [Results](https://epi.envirocenter.yale.edu/epi-topline) (Yale University)**

  This project, conducted by Yale University, ranks 180 countries based on their environmental performance index (EPI)  score, which is determined by performance indicators that cover categories related to environmental health and ecosystem vitality. As a result, each EPI score is a general representation of a country’s environmental performance.



#### **Our Data-driven Questions**

* **How is each country/region contributing to the negative impacts of climate change, annually?**

  This question can be answered by looking into datasets that contain information about each country's actions contributing to climate change. If we want to narrow in on global warming caused by greenhouse gas emissions, we could find a dataset documenting the amount of greenhouse gas emissions by country/region. The data could then be analyzed to determine which countries/regions are emitting the most amount of greenhouse gases and which ones are emitting the lowest amount, therefore giving us a proxy to how each country is contributing to global warming/climate change.


* ** **

  This question can be answered by looking into the Green Climate Fund data (mentioned above) and aggregating the amounts contributed to climate change projects per country. This data would need to be expanded to include _all_ countries, not just developing ones. Another dataset that could be useful in answering this question is the EPI Results from Yale University. As this is ranking countries based on their environmental performance, this data could also show which countries are making the greatest strides towards decreasing their climate change impact.

* **Which countries are being impacted the most from climate change around the world? Why is the impact so large in these countries, specifically?**

  This question could be a bit broad, because climate change presents itself in many different forms. One area that is particularly interesting is pollution, as this is directly tied to climate change and global warming (both caused by greenhouse gas emissions, see [this](https://www.unenvironment.org/news-and-stories/story/air-pollution-and-climate-change-two-sides-same-coin) source for more information). There is data describing death rates attributed to pollution, so this could be summarized by country to give a metric that demonstrates which countries have the highest pollution-related deaths. To answer the second part of the question, it would be interesting to compare this pollution-related death rate to the amount of greenhouse gases each country is releasing. This could draw a correlation between the two rates per country.

#### **Finding Data**

* **Contributions to Fighting Climate Change, by Country [(source)](https://climatefundsupdate.org/data-dashboard/#1541245664327-538690dc-b9a8)**

  * The data was collected from multilateral climate funds that are regularly monitored by a website called the _Climate Funds Update_. This organization lists their data [sources](https://climatefundsupdate.org/about-us/notes-and-methodology/) as: fund websites, official reporting to international organizations from funds and by contributor organizations, and documents such as press releases, key decisions taken at conferences or meetings, and information from civil society organizations. The data summarizes each fund's contributing country and the amount pledged. It also provides further links to gain more information on each fund if necessary or desired.

  * There are 25 features and 2,124 observations in the dataset.

  * Using the data, we can answer the question of which countries are making the greatest contributions to decreasing greenhouse gas emissions and preventing further climate change impacts. Each observation is a project conducted by a specific country that aims to improve the environment in some way, and columns include the country from which the project originated and the amount of funding it has. As a result, we can filter the dataset to contain only projects related to decreasing emissions and group by country to see which ones have paid the most amount of money to fund these projects.

* **Annual Co2 Emissions, by Country [(source)](https://ourworldindata.org/co2-and-other-greenhouse-gas-emissions)**

  * For this data, information from before 1959 was sourced from the archived Carbon Dioxide Information Analysis Centre (CDIAC), available in full detail [here](http://cdiac.ornl.gov/). Data from 1959 and onward was sourced directly from the Global Carbon Project 2018, available [here](https://doi.org/10.5194/essd-10-2141-2018), but GCP gets its data from CDIAC as well. To measure the Carbon Dioxide (CO2) in each region, an infrared sensor is used. This data was compiled by Hannah Ritchie and Max Roser from _Our World in Data_ to analyze the annual territorial emissions of carbon dioxide (CO₂) from fossil fuels and cement per country.

  * There are 4 features and 20,487 observations in the data set.

  * This data provides an excellent answer to our question of how each country is contributing to the negative impacts of climate change, specifically global warming. The project we pulled this dataset from discusses overall rising temperatures and CO2 levels in the atmosphere for the past 30-50 years, with the purpose of identifying overall global warming and climate change. We narrowed in on this one specific dataset covering Annual Co2 Emissions by country, as we intend to compare this data to the other datasets mentioned in this "Finding Data" section and eventually reach our goal (outlined below).

* **Share of Deaths Attributed to Air Pollution, by Country [(source)](https://ourworldindata.org/air-pollution)**
  * This data was collected by the Global Burden of Disease Collaborative Network and published in the Global Burden of Disease Study 2017. The input for their data comes from hundreds of [sources](http://ghdx.healthdata.org/gbd-2017/data-input-sources?components=4), most of which are isolated case studies identifying a particular region and a particular cause of death. The researchers who published the project on _Our World in Data_ isolated the causes of death that were respiratory and related to pollution from 1990 to 2017.

  * There are 4 features and 6,413 observations in the data set.

  * As pollution is caused by greenhouse gas emissions and this data shows deaths related to pollution, this data will be great for finding the countries that are being impacted the most from global warming/climate change. While deaths from pollution are just one of the many impacts of climate change around the world, it is very substantial data that demonstrates the immense harms of this issue. The first step of our goal in this project is to determine if there is a positive correlation between high greenhouse gas levels and pollution-related deaths in countries around the world, so this data is crucial in reaching that conclusion.

________________________________________________________________
#### Our Goal is to Find...
##### Are the countries with _high CO2 emissions_ AND _high pollution-related deaths_ also dedicating the most _resources_ towards climate change prevention?
