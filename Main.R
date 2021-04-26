
library(dplyr)

source("Extract_Data/Extract_Aggregated_Consumption.R")
source("Extract_Data/load_spotprices.R")
source(".envr.R")

start_date <- "2021-04-01" #YMD
end_date <- as.character(Sys.Date()) #YMD

load_aggr_consumption()
load_spotprices()

saveRDS(object = data,"Data/Data.R")

