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
The first comparision between countries was made between BRICS countries. The BRICS_insights and africa insights functions allow for the graphing of the results. 
'''

BRICS_countries <- c("Brazil", "Russia", "India", "China", "South Africa")
BRICS <- owid_covid_data |> filter(location == c("Brazil","Russia","India","China","South Africa"))

'''
The insights for the BRICS countries were made as follows

'''

BRICS_insights(BRICS)

'''
The insights for the African countries were made as follows

'''

africa_insights(africa)

'''

A variable called group was created to filter for variables of interest in trying to find specific concentrated groupings. Distinct patterns were found. 
'''

group <- owid_covid_data[,c(1:5,8,11,14,36,49,51:52,58:62)] |> 
    group_by(owid_covid_data$location) |> 
    arrange(owid_covid_data$date, .by_group = TRUE) |> 
    slice(c(n())) |> 
    ungroup()
    
'''
Each variable below was used to create the upcoming graphs. These variables, using a host of different functions, find the mean of the variable at hand at both the top 10% as well as the bottom 10% of the sample. These means are then combined with mortality rates of both the population in general and of the indiviuals that contracted Covid. 
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

'''
