library(data.table)
library(funModeling)
library(tidyverse)

url <- "https://raw.githubusercontent.com/pburil/ClustersClimateChangePerceptionBRA/main/percepcao_climatica_codigos.csv"

download.file(url, "percepcao_climatica_codigos.csv", mode = "wb")

banco_codigos <- read.csv("percepcao_climatica_codigos.csv", sep = ',', encoding = "UTF-8")

## Shadow Matrix da nossa base de covid19 com adapta��es

banco_na <- as.data.frame(abs(is.na(banco_codigos))) # cria a matriz sombra da base de covid19

banco_na <- banco_na[which(sapply(banco_na, sd) > 0)] # mant�m vari�veis com NA
round(cor(banco_na), 3) # calcula correla��es

# modifica��o j� que v�o temos uma base num�rica
banco_na <- cbind(banco_na, REGIAO = banco_codigos$REGIAO) # trazemos uma vari�vel de interesse (munic�pios) de volta pro frame


banco_final <- banco_na %>% group_by(REGIAO) %>% summarise(across(everything(), list(sum))) # sumarizamos e observamos se os NA se concentram nos munic�pios com mais casos