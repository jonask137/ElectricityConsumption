
library(httr)
library(dplyr)
library(jsonlite)

## Getting spot prices

url <-  'https://jsonrpc.barry.energy/json-rpc#Get%20Spot%20Price'
ContentType <- 'application/json'

body <- '{
   "method": "co.getbarry.api.v1.OpenApiController.getPrice",
    "id": 0,
    "jsonrpc": "2.0",
    "params": [
     "DK_NORDPOOL_SPOT_DK1",
      "2021-04-23T01:00:00Z",
      "2021-04-23T02:00:00Z"
    ]
}'

post <- POST(url = url
             ,add_headers('Authorization' = paste("Bearer ",key)
                          ,'Content-Type' = ContentType)
             ,body = body)


content(post,"text") %>% fromJSON() -> data
View(data[["result"]])


## Retrieving metering points - This is some meta data

url <-  'https://jsonrpc.barry.energy/json-rpc#Get%20MeteringPoints'
ContentType <- 'application/json'

body <- '{
   "method": "co.getbarry.api.v1.OpenApiController.getMeteringPoints",
    "id": 0,
    "jsonrpc": "2.0",
    "params": []
}'

post <- POST(url = url
             ,add_headers('Authorization' = paste("Bearer ",key)
                          ,'Content-Type' = ContentType)
             ,body = body)


content(post,"text") %>% fromJSON() -> data



## Get Aggregated Consumption

url <-  'https://jsonrpc.barry.energy/json-rpc#Get%20Aggeregated%20Consumption'
ContentType <- 'application/json'

body <- '{
   "method": "co.getbarry.api.v1.OpenApiController.getAggregatedConsumption",
    "id": 0,
    "jsonrpc": "2.0",
    "params": [
    "2021-04-01T01:00:00Z",
    "2021-04-25T02:00:00Z"
    ]
}'

post <- POST(url = url
             ,add_headers('Authorization' = paste("Bearer ",key)
                          ,'Content-Type' = ContentType)
             ,body = body)


content(post,"text") %>% fromJSON() -> data
View(data[["result"]])
