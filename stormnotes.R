setwd("~/Documents/datascience/reproducible-research/storm")
storm <- read.csv(bzfile("repdata_data_StormData.csv.bz2"))
by_ev <- group_by(storm, EVTYPE)

test <- summarise(by_ev, sum(FATALITIES))

## head(test[order(test$'sum(FATALITIES)', decreasing = TRUE, na.last = TRUE),])

fatal <- test[test$tot_fatalities != 0, ]
fatal <- fatal[order(fatal$tot_fatalities, decreasing = TRUE),]

top <- fatal$tot_fatalities[1:10]
names(top) <- fatal$EVTYPE[1:10]
barplot(top)