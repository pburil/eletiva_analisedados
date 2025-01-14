library(data.table)
library(dplyr)
library(tidyverse)
library(funModeling) 

# c�digo aula EDA - Limpeza

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

latin_america_countries <-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela") # vetor que identifica pa�ses latino americanos

latin_america <- general_data %>% filter(location %in% latin_america_countries) # filtra casos apenas no vetor

latin_america <- latin_america %>% select(location, new_cases, new_deaths)

status(latin_america) # estrutura dos dados (missing etc)
freq(latin_america) # frequ�ncia das vari�veis fator
plot_num(latin_america) # explora��o das vari�veis num�ricas
profiling_num(latin_america) # estat�sticas das vari�veis num�ricas

latin_america %>% filter(new_cases < 0)

latin_america <- latin_america %>% filter(new_cases>=0)

latin_america <- latin_america %>% filter(!is.na(new_deaths)) %>% filter(!is.na(new_cases))