# 0-Clean.R


library(dplyr)
library(lubridate)
storms <- read.csv("storms.csv", header= FALSE)

storms <- storms  %>% 
  mutate(time = ymd_h(paste(year, month, day, hour))) %>%
  select(name,year,time,lat,long,pressure,wind,type)
<<<<<<< HEAD
write.csv(storms, file="storms.csv", row.names = FALSE)
##################
=======
write.csv(storms, file="storm.csv", row.names = FALSE)

>>>>>>> a614f0c5da60b4bfdcad4a9c61f96a35bdb65500

