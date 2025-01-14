library(tidyverse)
library(ggplot2)
install.packages("funModeling")
library(funModeling)
install.packages("poliscidata")
library(poliscidata)

glimpse(nes)
head(nes)
tail(nes)
status(nes)
profiling_num(nes)


banco <- nes

ggplot(banco, aes(obama_therm)) +
  geom_density()

ggplot(banco, aes(y = dem_age6)) +
  geom_bar()

