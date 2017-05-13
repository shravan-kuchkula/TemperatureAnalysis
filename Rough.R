# Install a package and load it.
installRequiredPackages <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[,"Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

libs <- c("dplyr", "ggplot2", "tidyr")

# Read in the data set.
temps <- read_csv("TEMP.csv")

# Convert the Country column to factor
temps$Country <- as.factor(temps$Country)

# Use "%m/%d/%Y" format for dates starting from 1900, remaining will be NA's.
temps$Date <- as.Date(temps$Date, format = "%m/%d/%Y")

# remove na's
# group observations by country
# calculate tempDiff = maxTemp - minTemp
# arrange in descending order of tempDiff
tempsDiff <- temps %>%
  filter(!is.na(`Monthly AverageTemp`),
         !is.na(Date)) %>%
  group_by(Country) %>%
  summarise(minTemp = min(`Monthly AverageTemp`),
            maxTemp = max(`Monthly AverageTemp`)) %>%
  mutate(tempDiff = maxTemp - minTemp) %>%
  arrange(desc(tempDiff))

# Collect the top 20 countries
top20 <- head(tempsDiff, 20)

# Tell ggplot that it is an ordered factor, and order them based on tempDiff
top20$Country <- factor(top20$Country, levels=top20$Country[order(top20$tempDiff)])

# Plot top 20 countries and their temp differences
ggplot(top20, aes(x=Country, y=tempDiff)) +
  geom_bar(stat="identity") +
  labs(x = "top 20 countries", y ="Range of monthly avg temps") +
  coord_flip() +
  theme_light()



# Print BMWdata

temp_data <- rnorm(50, mean=0 , sd=1)
temp_data
