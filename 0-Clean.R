# 0-Clean.R


library(dplyr)
library(lubridate)
storms <- read.csv("storms.csv", header= FALSE)

storms <- storms  %>% 
  mutate(time = ymd_h(paste(year, month, day, hour))) %>%
  select(name,year,time,lat,long,pressure,wind,type)
write.csv(storms, file="storms.csv", row.names = FALSE)


