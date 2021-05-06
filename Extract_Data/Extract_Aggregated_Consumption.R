

load_aggr_consumption <- function(key
                                  ,start_date
                                  ,end_date){

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
    "params": [
    "',start_date,'T01:00:00Z",
    "',end_date,'T02:00:00Z"
    ]
}')

post <- POST(url = url
             ,add_headers('Authorization' = paste("Bearer ",key)
                          ,'Content-Type' = ContentType)
             ,body = body)

aggr_cons <- content(post,"text") %>% fromJSON()

if (names(aggr_cons)[3] == "result") {
    aggr_cons <- aggr_cons$result
    } else {
    print("Error with loading the data, see the messages in the object")
    }

assign(x = "aggr_cons",value = aggr_cons,envir = parent.frame())
}