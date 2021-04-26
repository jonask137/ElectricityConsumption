

### Preparing a dataframe with consumption aggregations ----

df <- data[,2:4]
df$date <- df$start %>% substr(start = 1,stop = 10)
df$date <- as.Date(x = df$date)
df$start <- df$start %>% substr(start = 12,stop = 16)
df$end <- df$end %>% substr(start = 12,stop = 16)
df$weekday <- weekdays(df$date) %>% as.factor()
df$month <- months(df$date) %>% as.factor()

col_order <- c("quantity","date","start","end","weekday","month")
df <- df[,col_order]

df <- as_tibble(df)


### Adding information on the spot price ----