# 20718284-Data-Science-Exam
2022 exam submission
## Getting started

'''

devtools::install_github("Nicktz/fmxdat", force = TRUE)
CHOSEN_LOCATION <- "/Users/joshuastrydom/Desktop/ECONOMICS POSTGRADUATE/Masters/Data Science/20718284-Data-Science-Exam/"
fmxdat::make_project("/Users/joshuastrydom/Desktop/ECONOMICS POSTGRADUATE/Masters/Data Science/20718284-Data-Science-Exam/", Mac = TRUE)
fmxdat::make_project(FilePath = glue::glue("{CHOSEN_LOCATION}Solution/"), 
                     ProjNam = "20718284", Open = T)

Texevier::create_template(directory = glue::glue("{CHOSEN_LOCATION}Solution/20718284/"), template_name = "Question1")
Texevier::create_template(directory = glue::glue("{CHOSEN_LOCATION}Solution/20718284/"), template_name = "Question2")
Texevier::create_template(directory = glue::glue("{CHOSEN_LOCATION}Solution/20718284/"), template_name = "Question3")
Texevier::create_template(directory = glue::glue("{CHOSEN_LOCATION}Solution/20718284/"), template_name = "Question4")

'''

# Question 1
Much time was spent on data wrangling and manipulation. 

## Data
### BRICS comparison
The first comparision between countries was made between BRICS countries. The BRICS_insights and africa insights functions allow for the graphing of the results. 

'''

BRICS_countries <- c("Brazil", "Russia", "India", "China", "South Africa")

BRICS <- owid_covid_data |> filter(location == c("Brazil","Russia","India","China","South Africa"))

'''

The insights for the BRICS countries were made as follows

'''

BRICS_insights(BRICS)

'''

### African comparisons
The insights for the African countries were made as follows

'''

africa_insights(africa)

'''

### Concentrated groupings

A variable called group was created to filter for variables of interest in trying to find specific concentrated groupings. Distinct patterns were found. 

'''

group <- owid_covid_data[,c(1:5,8,11,14,36,49,51:52,58:62)] |> 
    group_by(owid_covid_data$location) |> 
    arrange(owid_covid_data$date, .by_group = TRUE) |> 
    slice(c(n())) |> 
    ungroup()    

'''

Each variable below was used to create the upcoming graphs. These variables, using a host of different functions, find the mean of the variable at hand at both the top 10% as well as the bottom 10% of the sample. These means are then combined with mortality rates of both the population in general and of the indiviuals that contracted Covid. The format of the data needed to be changed (made longer) in order to graph the data well. 

'''

life_expectancy <- specficmean(data1=group, data2=group$life_expectancy, data3 = "life_expectancy")

female_smokers <- specficmean(data1=group, data2=group$female_smokers, data3 = "female_smokers")

male_smokers <- specficmean(data1=group, data2=group$male_smokers, data3 = "male_smokers")

elderly <- specficmean(data1=group, data2=group$aged_65_older, data3 = "aged_65_older")

hospitalbeds <- specficmean(data1=group, data2=group$hospital_beds_per_thousand, data3 = "hospital_beds_per_thousand")

handwashing <- specficmean(data1=group, data2=group$handwashing_facilities, data3 = "handwashing_facilities")

life_expectancy_means <- country_insights(data1=group,data2=group$life_expectancy)

female_smokers_means <- country_insights(data1=group, data2=group$female_smokers)

male_smokers_means <- country_insights(data1=group, data2=group$male_smokers)

elderly_means <- country_insights(data1=group, data2=group$aged_65_older)

hospitalbeds_means <- country_insights(data1=group, data2=group$hospital_beds_per_thousand)

handwashing_means <- country_insights(data1=group, data2=group$handwashing_facilities)

merged_life_expectancy <- full(data4 = life_expectancy, data5 = life_expectancy_means)

setDT(merged_life_expectancy)

merged_female_smokers <- full(data4 = female_smokers, data5 = female_smokers_means)

setDT(merged_female_smokers)

merged_male_smokers <- full(data4 = male_smokers, data5 = male_smokers_means)

merged_elderly <- full(data4 = elderly, data5 = elderly_means)

merged_hospitalbeds <- full(data4 = hospitalbeds, data5 = hospitalbeds_means)

merged_handwashing <- full(data4 = handwashing, data5 = handwashing_means)

merged_life_expectancy1 <- merged_life_expectancy |> pivot_longer(!life_expectancy, names_to = "Variable", values_to = "Value")

merged_female_smokers1 <- merged_female_smokers|> pivot_longer(!female_smokers, names_to = "Variable", values_to = "Value")

merged_male_smokers1 <- merged_male_smokers |> pivot_longer(!male_smokers, names_to = "Variable", values_to = "Value")

merged_elderly1 <- merged_elderly |> pivot_longer(!aged_65_older, names_to = "Variable", values_to = "Value")

merged_hospitalbeds1 <- merged_hospitalbeds |> pivot_longer(!hospital_beds_per_thousand, names_to = "Variable", values_to = "Value")

merged_handwashing1 <- merged_handwashing |> pivot_longer(!handwashing_facilities, names_to = "Variable", values_to = "Value")

'''

#### Plotting

These plots were created to visualie the comparisons. 

'''

ggplot(merged_life_expectancy1, aes(x = life_expectancy, y = Value, fill = Variable))+
  geom_col(position = "dodge") +
  geom_text(aes(label = Value), size = 2, vjust = 1.5, position = position_dodge(.9)) +
  theme(text = element_text(size=7))

'''

'''

ggplot(merged_female_smokers1, aes(x = female_smokers, y = Value, fill = Variable))+
  geom_col(position = "dodge") +
  geom_text(aes(label = Value), size = 2, vjust = 1.5, position = position_dodge(.9)) +
  theme(text = element_text(size=7))

'''

'''

ggplot(merged_male_smokers1, aes(x = male_smokers, y = Value, fill = Variable))+
  geom_col(position = "dodge") +
  geom_text(aes(label = Value), size = 2, vjust = 1.5, position = position_dodge(.9)) +
  theme(text = element_text(size=7))

'''

'''

ggplot(merged_elderly1, aes(x = aged_65_older, y = Value, fill = Variable))+
  geom_col(position = "dodge") +
  geom_text(aes(label = Value), size = 2, vjust = 1.5, position = position_dodge(.9)) +
  theme(text = element_text(size=7))

'''

'''

ggplot(merged_hospitalbeds1, aes(x = hospital_beds_per_thousand, y = Value, fill = Variable))+
  geom_col(position = "dodge") +
  geom_text(aes(label = Value), size = 2, vjust = 1.5, position = position_dodge(.9)) +
  theme(text = element_text(size=7))

'''

'''

ggplot(merged_handwashing1, aes(x = handwashing_facilities, y = Value, fill = Variable))+
  geom_col(position = "dodge") +
  geom_text(aes(label = Value), size = 2, vjust = 1.5, position = position_dodge(.9)) +
  theme(text = element_text(size=7))

'''

### Hospitals and ICU patients

'''

hospitalICU <- owid_covid_data[,c(3,4,18,20,22,24,49,61)] |> drop_na()

hospitalICU1 <- hospitalICU |> 
    mutate(totalbeds = hospitalICU$population/1000) |> 
    mutate(beds = totalbeds*hospitalICU$hospital_beds_per_thousand) |> 
    group_by(hospitalICU$location) |> 
    slice(1) |> 
    ungroup()

hospitalICU2 <- hospitalICU |> 
    mutate(totalbeds = hospitalICU$population/1000) |> 
    mutate(beds = totalbeds*hospitalICU$hospital_beds_per_thousand) |> 
    group_by(hospitalICU$location) |> 
    slice(n()) |> 
    ungroup()

'''    

# Question 2

## Data

'''

library("lubridate")

london_weather[ , 1] <- ymd(london_weather[, 1])

'''

## Plotting

'''

monthlycloudcover(data1 = london_weather)

'''

'''

monthlysunshine(data1 = london_weather)

'''

'''

monthlymeantemp(data1 = london_weather)

'''

'''

monthlyprecipitation(data1 = london_weather)

'''

## Table

'''

Avecloudcover <- monthlycloudcover_table(data1 = london_weather)

Avesunshine <- monthlysunshine_table(data1 = london_weather)

Avemeantemp <- monthlymeantemp_table(data1 = london_weather)

Aveprecipitation <- monthlyprecipitation_table(data1 = london_weather)

'''

'''

library(xtable)

data <- data.frame(Avecloudcover, Avesunshine, Avemeantemp, Aveprecipitation)

table <- xtable(data, caption = "Average values throughout the year \\label{tab1}")
  print.xtable(table,
             # tabular.environment = "longtable",
             floating = TRUE,
             table.placement = 'H',
             # scalebox = 0.3,
             comment = FALSE,
             caption.placement = 'bottom'
             )

'''
