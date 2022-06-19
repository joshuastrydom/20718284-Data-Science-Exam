specficmean <- function(data1=data1, data2=data2, data3=data3){
    top_group <- data1 |> top_frac(0.1, data2) |>
        select(contains(data3))
    topmean <- colMeans(top_group, na.rm = TRUE)
    bot_group <- data1 |> top_frac(-0.1, data2) |>
        select(contains(data3))
    botmean <- colMeans(bot_group, na.rm = TRUE)
    group <- rbind(topmean, botmean)
    df_group <- data.frame(group)
    df_group
}