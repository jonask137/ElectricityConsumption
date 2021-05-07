
library(dplyr)

### Extracting data using the API ----

source("Extract_Data/Extract_Aggregated_Consumption.R")
source("Extract_Data/load_spotprices.R")
source(".envr.R")

if (!file.exists("Data/Data.rds")) {
  print("The data is not loaded, pulling the data from Barry")
} else {
  print("Loading data ...")
  Data <- readRDS("Data/Data.rds")
}

if (difftime(time1 = Sys.time(),time2 = Data$LastExtraction,units = "hours") > 1) {
  
  start_date <- "2021-04-01" #YMD
  end_date <- as.character(Sys.Date())#as.character(Sys.Date()) #YMD
  
  load_aggr_consumption(key = key,start_date = start_date,end_date = end_date)
  load_spotprices(key = key,start_date = start_date,end_date = end_date)
  
  Data <- list("LastExtraction" = Sys.time(),"Raw_data" = NA)
  Data$Raw_data <- list("AggrConsumption" = NA,"spotprices" = NA)
  
  Data$Raw_data$AggrConsumption <- aggr_cons
  Data$Raw_data$spotprices <- spotprices
  
  saveRDS(object = Data,"Data/Data.rds")
  
} else {
  print("It is less than an ago, since you last extracted the data, hence new data will not be loaded.")
}


### Preparing a dataframe with consumption aggregations ----

df <- Data$Raw_data$AggrConsumption[,2:4]
df$date <- df$start %>% substr(start = 1,stop = 10)
df$date <- as.Date(x = df$date)
df$start <- df$start %>% substr(start = 12,stop = 16)
df$end <- df$end %>% substr(start = 12,stop = 16)
df$weekday <- weekdays(df$date) %>% as.factor()
df$month <- months(df$date) %>% as.factor()

col_order <- c("quantity","date","start","end","weekday","month")
df <- df[,col_order]

df <- as_tibble(df)

Data$Clean_data$AggrConsumption <- df

saveRDS(object = Data,"Data/Data.rds")

### Adding information on the spot price ----
