library(ggplot2)

october <- read.csv(file="./october.csv", 
                          header = FALSE, sep=",",as.is=TRUE)

ggplot(october, aes(V1, V2)) + geom_histogram(stat = 'identity') + 
  ggtitle('Histogram of Number of Requests Made for Every Day of October') +
    scale_x_continuous(name="Days in October", breaks = c(seq(1,31,by=1))) +
  ylab('Number of Requests')

ggsave(file="october.png")
