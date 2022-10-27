library(dplyr)
library(stats)
library(ggplot2)
library(patchwork)
library(nycflights13)
data("flights")
data("airports")

fligths %>% dplyr::select(origin, dest)

# create de function
# Selecting data from both table and creating a new table
fligths2 <- flights%>%select(origin,dest,dep_delay, arr_delay)
airports2 <- airports%>%select(faa, lat, lon)
table <- fligths2 %>% left_join(airports2, c("dest" = "faa"))

#Count of values missing per column
# table%>%summarise(origin_NA = sum(is.na(origin)),
#                   destination_NA = sum(is.na(dest)),
#                   delay_NA = sum(is.na(dep_delay)),
#                   Lattitude_NA = sum(is.na(lat)),
#                   Longitude_NA = sum(is.na(lon))
# )

# Taking na or empty values
table <- table%>% na.omit()
#add another table with the rows that have na cells
by_dest <- group_by(table, dest, lat, lon)
#
delay <- summarise(by_dest,
                   count = n(),
                   count_missing = sum(is.na(arr_delay)),
                   perc_missing = (count_missing/count)*100,
                   #dist_mean = mean(distance, na.rm = TRUE),
                   delay_mean = mean(arr_delay, na.rm = TRUE),
                   .groups = "keep")

delay

delay1 <- table %>% group_by(dest, lat, lon) %>%
  summarise(mean_delay= mean(arr_delay, na.rm = TRUE), .groups = "keep")
# delay1 <- table %>% group_by(lat) %>%
#   summarise(mean1= mean(dep_delay))
# delay2 <- table %>% group_by(lon) %>%
#   summarise(mean2= mean(dep_delay))
# delay <- delay1 %>% left_join(delay2, c("mean1"= "mean2"))
# delay<- rename(delay, mean = mean1)


p1 <- ggplot(delay1, aes(x = lat, y= mean1)) +
  geom_point(colour= "red") + geom_smooth() + ggtitle("Mean vs Lattitude") +
  theme(plot.title = element_text(hjust = 0.5))
p2 <- ggplot(delay, aes(x= lon, y = mean)) +
  geom_point(colour="green") + geom_smooth() + ggtitle("Mean vs Longitude") +
  theme(plot.title = element_text(hjust = 0.5))
p3 <- ggplot(delay1, aes(x=lat, y= lon, colour = mean_delay))+
  geom_point()  + ggtitle("Longitude vs Lattitude") +
  theme(plot.title = element_text(hjust = 0.5))
p4 <- ggplot(delay1, aes(x=lat, y= mean1))+
  geom_point() + geom_smooth() + ggtitle("Longitude vs Lattitude") +
  theme(plot.title = element_text(hjust = 0.5))
p4
(p1+p2)/(p3+p4)
