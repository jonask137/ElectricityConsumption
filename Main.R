
library(dplyr)

source("Extract_Data/Extract_Aggregated_Consumption.R")

key <- '/g1Ox71OYwlpyzdaq7+MXkVYA+/wfrOOLdzOxNWIkiTDd7Dp4O6djPmx/qUISwvzKwiD9nt9t08nr2687MJ8mQFgE/bxV8eH2tNU8B0apbpqEBcBcPvlNAd2wWqhdkDJ8SJC/TdIYhsE+tRnvMMKHv0wE5awKc+dG7DQgD9nl1g='

start_date <- "2021-04-01" #YMD
end_date <- "2021-04-25" #YMD

load_aggr_consumption(key = key
                      ,start_date = start_date
                      ,end_date = end_date)

class(data)

summary(data)

data$result %>% head()
