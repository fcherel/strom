library(dplyr)
library(ggplot2)

setwd("~/Documents/datascience/reproducible-research/storm")
storm <- read.csv(bzfile("repdata_data_StormData.csv.bz2"))
by_ev <- group_by(storm, EVTYPE)

test <- summarise(by_ev, sum(FATALITIES))
names(test)[2] <- "SUM_FATAL"

## head(test[order(test$'sum(FATALITIES)', decreasing = TRUE, na.last = TRUE),])

fatal <- test[test$SUM_FATAL != 0, ]
fatal <- fatal[order(fatal$SUM_FATAL, decreasing = TRUE),]

top <- fatal$SUM_FATAL[1:10]
names(top) <- fatal$EVTYPE[1:10]
barplot(top)