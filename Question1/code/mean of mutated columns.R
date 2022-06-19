country_insights <- function(data1=data1, data2=data2){
    top_group <- data1 |> top_frac(0.1, data2) |>
        mutate("Mortality rate of the already infected" = (total_deaths / total_cases)*100) |>
        mutate("Mortality rate of the population" = (total_deaths / population)*100) |>
        select(-c(1:2,4:10,18))
    bot_group <- data1 |> top_frac(-0.1, data2) |>
        mutate("Mortality rate of the already infected" = (total_deaths / total_cases)*100) |>
        mutate("Mortality rate of the population" = (total_deaths / population)*100) |>
        select(-c(1:2,4:10,18))
    topmean <- colMeans(top_group[,c(9:10)], na.rm = TRUE)
    botmean <- colMeans(bot_group[,c(9:10)], na.rm = TRUE)
    grouped <- rbind(topmean, botmean)
    df_grouped <- data.frame(grouped)
    df_grouped
}