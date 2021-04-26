

load_aggr_consumption <- function(key = key
                                  ,start_date = start_date
                                  ,end_date = end_date){

### Loading libraries

if (!require(httr)) install.packages('httr') 
library(httr)
if (!require(dplyr)) install.packages('dplyr') 
library(dplyr)
if (!require(jsonlite)) install.packages('jsonlite') 
library(jsonlite)

### Calling the API
    
url <-  'https://jsonrpc.barry.energy/json-rpc#Get%20Aggeregated%20Consumption'
ContentType <- 'application/json'

body <- paste0('{
   "method": "co.getbarry.api.v1.OpenApiController.getAggregatedConsumption",
    "id": 0,
    "jsonrpc": "2.0",
    "params\": [\n    \"',start_date,'T01:00:00Z\",\n    \"',end_date,'T02:00:00Z\"\n    ]\n}')

post <- POST(url = url
             ,add_headers('Authorization' = paste("Bearer ",key)
                          ,'Content-Type' = ContentType)
             ,body = body)


data <- content(post,"text") %>% fromJSON()
data <- data$result
assign(x = "data",value = data,envir = .GlobalEnv)
}