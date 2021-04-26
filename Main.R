
library(dplyr)

source("Extract_Data/Extract_Aggregated_Consumption.R")
source(".envr.R")

start_date <- "2021-04-01" #YMD
end_date <- "2021-04-25" #YMD

load_aggr_consumption(key = key
                      ,start_date = start_date
                      ,end_date = end_date)

data$result %>% head()
