monthlysunshine <- function(data1=data1){
  library(data.table)
  January <- data1 |> filter(month(date) == 1) |> select(,c(date,sunshine))
  Jan <- mean(January[,2], na.rm = TRUE)
  Febuary <- data1 |> filter(month(date) == 2) |> select(,c(date,sunshine))
  Feb <- mean(Febuary[,2], na.rm = TRUE)
  March <- data1 |> filter(month(date) == 3) |> select(,c(date,sunshine))
  Mar <- mean(March[,2], na.rm = TRUE)
  April <- data1 |> filter(month(date) == 4) |> select(,c(date,sunshine))
  Apr <- mean(April[,2], na.rm = TRUE)
  May <- data1 |> filter(month(date) == 5) |> select(,c(date,sunshine))
  May <- mean(May[,2], na.rm = TRUE)
  June <- data1 |> filter(month(date) == 6) |> select(,c(date,sunshine))
  Jun <- mean(June[,2], na.rm = TRUE)
  July <- data1 |> filter(month(date) == 7) |> select(,c(date,sunshine))
  Jul <- mean(July[,2], na.rm = TRUE)
  August <- data1 |> filter(month(date) == 8) |> select(,c(date,sunshine))
  Aug <- mean(August[,2], na.rm = TRUE)
  September <- data1 |> filter(month(date) == 9) |> select(,c(date,sunshine))
  Sep <- mean(September[,2], na.rm = TRUE)
  October <- data1 |> filter(month(date) == 10) |> select(,c(date,sunshine))
  Oct <- mean(October[,2], na.rm = TRUE)
  November <- data1 |> filter(month(date) == 11) |> select(,c(date,sunshine))
  Nov <- mean(November[,2], na.rm = TRUE)
  December <- data1 |> filter(month(date) == 12) |> select(,c(date,sunshine))
  Dec <- mean(December[,2], na.rm = TRUE)
  df <- rbind(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
  df1 <- as.data.frame(df)
  setDT(df1, keep.rownames = "Month")[]
  ggplot(df1, aes(x = Month, y = V1)) +
    geom_point() +
    labs(y = "Sunshine", title = "Mean sunshine in London")
}