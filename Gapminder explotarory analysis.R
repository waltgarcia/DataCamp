#importing libraries
library(ggplot2)
library(dplyr)
library(scales)
library(plotly)

-----

#import dataset
install.packages("gapminder")
library(gapminder)

-----
#make a summary
str(gapminder)
summary(gapminder)

#make a table for continent per year
> table(gapminder$continent, gapminder$year)

-----

#visualizing population by year and continent
ggplot(by_year_continent, aes(x=year, y=totalPop, color = continent)) + 
  geom_point() +
  expand_limits(y = 0) 

------

#Visualizing median life expectancy over time
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))

# Create a scatter plot showing the change in medianLifeExp over time
ggplot(by_year, aes(x = year, y = medianLifeExp)) +
  geom_point() +
  expand_limits(y = 0)

------
  # Summarize medianGdpPercap within each continent within each year: by_year_continent
  by_year_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Plot the change in medianGdpPercap in each continent over time
ggplot(by_year_continent, aes(x = year, y = medianGdpPercap, color = continent)) +
  geom_point() +
  expand_limits(y = 0)

-----
# Comparing median life expectancy and median GDP per continent in 2007
by_continent_2007 <- gapminder %>%
filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(medianLifeExp = median(lifeExp),
            medianGdpPercap = median(gdpPercap))

# Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007, aes(x=medianGdpPercap, y = medianLifeExp, color = continent)) +
  geom_point()

-----
# line plot, as example
ggplot(year_continent, aes(x= year, y= meanLifeExp, color = continent)) +
  geom_line() + 
  expand_limits(y = 0)

#visualizing median GDP per capita over time
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianGdpPercap = median(gdpPercap))

#make a plot line
ggplot(data = by_year, aes(x = year, y = medianGdpPercap))+
  geom_line() +
  expand_limits(y = 0)

-----
  

  