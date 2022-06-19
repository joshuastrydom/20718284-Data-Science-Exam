BRICS_insights <- function(BRICS){
    library(dplyr)
    data <- BRICS[c(5,8,11,14,36,49)] |>
        group_by(BRICS$location) |>
        slice(c(n())) |>
        ungroup()
    data[is.na(data)] <- 0
    names(data)[7] <- "Location"
    dataframe <- data.frame(data) |>
        mutate("Mortality rate of the already infected" = (total_deaths / total_cases)*100) |>
        mutate("Mortality rate of the population" = (total_deaths / population)*100) |>
        mutate("Proportion of population vaccinated" = ((people_vaccinated / population)))
    dataframe[,8:10] = round(dataframe[,8:10], digits = 3)
    library(ggplot2)
    library(tidyr)
    dfm <- dataframe[,7:10] |> pivot_longer(!Location, names_to = "Variable", values_to = "Value")
    ggplot(dfm, aes(x = Location, y = Value, fill = Variable)) +
        geom_col(position = "dodge") +
        geom_text(aes(label = Value), size = 2, vjust = 1.5, position = position_dodge(.9))
}