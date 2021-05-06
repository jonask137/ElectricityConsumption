
load_spotprices <- function(key
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
  
  url <- 'https://jsonrpc.barry.energy/json-rpc#Get%20Spot%20Price'
  ContentType <- 'application/json'
  
  
  body <- paste0('{
   "method": "co.getbarry.api.v1.OpenApiController.getPrice",
    "id": 0,
    "jsonrpc": "2.0",
    "params\": [\n     \"DK_NORDPOOL_SPOT_DK1\",\n      \"',start_date,'T01:00:00Z\",\n      \"',end_date,'T02:00:00Z\"\n    ]\n}')

  post <- POST(url = url
               ,add_headers('Authorization' = paste("Bearer ",key)
                            ,'Content-Type' = ContentType)
               ,body = body)
  
  spotprices <- content(post,"text") %>% fromJSON()
  
  if (names(spotprices)[3] == "result") {
    spotprices <- spotprices$result
  } else {
    print("Error with loading the data, see the messages in the object")
  }
  assign(x = "spotprices",value = spotprices,envir = parent.frame())
}